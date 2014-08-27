using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FSHH.HQ.XYJ.Web.xyj.Vendor.CertifcateCategory;
using DTcms.BLL;
using System.Text;
using DTcms.Common;
using System.IO;

namespace DTcms.Web.aspx.product
{
    public partial class Index : System.Web.UI.Page
    {
        //public static string cc = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            // cc = Request.QueryString["action"].ToString();
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

            }
            else if (straction == "GetProductByClass") { GetProductByClass(); }
            else if (straction == "GetProductClass") { GetProductClass(); }
            else if (straction == "GetProductType") { GetProductType(); }
            else if (straction == "GetCompanyName") { GetCompanyName(); }
            else if (straction == "GetHotProduct") { GetHotProduct(); }
            else if (straction == "DataImport") { GetProductByClass(); }

            //if (Request.QueryString == null || Request.QueryString.Keys.Count <= 0) { cc = ""; }
            //else { cc = Request.QueryString["outId"].ToString(); }
        }
        /// <summary>
        /// 根据父Id查询分类
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptypelist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                BLL.category bllCate = new BLL.category();
                StringBuilder sbCate = new StringBuilder();
                Repeater rep = e.Item.FindControl("replist5") as Repeater;//找到里层的repeater对象
                DataRowView rowv = (DataRowView)e.Item.DataItem;//找到分类Repeater关联的数据项 
                int typeid = Convert.ToInt32(rowv["id"]); //获取填充子类的id 
                //rep.DataSource = bllCate.GetChildList(typeid);
                rep.DataSource = bllCate.GetChildListById(typeid);
                rep.DataBind();
            }
        }

        //获取品牌名称
        public void GetCompanyName()
        {
            string strchannel_id = StringTrim(Request.Form["channel_id"]);
            int channelId = Convert.ToInt32(strchannel_id);
            BLL.article art = new article();
            StringBuilder strArt = new StringBuilder();
            DataTable tb = art.GetListByChannield(channelId).Tables[0];
            ResultView view = new ResultView();
            view.putData("companyTB", tb);
            outResult(view);
        }
        /// <summary>
        /// 热点产品
        /// </summary>
        public void GetHotProduct()
        {
            string strpageindex1 = StringTrim(Request.Form["pageindex1"]);
            int pageindex1 = 0;
            try { pageindex1 = Convert.ToInt32(strpageindex1 == "" ? "0" : strpageindex1); }
            catch { }
            string strpageindex2 = StringTrim(Request.Form["pageindex2"]);
            int pageindex2 = 0;
            try { pageindex2 = Convert.ToInt32(strpageindex2 == "" ? "0" : strpageindex2); }
            catch { }
            string strchannel_id = StringTrim(Request.Form["channel_id"]);
            int ichannel = 0;
            try { ichannel = Convert.ToInt32(strchannel_id == "" ? "0" : strchannel_id); }
            catch { }
            string strcategory_id = StringTrim(Request.Form["category_id"]);
            //string strcategory_id = StringTrim(Request.Form["currentclass"]);
            int icategory_id = 0;
            try { icategory_id = Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id); }
            catch { }
            string productname = StringTrim(Request.Form["productname"]);
            article art = new article();
            StringBuilder strarticle = new StringBuilder();
            string strIs_hot = StringTrim(Request.Form["is_hot"]);
            int isHot = Convert.ToInt32(strIs_hot);
            DataTable tbH = art.GetGoodsListByHot(isHot, pageindex1, pageindex2, ichannel, icategory_id, productname).Tables[0];
            ResultView view = new ResultView();
            int pagesize = 0;
            if (tbH != null && tbH.Rows.Count > 0) { pagesize = tbH.Rows.Count; }
            view.putData("hotProductTB", tbH);
            view.putData("pagesize", pagesize);
            outResult(view);
        }
        //获取产品属性表
        public void GetProductClass()
        {
            //channel_id,category_id
            string strchannel_id = StringTrim(Request.Form["channel_id"]);
            int ichannel = 0;
            try { ichannel = Convert.ToInt32(strchannel_id == "" ? "0" : strchannel_id); }
            catch { }
            string strcategory_id = StringTrim(Request.Form["category_id"]);
            int icategory_id = 0;
            try { icategory_id = Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id); }
            catch { }
            BLL.attributes attBll = new attributes();
            StringBuilder sbCate = new StringBuilder();
            string strWhere = " ";
            strWhere += " and attr.channel_id=" + ichannel;
            strWhere += " and category_id=" + icategory_id;
            DataTable tb = attBll.GetListClass(strWhere).Tables[0];//需要加上品牌和分类大类标识过滤
            ResultView view = new ResultView();
            view.putData("proTable", tb);
            outResult(view);
        }
        //获取产品类别表
        public void GetProductType()
        {
            //data: { channel_id: strchannel_id, category_id: strcategory_id, class_layer: sclasslayer, parent_id: strParentId },
            string strchannel_id = StringTrim(Request.Form["channel_id"]);
            int ichannel = 0;
            try { ichannel = Convert.ToInt32(strchannel_id == "" ? "0" : strchannel_id); }
            catch { }
            string strcategory_id = StringTrim(Request.Form["category_id"]);
            int icategory_id = 0;
            try { icategory_id = Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id); }
            catch { }
            string parentId = StringTrim(Request.Form["parent_id"]);
            int sparentid = 0;
            try { sparentid = Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id); }
            catch { }
            string strWhere = "";
            if (strchannel_id.Trim() != "")
            {
                strWhere += " channel_id=" + Convert.ToInt32(strchannel_id == "" ? "0" : strchannel_id);
            }
            if (strcategory_id.Trim() != "")
            {
                strWhere += " and id=" + Convert.ToInt32(strcategory_id == "" ? "0" : strcategory_id);
            }
            if (parentId.Trim() != "")
            {
                strWhere += " and  parent_id=" + Convert.ToInt32(parentId == "" ? "0" : parentId);
            }
            //string strclass_layer = StringTrim(Request.Form["class_layer"]);
            BLL.category cat = new category();
            StringBuilder sbCate = new StringBuilder();
            DataTable tb = cat.GetChildList(icategory_id, ichannel);//
            ResultView view = new ResultView();
            view.putData("productClassTB", tb);
            outResult(view);
        }
        public void GetProductByClass()
        {
            //timesort: timesort, pricesort: pricesort, productsort: productsort, channel: channel, blandidlist: blandidlist, classidlist:classidlist, sourchtittle: sourchtittle, startIndex: page1, endIndex: page2 
            string strsorttype = StringTrim(Request.Form["sorttype"]);
            string strtimesort = StringTrim(Request.Form["timesort"]);
            string strpricesort = StringTrim(Request.Form["pricesort"]);
            string strproductsort = StringTrim(Request.Form["productsort"]);
            string strchannel = StringTrim(Request.Form["channel"]);
            string strclassid = StringTrim(Request.Form["classid"]);
            string strblandidlist = StringTrim(Request.Form["blandidlist"]);
            string strclassidlist = StringTrim(Request.Form["classidlist"]);
            string straddclasslist = StringTrim(Request.Form["addclasslist"]);
            string strsourchtittle = StringTrim(Request.Form["sourchtittle"]);
            string strstartIndex = StringTrim(Request.Form["startIndex"]);
            int istartIndex = Convert.ToInt32(strstartIndex == "" ? "1" : strstartIndex);
            string strendIndex = StringTrim(Request.Form["endIndex"]);
            int istendInde = Convert.ToInt32(strendIndex == "" ? "1" : strendIndex);
            string strprice1 = StringTrim(Request.Form["price1"]);
            float iprice1 = Convert.ToInt64(strprice1 == "" ? "0" : strprice1);
            string strprice2 = StringTrim(Request.Form["price2"]);
            float iprice2 = Convert.ToInt64(strprice2 == "" ? "0" : strprice2);
            string strDataImport = StringTrim(Request.Form["DataImport"]);
            int num = 0;
            article art = new article();
            string strWhere = " 1=1 ";
            string strOrderby = "";
            if (strchannel.Trim() != "" && strchannel.Trim() != "0")
            {
                strWhere += " and Channel_id=" + strchannel;
            }
            if (strclassid.Trim() == "null" || strclassid.Trim() == "" || strclassid.Trim() == "0")
            {
                strWhere += "";
            }
            else
            {
                strWhere += " and class_list like '%," + strclassid + ",%'";
            }
            if (strclassidlist.Trim() == "null" || strclassidlist.Trim() == "" || strclassidlist.Trim() == "0")
            {
                strWhere += "";
            }
            else
            {
                strWhere += " and Category_Id in (" + strclassid + ")";
            }
            if (iprice1 > 0) { strWhere += " and market_price>=" + iprice1; }
            if (iprice2 > 0) { strWhere += " and market_price<=" + iprice2; }
            //if (strblandidlist.Trim() != "" && strblandidlist.Trim() != "0")
            //{
            //    strWhere += " and company_id in (" + strblandidlist.Substring(0, strblandidlist.Length - 1) + ")";
            //}
            if (strblandidlist.Trim() != "")
            {
                string[] strBrandIds = null;
                string strBrandid = "";
                if (strblandidlist.Contains(","))
                {
                    strBrandIds = strblandidlist.Split(new string[] { "," }, StringSplitOptions.None);
                }
                else
                {
                    strBrandIds = new string[] { strblandidlist };
                }
                for (int i = 0; i < strBrandIds.Length; i++)
                {
                    strBrandid = strBrandIds[i];
                    if (strBrandid.Trim() != "" && strBrandid.Trim() != "0")
                    {
                        strWhere += " and company_id in (" + strblandidlist.Substring(0, strblandidlist.Length - 1) + ")";
                    }
                    else
                    {
                        strWhere += " and company_id in (select id  from dbo.dt_article where channel_id=3 ) ";
                    }
                }
            }
            if (strsourchtittle.Trim() != "" && strsourchtittle.Trim() != "0")
            {
                strWhere += " and Channel_id=2  and (rtrim(isnull(company_name,''))+title like '%" + strsourchtittle + "%' or attribute_content like '%" + strsourchtittle + "%')";
            }
            if (straddclasslist.Trim() != "")
            {
                string[] addclasslist = null;
                if (straddclasslist.Contains(","))
                {   straddclasslist = SortArr(straddclasslist);
                    addclasslist = straddclasslist.Split(new string[] { "," }, StringSplitOptions.None);
                }
                else { addclasslist = new string[] { straddclasslist }; }
                string strwh = "";
                string Prv_attributeid = "";
                for (int i = 0; i < addclasslist.Length; i++)
                {
                    string strclass = addclasslist[i];
                    string attributeid = "";
                    
                    attributeid = strclass.Substring(0,strclass.IndexOf('!'));
                    strclass = strclass.Substring(strclass.IndexOf('!') + 1, strclass.Length -1- strclass.IndexOf('!'));
                    if (i == 0)
                    {
                        strwh += " and exists (select 1 from view_newArticle_goods where id=a.id and attribute_id=" + attributeid + " and (attribute_content like '%" + strclass + "%'";
                    }
                    else
                    {
                        if (attributeid == Prv_attributeid)
                        {
                            strwh += " or attribute_content like '%" + strclass + "%'";

                        }
                        else
                        {
                            strwh += ") and exists (select 1 from view_newArticle_goods where id=a.id and attribute_id=" + attributeid + " and attribute_content like '%" + strclass + "%'";

                        }


                    }
                    Prv_attributeid = attributeid;
                    //if (strwh == "")
                    //{
                    //    //strwh += " attribute_content like '%" + strclass + "%'";
                       
                    //    strwh += " and exists (select 1 from view_newArticle_goods where id=a.id and attribute_id=" + attributeid + " and attribute_content like '%" + strclass + "%')";
                    //}
                    //else
                    //{
                    //    //strwh += " or attribute_content like '%" + strclass + "%'";
                    //    strwh += " and exists (select 1 from view_newArticle_goods where id=a.id and attribute_id=" + attributeid + " and attribute_content like '%" + strclass + "%')";
                    //}
                }
                strwh += "))";
                if (strwh != "") { strWhere += strwh; }
            }
           
            if (strsorttype == "timesort")
            {
                if (strtimesort == "0")
                {
                    strOrderby += " add_time desc";
                }
                else if (strtimesort == "1")
                {
                    strOrderby += " add_time asc";
                }
            }
            else if (strsorttype == "pricesort")
            {
                if (strpricesort == "0")
                {
                    strOrderby += " market_price desc";
                }
                else if (strpricesort == "1")
                {
                    strOrderby += " market_price asc";
                }
            }
            else if (strsorttype == "default_sort")
            {
                strOrderby = " sort_id asc,add_time desc";
            }
            DataTable tb = art.GetGoodsList3(istendInde, istartIndex, strWhere, strOrderby, out num).Tables[0];
            ResultView view = new ResultView();
            if (strDataImport == "DataImport")
            {
                //int iresult = ExcelImplortBySourch(tb);
                //view.putData("DataImport", iresult);
                ExportDsToXls(this, "test", tb);
                view.putData("DataImport", 200);
            }
            view.putData("proTable", tb);
            view.putData("rowsnum", num);
            outResult(view);
        }

        public void DataImport() { 
        
        }

        #region 数据导出
        #region 方式一
        private int ExcelImplortBySourch(DataTable dt)
        {
            int value = 0;
            if (dt.Rows.Count == 0)
            { value = 0; }
            else
            {
                //导出Excel  
                bool b = ExcelImport(dt, DateTime.Now.ToString("yyyyMMddHHmmss"));
                if (b) { value = 200; }
                else { value = 100; }
            }
            return value;
        }
        protected bool ExcelImport(DataTable dt, string ExportFileName)
        {
            bool value = false;
            StringWriter sw = GetStringWriter(dt);
            //当前编码  
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            //把输出的文件名进行编码  
            string fileName = HttpUtility.UrlEncode(ExportFileName, System.Text.Encoding.UTF8);
            //文件名  
            string str = "attachment;filename=" + fileName + ".xls";
            //把文件头输出，此文件头激活文件下载框  
            HttpContext.Current.Response.AppendHeader("Content-Disposition", str);//http报头文件  
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            this.Page.EnableViewState = false;
            Response.Write(sw);
            Response.End();
            value = true;
            return value;
        }
        private StringWriter GetStringWriter(DataTable dt)
        {
            StringWriter sw = new StringWriter();
            //读列名  
            foreach (DataColumn dc in dt.Columns)
                sw.Write(dc.ColumnName + "\t");
            //读列值  
            //重新的一行  
            sw.Write(sw.NewLine);
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        sw.Write(dr[i].ToString() + "\t");
                    }
                    sw.Write(sw.NewLine);
                }
            }
            sw.Close();

            return sw;
        }
        #endregion
        #region 方式二
        public string GetExportString(DataTable tb)
        {
            StringBuilder data = new StringBuilder();//因为循环很多，用 StringBuilder速度会快很多
            //data = ds.DataSetName + "\n";
            if (tb == null || tb.Rows.Count <= 0) { return data.ToString(); }
            //foreach (DataTable tb in ds.Tables)//多个表 www.2cto.com
            //{
                //data += tb.TableName + "\n";
                data.Append("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
                //写出列名
                data.Append("<tr style=\"font-weight: bold; white-space: nowrap;\">");
                foreach (DataColumn column in tb.Columns)
                {
                    data.Append("<td>");
                    data.Append(column.ColumnName);
                    data.Append("</td>");
                }
                data.Append("</tr>");

                //写出数据
                foreach (DataRow row in tb.Rows)
                {
                    data.Append("<tr>");
                    foreach (DataColumn column in tb.Columns)
                    {
                        //if (column.ColumnName.Equals("证件编号") || column.ColumnName.Equals("报名编号"))
                        //    data.Append("<td style=\"vnd.ms-excel.numberformat:@\">" + row[column].ToString() + "</td>");
                        //else
                        data.Append("<td>");
                        data.Append(row[column].ToString());
                        data.Append("</td>");
                    }
                    data.Append("</tr>");
                }
                data.Append("</table>");
            //}
            return data.ToString();
        }
        public void ExportDsToXls(Page page, string fileName, DataTable ds)
        {
            page.Response.Clear();
            page.Response.Buffer = true;
            page.Response.Charset = "GB2312";
            //page.Response.Charset = "UTF-8";<BR>　　　　 //如果输出中文名乱码的话，可以这样编码 文件名  HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8) 
            page.Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName + System.DateTime.Now.ToString("_yyMMdd_hhmm") + ".xls");
            page.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");//设置输出流为简体中文
            page.Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
            page.EnableViewState = false;
            page.Response.Write(GetExportString(ds));
            page.Response.End();
        }
        #endregion
        #endregion
        string StringTrim(string s)
        {
            string value = s;
            if (s == "undefined" || s == "null" || s == null) { value = ""; }
            return value;
        }
        string SortArr(string classArr)
        {
            string newclassArr="";
            string[] ss = null;
            ss = classArr.Split(new string[] { "," }, StringSplitOptions.None);
            Array.Sort(ss);
            for (int i = 0; i < ss.Length; i++)
            {
                if (newclassArr == "") { newclassArr =ss[i]; }
                else { newclassArr = newclassArr + ',' + ss[i]; }
            }

            return newclassArr;
        }
        public void outResult(object result)
        {
            Response.ContentType = "text/plain";
            Response.Clear();
            string strresult = JsonHelper.Serialize(result);
            Response.Write(strresult);
            Response.End();
        }
    }
}