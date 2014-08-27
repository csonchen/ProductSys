using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FSHH.HQ.XYJ.Web.xyj.Vendor.CertifcateCategory;
using System.Data;
using DTcms.Common;
using System.Text;

namespace DTcms.Web.aspx.product
{
    public partial class productDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string straction = "";
            if (Request.QueryString == null || Request.QueryString.Keys.Count <= 0 || Request.QueryString["action"] == null) { }
            else
            {
                straction = Request.QueryString["action"].ToString();
            }
            if (Request.Form == null || Request.Form.Keys.Count <= 0 || Request.Form["action"] == null) { }
            else
            {
                if (straction.Trim() == "")
                {
                    straction = Request.Form["action"].ToString();
                }
            }
            if (straction == "")
            {
                //获取产品页面传递过来的产品ID
                string strArticleId = "";
                if (Request.QueryString == null || Request.QueryString.Keys.Count <= 0) { }
                else { strArticleId = Request.QueryString["articleId"].ToString(); }
                if (strArticleId.Trim() == "")
                {
                    Response.Redirect("Index.aspx");
                }
                BLL.article art = new BLL.article();
                int artcleId = Convert.ToInt32(strArticleId);
                DataTable tb = art.GetSingleArticleById(artcleId).Tables[0];
                relist1.DataSource = tb;
                relist1.DataBind();
                relist2.DataSource = tb;
                relist2.DataBind();
                //GetHotProduct();
                //relistAtrribute
                DataTable attTB = art.GetAttributeById(artcleId).Tables[0];
                relistAtrribute.DataSource = attTB;
                relistAtrribute.DataBind();
                //replistContent
                DataTable contentTB = art.GetSingleArticleById(artcleId).Tables[0];
                replistContent.DataSource = contentTB;
                replistContent.DataBind();

            }
            else if (straction == "GetProductFirstClass") { GetProductFirstClass(); }
        }
        public void GetProductFirstClass()
        {
            //channel_id,category_id
            string strchannel_id = StringTrim(Request.Form["channel_id"]);
            int ichannel = 0;
            try { ichannel = Convert.ToInt32(strchannel_id == "" ? "0" : strchannel_id); }
            catch { }
            string strcategory_id = StringTrim(Request.Form["currentclass"]);
            int icategory_id = 0;
            try { icategory_id = Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id); }
            catch { }
            BLL.category attBll = new DTcms.BLL.category();
            StringBuilder sbCate = new StringBuilder();
            //string strWhere = " ";
            Model.category info = attBll.GetModel(icategory_id);//需要加上品牌和分类大类标识过滤
            string firstclass = "";
            if (info != null)
            {
                firstclass = info.class_list;
                string[] ss = firstclass.Split(new string[] { "," }, StringSplitOptions.None);
                if (ss != null && ss.Length >= 2)
                {
                    firstclass = ss[1];
                }
            }
            ResultView view = new ResultView();
            view.putData("firstclass", firstclass);
            outResult(view);
        }
        string StringTrim(string s)
        {
            string value = s;
            if (s == "undefined" || s == "null" || s == null) { value = ""; }
            return value;
        }
        public void outResult(object result)
        {
            Response.ContentType = "text/plain";
            Response.Clear();
            string strresult = JsonHelper.Serialize(result);
            Response.Write(strresult);
            Response.End();
        }
        //热点产品
        private void GetHotProduct()
        {
            //BLL.article art = new BLL.article();
            //DataTable tb = art.GetGoodsListByHot(1, 1, 2).Tables[0];
            //hotProId.DataSource = tb;
            //hotProId.DataBind();
        }
    }
}