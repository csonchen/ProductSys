using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DTcms.Web.aspx.fg
{
    public partial class leftNav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NavBind();
        }

        #region 绑定左边导航栏内容=================================
        private void NavBind()
        {
            //按产品类型分类
            BLL.channel bll = new BLL.channel();
            //选出产品体系中的所有频道
            DataTable dt = bll.GetList(0, "category_id = 1", "sort_id asc,id desc").Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                HtmlAnchor a = new HtmlAnchor();
                a.HRef = "productClassify.aspx?id=" + dr["id"].ToString();
                a.InnerHtml = dr["title"].ToString();
                li.Controls.Add(a);
                this.type_classify.Controls.Add(li);
            }

            //按产品状态分类
            Model.article_attribute_field product_status = new BLL.article_attribute_field().GetModel(3);
            //赋值选项
            string[] valArr1 = product_status.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr1.Length; i++)
            {
                string[] valItemArr = valArr1[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    HtmlAnchor a = new HtmlAnchor();
                    a.HRef = "productList.aspx?product_status=" + valItemArr[1];
                    a.InnerHtml = valItemArr[0];
                    li.Controls.Add(a);
                    this.product_status_classify.Controls.Add(li);
                }
            }

            //按销售平台分类
            Model.article_attribute_field platform = new BLL.article_attribute_field().GetModel(2);
            //赋值选项
            string[] valArr = platform.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    HtmlAnchor a = new HtmlAnchor();
                    a.HRef = "productList.aspx?platform=" + valItemArr[1];
                    if (valItemArr[0].Length > 4)
                        a.InnerHtml = valItemArr[0].Substring(0, 3);
                    else
                        a.InnerHtml = valItemArr[0];
                    li.Controls.Add(a);
                    this.platform_classify.Controls.Add(li);
                }
            }
        }
        #endregion
    }
}