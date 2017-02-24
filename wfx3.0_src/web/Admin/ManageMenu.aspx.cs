using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Admin_ManageMenu : Page//Hidistro.UI.ControlPanel.Utility.AdminPage//Page
{
    XmlDocument xmldoc;
    XmlNode xmlnode;
    XmlElement xmlelem;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            xmldoc = new XmlDocument();
            xmldoc.Load(GetMasterSettingsFilename("Menu_Select"));
            XmlNode root = xmldoc.SelectSingleNode("Menu");
            this.hiSelectIDS.Value = root.InnerText;
        }
    }

    private static string GetMasterSettingsFilename(string fileName)
    {
        HttpContext current = HttpContext.Current;
        return ((current != null) ? current.Request.MapPath("~/Admin/"+fileName+".xml") : Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Admin\"+fileName+".xml"));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        xmldoc = new XmlDocument();
        xmldoc.Load(GetMasterSettingsFilename("Menu_Select"));
        XmlNode root = xmldoc.SelectSingleNode("Menu");
        root.InnerText = this.hiSelectIDS.Value;
        xmldoc.Save(GetMasterSettingsFilename("Menu_Select"));

        string[] arrayID = this.hiSelectIDS.Value.Trim(',').Split(',');
        string[] arrayName = this.hiSelectNameS.Value.Split(',');
        string[] arrayLink = this.hiSelectLinkS.Value.Split(',');
        string strMenuTypeName=string.Empty;

        XmlTextWriter xmlWriter;
        string strFilename = GetMasterSettingsFilename("Menu");

        xmlWriter = new XmlTextWriter(strFilename, Encoding.UTF8);//创建一个xml文档
        xmlWriter.Formatting = Formatting.Indented;
        xmlWriter.WriteStartDocument();
        xmlWriter.WriteStartElement("Menu");

        for (int i=0; i < arrayID.Length; i++)
        {
            if (i > 0)
            {
                int j = arrayID[i - 1].Length - arrayID[i].Length + 1;
                for (int k = 0; k < j; k++)
                    xmlWriter.WriteEndElement();
            }
            switch (arrayID[i].Length)
            { 
                case 1:
                    strMenuTypeName="Module";
                    break;
                case 2:
                    strMenuTypeName = "Item";
                    break;
                case 3:
                    strMenuTypeName = "PageLink";
                    break;
            }
            xmlWriter.WriteStartElement(strMenuTypeName);
            xmlWriter.WriteAttributeString("Title", arrayName[i]);
            xmlWriter.WriteAttributeString("Link", arrayLink[i]);
        }
        xmlWriter.Close();
        string str = string.Format("ShowMsg(\"{0}\", {1})", "保存功能配置菜单生效。", "true");
        if (!this.Page.ClientScript.IsClientScriptBlockRegistered("ServerMessageScript"))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "ServerMessageScript", "<script language='JavaScript' defer='defer'>setTimeout(function(){" + str + "},300);</script>");
        }
    }
}