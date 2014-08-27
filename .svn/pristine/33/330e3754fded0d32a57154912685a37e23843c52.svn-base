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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //动态绑定产品法规类别
            LawNav();
            //动态绑定产品类别
            ProductTypeNav();
        }

       

        //产品法规列表
        private void LawNav()
        {
            int channel_id = 13;
            BLL.article_category BLL_category = new BLL.article_category();
            //返回产品法规列表
            DataTable dt = BLL_category.GetListByChannelID(channel_id);
            foreach (DataRow dr in dt.Rows)
            {
                HtmlAnchor aElement = new HtmlAnchor();
                string title = dr["title"].ToString();
                string category_id = dr["id"].ToString();
                aElement.HRef = "productLawList.aspx?category_id=" + category_id;
                aElement.InnerHtml = title;
                //元素添加到前台控件中
                this.law_nav.Controls.Add(aElement);
            }

        }
   
        //上市产品资源列表
        private void ProductTypeNav()
        {
            //按销售平台分类
            Model.article_attribute_field platform = new BLL.article_attribute_field().GetModel(2);
            //赋值选项
            string[] valArr = platform.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    HtmlAnchor a = new HtmlAnchor();
                    a.HRef = "./productList.aspx?platform=" + valItemArr[1];
                    a.InnerHtml = valItemArr[0];
                    this.productType_nav.Controls.Add(a);
                }
            }
        }
    }
}