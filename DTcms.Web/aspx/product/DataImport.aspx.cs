using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using FSHH.HQ.XYJ.Web.xyj.Vendor.CertifcateCategory;
using System.IO;
using DTcms.BLL;

namespace DTcms.Web.aspx.product
{
    public partial class DataImport : System.Web.UI.Page
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

            }
            else if (straction == "DataImport") { GetProductByClass(); }
        }

        public void GetProductByClass()
        {
            //timesort: timesort, pricesort: pricesort, productsort: productsort, channel: channel, blandidlist: blandidlist, classidlist:classidlist, sourchtittle: sourchtittle, startIndex: page1, endIndex: page2 
            string strsorttype = StringTrim(Request.QueryString["sorttype"]);
            string strtimesort = StringTrim(Request.QueryString["timesort"]);
            string strpricesort = StringTrim(Request.QueryString["pricesort"]);
            string strproductsort = StringTrim(Request.QueryString["productsort"]);
            string strchannel = StringTrim(Request.QueryString["channel"]);
            string strclassid = StringTrim(Request.QueryString["classid"]);
            string strblandidlist = StringTrim(Request.QueryString["blandidlist"]);
            string strclassidlist = StringTrim(Request.QueryString["classidlist"]);
            string straddclasslist = StringTrim(Request.QueryString["addclasslist"]);
            string strsourchtittle = StringTrim(Request.QueryString["sourchtittle"]);
            string strstartIndex = StringTrim(Request.QueryString["startIndex"]);
            string strDataImport = StringTrim(Request.QueryString["DataImport"]);
            int istartIndex = Convert.ToInt32(strstartIndex == "" ? "1" : strstartIndex);
            string strendIndex = StringTrim(Request.QueryString["endIndex"]);
            int istendInde = Convert.ToInt32(strendIndex == "" ? "1" : strendIndex);
            int num = 0;
            article art = new article();
            string strWhere = "";
            string strOrderby = "";
            string stroutfilename = "";
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
                BLL.category cat = new category();
                DataTable tbout = cat.GettypeList(" and id=" + strclassid);
                if (tbout != null && tbout.Rows.Count > 0) { stroutfilename = tbout.Rows[0]["title"] + ""; }
            }
            if (strclassidlist.Trim() == "null" || strclassidlist.Trim() == "" || strclassidlist.Trim() == "0")
            {
                strWhere += "";
            }
            else
            {
                strWhere += " and Category_Id in (" + strclassid + ")";
            }
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
                strWhere += " and Channel_id=2  and title like '%" + strsourchtittle + "%'";
            }
            if (straddclasslist.Trim() != "")
            {
                string[] addclasslist = null;
                if (straddclasslist.Contains(","))
                { addclasslist = straddclasslist.Split(new string[] { "," }, StringSplitOptions.None); }
                else { addclasslist = new string[] { straddclasslist }; }
                string strwh = "";
                //for (int i = 0; i < addclasslist.Length; i++)
                //{
                //    string strclass = addclasslist[i];
                //    if (strwh == "")
                //    {
                //        strwh += " attribute_content like '%" + strclass + "%'";
                //    }
                //    else
                //    {
                //        strwh += " or attribute_content like '%" + strclass + "%'";
                //    }
                //}
                //if (strwh != "") { strWhere += " and (" + strwh + ")"; }
                string Prv_attributeid = "";
                for (int i = 0; i < addclasslist.Length; i++)
                {
                    string strclass = addclasslist[i];
                    string attributeid = "";

                    attributeid = strclass.Substring(0, strclass.IndexOf('!'));
                    strclass = strclass.Substring(strclass.IndexOf('!') + 1, strclass.Length - 1 - strclass.IndexOf('!'));
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
                }
                strwh += "))";
                if (strwh != "") { strWhere += strwh; }
            }
            strOrderby = " sort_id asc";
            if (strsorttype == "timesort")
            {
                if (strtimesort == "0")
                {
                    strOrderby += " ,add_time desc";
                }
                else if (strtimesort == "1")
                {
                    strOrderby += " ,add_time asc";
                }
            }
            else if (strsorttype == "pricesort")
            {
                if (strpricesort == "0")
                {
                    strOrderby += ",market_price desc";
                }
                else if (strpricesort == "1")
                {
                    strOrderby += ",market_price asc";
                }
            }
            DataTable tb = art.GetGoodsImportList(strWhere).Tables[0];
            if (strDataImport == "DataImport")
            {
                DataTable tb1 = ExportTableSet(tb);
                ExportDsToXls(this, stroutfilename, tb1);
            }
        }

        DataTable ExportTableSet(DataTable tb) {
            DataTable value = new DataTable();
            if (tb != null && tb.Rows.Count > 0) {
                for (int i = 0; i < tb.Columns.Count; i++)
                {
                    string strcolumnname = tb.Columns[i].ToString();
                    //if (strcolumnname.ToLower() == "id") { continue; }
                    value.Columns.Add(strcolumnname);
                }
                List<int> idlist = new List<int>();
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    string strid = tb.Rows[i]["id"] + "";
                    int id = Convert.ToInt32(strid == "" ? "0" : strid);
                    if (!idlist.Contains(id))
                    {
                        idlist.Add(id);
                        value.ImportRow(tb.Rows[i]);
                    }
                    else {
                        for (int j = 0; j < tb.Columns.Count; j++)
                        {
                            if (j >= 6) { //扩展属性从第6列开始
                                string rowcol = tb.Rows[i][j] + "";
                                if (rowcol.Trim() != "") {
                                    value.Rows[value.Rows.Count - 1][j] = rowcol;
                                }
                            }
                        }
                    }
                }
            }
            return value;
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
            data.Append("<td>");
            data.Append("序号");
            data.Append("</td>");
            foreach (DataColumn column in tb.Columns)
            {
                data.Append("<td>");
                data.Append(column.ColumnName.Replace("id","编号"));
                data.Append("</td>");
            }
            data.Append("</tr>");

            //写出数据
            int inum = 1;
            foreach (DataRow row in tb.Rows)
            {
                data.Append("<tr>");
                data.Append("<td>");
                data.Append(inum);
                data.Append("</td>");
                inum++;
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