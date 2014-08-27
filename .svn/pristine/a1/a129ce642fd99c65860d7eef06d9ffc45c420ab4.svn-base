using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.aspx
{
    public partial class showDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = Request.QueryString["filePath"];
            //提取地址栏后缀格式
            Regex fileRegex = new Regex("^(doc|docx|wps|txt|xls|xlsx)$");
            string suffix = fileName.Split('.')[1];
            Match match = fileRegex.Match(suffix);
            //匹配相应的文件，重定向到相应页面
            if (match.Success) //成功匹配文档文件
            {
                string str = fileName.Split('.')[0];
                string htmlPath = str + ".html";
                Response.Redirect("../.." + htmlPath);
            }
            else if ("pdf".Equals(fileName.Split('.')[1]))//成功匹配pdf文件
            {
                string str = fileName.Split('.')[0];
                string htmlPath = str + ".pdf";
                Response.Redirect("../.." + htmlPath);
            }
        }
    }
}