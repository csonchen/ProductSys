﻿
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DTcms.Web.aspx.fg
{
    public partial class productLawList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取地址栏的法规类别id
            string category_id = Request.QueryString["category_id"] == null ? "0" : Request.QueryString["category_id"];

            //绑定左边菜单栏
            this.LawNavBind();
            //
            ShowLawList(category_id);
        }

        //显示产品法规列表
        private void ShowLawList(string category_id)
        {
            int channelID = 13;
            BLL.article BLL_article = new BLL.article();

            DataTable dt = null;
            if ("0".Equals(category_id))
            {
                //查找法规内容(全部)
                dt = BLL_article.GetList(0, "channel_id=" + channelID, "sort_id asc,id desc",true).Tables[0];
            }
            else 
            {
                //部分查找法规内容（按类别）
                dt = BLL_article.GetList(0,"category_id=" + category_id,"sort_id asc,id desc",true).Tables[0];
            }

            string LawJson = "{'laws':[ ";

            foreach(DataRow dr in dt.Rows)
            {
                //分别把id,标题，类型名称,更新时间，文件路径，文件类型，修改者加入JSON
                LawJson += "{'id':'" + dr["id"].ToString();
                LawJson += "','title':'" + dr["title"].ToString();
                LawJson += "','category':'" + dr["category"].ToString();
                LawJson += "','updateTime':'" + dr["update_time"].ToString().Substring(0, dr["update_time"].ToString().Length - 3);

                //用于匹配文件后缀类型的正则
                Regex fileRegex = new Regex("^(doc|docx|wps)$");
                Regex pdfRegex = new Regex("^(pdf)$");
                Regex txtRegex = new Regex("^(txt)$");
                Regex excelRegex = new Regex("^(xls|xlsx)$");
                //文件路径
                string suffix = dr["file_ext"].ToString(); ;//
                LawJson += "','file_path':'" + dr["file_path"].ToString();// 
                //正则匹配
                if (fileRegex.Match(suffix).Success)//如果匹配成功
                {
                    LawJson += "','type':'doc";
                }
                else if (pdfRegex.Match(suffix).Success)
                {
                    LawJson += "','type':'pdf"; ;
                }
                else if (txtRegex.Match(suffix).Success)
                {
                    LawJson += "','type':'txt";
                }
                else if (excelRegex.Match(suffix).Success)
                {
                    LawJson += "','type':'excel";
                }
                else
                {
                    LawJson += "','type':'";
                }

                LawJson += "','modify_person':'" + dr["real_name"].ToString() + "'},";
                
            }
            LawJson = LawJson.Substring(0, LawJson.Length - 1) + "]}";
            this.LawJson.Value = LawJson;
        }
   
        //绑定左边菜单栏
        private void LawNavBind()
        {
            int channel_id = 13;
            BLL.article_category BLL_category = new BLL.article_category();
            //返回产品法规列表
            DataTable dt = BLL_category.GetListByChannelID(channel_id);
            foreach (DataRow dr in dt.Rows)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("class","law_list");
                HtmlImage img = new HtmlImage();
                img.Src = "../../images/folder.gif";
                HtmlAnchor aElement = new HtmlAnchor();
                string title = dr["title"].ToString();
                string category_id = dr["id"].ToString();
                aElement.HRef = "productLawList.aspx?category_id=" + category_id;
                aElement.InnerHtml = title;
                //元素添加到前台控件中
                li.Controls.Add(img);
                li.Controls.Add(aElement);
                this.law_nav.Controls.Add(li);
            }

        }
    }
}