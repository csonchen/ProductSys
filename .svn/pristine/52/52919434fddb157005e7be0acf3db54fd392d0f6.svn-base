using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using DTcms.Common;

namespace DTcms.Web.aspx.fg
{
    public partial class productList : System.Web.UI.Page
    {
        
        //页面加载事件
        protected void Page_Load(object sender, EventArgs e)
        {
            // 获取销售平台分类
            //int platformID = int.Parse(Request.QueryString["platform"]) == null ? 0 : int.Parse(Request.QueryString["platform"]);
            String platform = Request.QueryString["platform"] == null ? "-1" : Request.QueryString["platform"];
            //获取产品状态分类
            String product_status = Request.QueryString["product_status"] == null ? "-1" : Request.QueryString["product_status"];

            //绑定产品分类及内容
            ItemBind(platform, product_status);
        }

        #region 绑定右边框体内容=================================
        private void ItemBind(string platform, string product_status)
        {
            BLL.channel BLL_channel = new BLL.channel();
            DataTable channels = BLL_channel.GetList(0, "category_id = 1", "sort_id asc,id desc").Tables[0];

            BLL.article BLL_article = new BLL.article();

            foreach (DataRow channel in channels.Rows)
            {
                //添加产品类型
                HtmlGenericControl product_item = new HtmlGenericControl("div");
                product_item.Attributes.Add("class", "item_type");
                product_item.InnerHtml = channel["title"].ToString();
                this.products.Controls.Add(product_item);
                //添加产品链接
                HtmlGenericControl item_content = new HtmlGenericControl("div");
                item_content.Attributes.Add("class", "item_content");
                DataTable articles = null;

                //如果是按销售平台分类或按产品状态分类，就取出对应产品内容
                if (platform != "-1")
                    articles = BLL_article.GetList(0, "channel_id=" + channel["id"].ToString(), "platform", platform, "sort_id asc,id desc").Tables[0];
                else if (product_status != "-1")
                    articles = BLL_article.GetList(0, "channel_id=" + channel["id"].ToString(), "product_status", product_status, "sort_id asc,id desc").Tables[0];
                else
                    articles = BLL_article.GetList(0, "channel_id=" + channel["id"].ToString(), "sort_id asc,id desc").Tables[0];
                
                //articles.Rows.Count
                foreach (DataRow article in articles.Rows)
                {
                    HtmlAnchor a = new HtmlAnchor();
                    string title = article["title"].ToString();
                    if (title.Length > 12)
                    {
                        a.InnerHtml = title.Substring(0, 12) + "...";
                        a.Title = title;
                    }
                    else
                    {
                        a.InnerHtml = title;
                    }
                    a.HRef = "productDetail.aspx?id=" + article["id"].ToString();
                   
                    item_content.Controls.Add(a);
                }
                this.products.Controls.Add(item_content);
            }
        }
        #endregion

        
    }
}