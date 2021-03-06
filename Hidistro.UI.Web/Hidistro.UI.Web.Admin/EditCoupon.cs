using ASPNET.WebControls;
using Hidistro.ControlPanel.Config;
using Hidistro.ControlPanel.Promotions;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Entities.Comments;
using Hidistro.Entities.Promotions;
using Hidistro.Entities.Store;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using Hishop.Components.Validation;
using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin
{
	[PrivilegeCheck(Privilege.Coupons)]
	public class EditCoupon : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnEditCoupons;
		protected WebCalendar calendarEndDate;
		protected WebCalendar calendarStartDate;
		private int couponId;
		protected System.Web.UI.WebControls.Label lblEditCouponId;
		protected System.Web.UI.WebControls.TextBox txtAmount;
		protected System.Web.UI.WebControls.TextBox txtCouponName;
		protected System.Web.UI.WebControls.TextBox txtDiscountValue;
		protected System.Web.UI.WebControls.TextBox txtNeedPoint;
        protected DropDownList DDLservice;
        protected DropDownList DDLcategory;
        protected HtmlInputHidden hidIsSanZuo;

		private void btnEditCoupons_Click(object sender, System.EventArgs e)
		{
			decimal? nullable;
			decimal num;
			int num2;
			if (this.ValidateValues(out nullable, out num, out num2))
			{
				if (!this.calendarStartDate.SelectedDate.HasValue)
				{
					this.ShowMsg("请选择开始日期！", false);
				}
				else
				{
					if (!this.calendarEndDate.SelectedDate.HasValue)
					{
						this.ShowMsg("请选择结束日期！", false);
					}
					else
					{
						if (this.calendarStartDate.SelectedDate.Value.CompareTo(this.calendarEndDate.SelectedDate.Value) >= 0)
						{
							this.ShowMsg("开始日期不能晚于结束日期！", false);
						}
						else
						{
							string msg = string.Empty;
							CouponInfo target = new CouponInfo();
                            if (CustomConfigHelper.Instance.IsSanzuo)
                            {
                                target.CouponId = this.couponId;
                                target.Name = this.txtCouponName.Text;
                                target.ClosingTime = this.calendarEndDate.SelectedDate.Value;
                                target.StartTime = this.calendarStartDate.SelectedDate.Value;
                                if (this.DDLcategory.SelectedValue != "未选择")
                                {
                                    target.CategoryId = Convert.ToInt32(this.DDLcategory.SelectedValue);
                                }
                                else {
                                    target.CategoryId = 0;
                                }
                                if (this.DDLservice.SelectedValue != "未选择")
                                {
                                    target.SenderId = Convert.ToInt32(this.DDLservice.SelectedValue);
                                }
                                else {
                                    target.SenderId = 0;
                                }
                                target.Amount = nullable;
                                target.DiscountValue = num;
                                target.NeedPoint = num2;
                            }
                            else 
                            {
                                target.CouponId = this.couponId;
                                target.Name = this.txtCouponName.Text;
                                target.ClosingTime = this.calendarEndDate.SelectedDate.Value;
                                target.StartTime = this.calendarStartDate.SelectedDate.Value;                              
                                target.Amount = nullable;
                                target.DiscountValue = num;
                                target.NeedPoint = num2;                          
                            }							
							ValidationResults results = Validation.Validate<CouponInfo>(target, new string[]
							{
								"ValCoupon"
							});
							if (!results.IsValid)
							{
								using (System.Collections.Generic.IEnumerator<ValidationResult> enumerator = ((System.Collections.Generic.IEnumerable<ValidationResult>)results).GetEnumerator())
								{
									if (enumerator.MoveNext())
									{
										ValidationResult result = enumerator.Current;
										msg += Formatter.FormatErrorMessage(result.Message);
                                        this.ShowMsg(msg, false); 
										return;
									}
								}
							}
							CouponActionStatus status = CouponHelper.UpdateCoupon(target);
							if (status == CouponActionStatus.Success)
							{
								this.RestCoupon();
								this.ShowMsg("成功修改了优惠券信息", true);
							}
							else
							{ 
								if (status == CouponActionStatus.DuplicateName)
								{
									this.ShowMsg("修改优惠券信息错误,已经具有此优惠券名称", false);
								}
								else
								{
									this.ShowMsg("未知错误", false);
									this.RestCoupon();
								}
							}
						}
					}
				}
			}
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!int.TryParse(this.Page.Request.QueryString["couponId"], out this.couponId))
			{
				base.GotoResourceNotFound();
			}
			else
			{
				this.btnEditCoupons.Click += new System.EventHandler(this.btnEditCoupons_Click);
				if (!this.Page.IsPostBack)
				{                     
                    if (CustomConfigHelper.Instance.IsSanzuo == true || CustomConfigHelper.Instance.BrandShow)
                    {
                        hidIsSanZuo.Value = "1";
                        List<CategoryQuery> category = new List<CategoryQuery>();
                        category = CouponHelper.GetHishop_Categories();
                        DDLcategory.Items.Add("未选择");
                        foreach (CategoryQuery ca in category)
                        {
                            ListItem item = new ListItem();
                            item.Text = ca.Name;
                            item.Value = ca.CategoryId.ToString();
                            DDLcategory.Items.Add(item);
                        }
                        List<CategoryQuery> clientuser = new List<CategoryQuery>();
                        clientuser = CouponHelper.Getaspnet_ManagersClientUserId();
                        DDLservice.Items.Add("未选择");
                        foreach (CategoryQuery ct in clientuser)
                        {
                            ListItem item = new ListItem();
                            item.Text = ct.UserName;
                            item.Value = ct.ClientUserId.ToString();
                            DDLservice.Items.Add(item);
                        }
					CouponInfo coupon = CouponHelper.GetCoupon(this.couponId);
                    if (coupon == null)
                    {
                        base.GotoResourceNotFound();
                    }
                    else
                    {
                        if (coupon.ClosingTime.CompareTo(System.DateTime.Now) < 0)
                        {
                            this.ShowMsg("该优惠券已经结束！", false);
                        }
                        else
                        {
                            Globals.EntityCoding(coupon, false);
                            this.lblEditCouponId.Text = coupon.CouponId.ToString();

                            this.txtCouponName.Text = coupon.Name;
                            if (coupon.Amount.HasValue)
                            {
                                this.txtAmount.Text = string.Format("{0:F2}", coupon.Amount);
                            }
                            this.txtDiscountValue.Text = coupon.DiscountValue.ToString("F2");
                            this.calendarEndDate.SelectedDate = new System.DateTime?(coupon.ClosingTime);
                            this.calendarStartDate.SelectedDate = new System.DateTime?(coupon.StartTime);
                            this.DDLcategory.SelectedValue = coupon.CategoryId.ToString();
                            this.DDLservice.SelectedValue = coupon.SenderId.ToString();
                            this.txtNeedPoint.Text = coupon.NeedPoint.ToString();
                        }
                    }
				}                  
			}
		}
	}
		private void RestCoupon()
		{
			this.lblEditCouponId.Text = string.Empty;
			this.txtCouponName.Text = string.Empty;
			this.txtAmount.Text = string.Empty;
			this.txtDiscountValue.Text = string.Empty;
		}
		private bool ValidateValues(out decimal? amount, out decimal discount, out int needPoint)
		{
			string str = string.Empty;
			amount = new decimal?(0m);
			if (!string.IsNullOrEmpty(this.txtAmount.Text.Trim()))
			{
				decimal num;
				if (decimal.TryParse(this.txtAmount.Text.Trim(), out num))
				{
					amount = new decimal?(num);
				}
				else
				{
					str += Formatter.FormatErrorMessage("满足金额必须为0-1000万之间");
				}
			}
			if (!int.TryParse(this.txtNeedPoint.Text.Trim(), out needPoint))
			{
				str += Formatter.FormatErrorMessage("兑换所需积分不能为空，大小0-10000之间");
			}
			if (!decimal.TryParse(this.txtDiscountValue.Text.Trim(), out discount))
			{
				str += Formatter.FormatErrorMessage("可抵扣金额必须在0.01-1000万之间");
			}
			bool result;
			if (!string.IsNullOrEmpty(str))
			{
				this.ShowMsg(str, false);
				result = false;
			}
			else
			{
				result = true;
			}
			return result;
		}
	}
}
