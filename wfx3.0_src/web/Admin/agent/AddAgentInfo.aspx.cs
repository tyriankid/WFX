using Hidistro.ControlPanel.Members;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Enums;
using Hidistro.Entities.Members;
using Hidistro.Entities.Store;
using Hidistro.SqlDal.Members;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin.agent
{
    public partial class AddAgentInfo : AdminPage
    {
        private void btnCreate_Click(object sender, System.EventArgs e)
        {
            //实例会员信息
            MemberInfo member = new MemberInfo();
            string generateId = Globals.GetGenerateId();
            member.GradeId = new MemberGradeDao().GetDefaultMemberGrade();
            member.UserName = this.txtUserName.Text.Trim();
            member.CreateDate = DateTime.Now;
            member.SessionId = generateId;
            member.SessionEndTime = DateTime.Now.AddYears(10);
            member.Password = HiCryptographer.Md5Encrypt("888888");
            if ((new MemberDao().GetusernameMember(member.UserName) == null) && new MemberDao().CreateMember(member))
            {
                //根据推荐人获取相关信息
                string referralPath = string.Empty;
                string agentPath = string.Empty;
                string distributorname = this.txtReferralUserId.Text;
                int referruserId = MemberHelper.IsExiteDistributorNames(distributorname);
                DistributorGrade threeDistributor = DistributorGrade.ThreeDistributor;
                if (referruserId > 0)
                {
                    referralPath = new DistributorsDao().GetDistributorInfo(referruserId).ReferralPath;
                    agentPath = string.IsNullOrEmpty(referralPath) ? referruserId.ToString() : referralPath + "|" + referruserId.ToString();
                    if (string.IsNullOrEmpty(referralPath))
                    {
                        referralPath = referruserId.ToString();
                        threeDistributor = DistributorGrade.TowDistributor;
                    }
                    else if (referralPath.Contains("|"))
                    {
                        referralPath = referralPath.Split(new char[] { '|' })[1] + "|" + referruserId.ToString();
                    }
                    else
                    {
                        referralPath = referralPath + "|" + referruserId.ToString();
                    }
                }

                //实例分销商信息
                DistributorsInfo distributor = new DistributorsInfo
                {
                    UserId = new MemberDao().GetusernameMember(member.UserName).UserId,
                    RequestAccount = "",
                    StoreName = txtStoreName.Text.Trim(),
                    StoreDescription = "",
                    BackImage = "",
                    Logo = "",
                    DistributorGradeId = threeDistributor,
                    IsAgent = 1,
                    AgentGradeId = int.Parse(ddlAgentGrade.SelectedValue.ToString()),
                    AgentPath = agentPath
                };
                distributor.UserId.ToString();
                distributor.ReferralPath = referralPath;
                distributor.ParentUserId = new int?(Convert.ToInt32(referruserId));
                DistributorGradeInfo isDefaultDistributorGradeInfo = new DistributorsDao().GetIsDefaultDistributorGradeInfo();
                distributor.DistriGradeId = isDefaultDistributorGradeInfo.GradeId;
                if (new DistributorsDao().CreateAgent(distributor))
                {
                    this.ShowMsgAndReUrl("添加成功！", true, "../distributor/distributorlist.aspx?isagent=1");
                }
            }
            else
            {
                this.ShowMsg(string.Format("账号【{0}】已存在", member.UserName), false);
            }
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!string.IsNullOrEmpty(base.Request["action"]) && base.Request["action"] == "SearchKey")
            {
                string allDistributorsName = string.Empty;
                if (!string.IsNullOrEmpty(base.Request["keyword"]))
                {
                    allDistributorsName = MemberHelper.GetAgentDistributorsName(base.Request["keyword"]);
                }
                base.Response.ContentType = "application/json";
                base.Response.Write("{\"data\":[" + allDistributorsName + "]}");
                base.Response.End();
            }
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            if (!this.Page.IsPostBack)
            {
                this.ddlAgentGrade.DataBind();
                this.ddlAgentGrade.Items.Insert(0,new ListItem("--请选择--",""));
            }
        }
    }
}
