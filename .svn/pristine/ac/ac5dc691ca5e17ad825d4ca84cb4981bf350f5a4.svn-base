using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.Web.aspx.fg
{
    public partial class productClassify : System.Web.UI.Page
    {
        //接收地址栏的id
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            //接收地址栏的id
            id = int.Parse(Request.QueryString["id"]);
            //动态加载数据
            loadData();
        }

        private void loadData()
        {

            //隐藏Input提供channelID给AJAX
            HtmlInputHidden hide = new HtmlInputHidden();
            hide.Value = id.ToString();
            hide.ID = "channelId";
            this.content.Controls.Add(hide);
            //BLL.article BLL_article = new BLL.article();

            //"太阳神保健食品一览表"
            /*HtmlGenericControl total = new HtmlGenericControl("h5");
            total.InnerHtml = "太阳神保健食品一览表(" + BLL_article.GetCount("channel_id = " + id ) + ")";
            this.content.Controls.Add(total);*/

            //列出该频道分类的子孙分类
            BLL.article_category category = new BLL.article_category();
            //最顶端的祖先分类
            DataTable ancestor = category.GetChildList(0, id);
            if (ancestor.Rows.Count > 1)
            {
                HtmlInputHidden categoryJson = new HtmlInputHidden();
                categoryJson.ID = "categoryJson";
                //递归生成分类及其子类的JSON
                categoryJson.Value = "{\"category\":[" + catagory2Json(ancestor, category) + "]}";

                this.content.Controls.Add(categoryJson);
            }

            //建立表格
                HtmlTable table = new HtmlTable();

            //可分类属性
            List<Model.article_attribute_field> ls = new BLL.article_attribute_field().GetModelList(id, "is_classify=1");
            foreach (Model.article_attribute_field modelt in ls)
            {
                //建立每个分类属性为一行的tr
                HtmlTableRow tr = new HtmlTableRow();
                //建立类型的td
                HtmlTableCell className = new HtmlTableCell();
                if (modelt.title.Length > 4)
                    className.InnerHtml = modelt.title.Substring(0, 4);
                else
                    className.InnerHtml = modelt.title;
                className.Attributes.Add("class", "attrName"); 
                //建立分类具体属性的td
                HtmlTableCell arrtibutes = new HtmlTableCell();
                arrtibutes.Attributes.Add("class", "item_content");
                //根据单选，多选添加每一个属性类型
                switch (modelt.control_type) 
                {
                    case "multi-radio":
                        //构建单选框
                        HtmlGenericControl htmlDiv2 = new HtmlGenericControl("div");
                        htmlDiv2.ID = modelt.name;
                        htmlDiv2.Attributes.Add("class", "multi-radio");
                        //htmlDiv2.Controls.Add(rblControl);
                        //赋值选项
                        string[] valArr = modelt.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                        for (int i = 0; i < valArr.Length; i++)
                        {
                            string[] valItemArr = valArr[i].Split('|');
                            if (valItemArr.Length == 2)
                            {
                                //获取该属性的产品数目
                                int num = productsNum(id,modelt.name, valItemArr[1]);
                                //设置属性显示的名称
                                string title = new ListItem(valItemArr[0], valItemArr[1]).ToString();
                                if (num == 0)
                                {
                                    HtmlGenericControl text = new HtmlGenericControl("div");
                                    if (title.Length > 5)
                                    {
                                        text.InnerHtml = title.Substring(0, 5) + "..";
                                        text.Attributes.Add("title", title);
                                        text.Style.Add("font-size", "13px");
                                        text.Attributes.Add("class", "none");     
                                    }
                                    else
                                    {
                                        text.Attributes.Add("class", "none");
                                        text.InnerHtml = title;
                                    }
                                    htmlDiv2.Controls.Add(text);
                                }
                                else
                                {
                                    HtmlAnchor aElement = new HtmlAnchor();
                                    if (title.Length > 5)
                                    {
                                        aElement.InnerHtml = title.Substring(0, 5) + "..";
                                        aElement.Attributes.Add("title", title);
                                        aElement.Style.Add("font-size", "13px");
                                    }
                                    else
                                        aElement.InnerHtml = title;
                                    htmlDiv2.Controls.Add(aElement);
                                }
                            }
                        }
                        //rblControl.SelectedValue = modelt.default_value; //默认值
                        arrtibutes.Controls.Add(htmlDiv2);
                        break;
                    case "multi-checkbox": //多项多选
                        
                        HtmlGenericControl htmlDiv3 = new HtmlGenericControl("div");
                        htmlDiv3.ID = modelt.name;
                        htmlDiv3.Attributes.Add("class", "multi-checkbox");
                        
                        //赋值选项
                        string[] valArr2 = modelt.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                        for (int i = 0; i < valArr2.Length; i++)
                        {
                            string[] valItemArr2 = valArr2[i].Split('|');
                            if (valItemArr2.Length == 2)
                            {
                                //获取该属性的产品数目
                                int num = productsNum(id, modelt.name, valItemArr2[1]);
                                //设置属性显示的名称
                                string title = new ListItem(valItemArr2[0], valItemArr2[1]).ToString();
                                if (num == 0)
                                {
                                    HtmlGenericControl text = new HtmlGenericControl("div");
                                    if (title.Length > 5)
                                    {
                                        text.InnerHtml = title.Substring(0, 5) + "..";
                                        text.Attributes.Add("title", title);
                                        text.Style.Add("font-size", "13px");
                                        text.Attributes.Add("class", "none");   
                                    }
                                    else
                                    {
                                        text.Attributes.Add("class", "none");
                                        text.InnerHtml = title;
                                    }
                                    htmlDiv3.Controls.Add(text);
                                }
                                else
                                {
                                    HtmlAnchor aElement = new HtmlAnchor();
                                    if (title.Length > 5)
                                    {
                                        aElement.InnerHtml = title.Substring(0, 5) + "..";
                                        aElement.Attributes.Add("title", title);
                                        aElement.Style.Add("font-size", "13px");
                                    }
                                    else
                                        aElement.InnerHtml = title;
                                    htmlDiv3.Controls.Add(aElement);
                                }
                            }
                        }
                        arrtibutes.Controls.Add(htmlDiv3);
                        break;
                }
                //把tr加入表格
                tr.Cells.Add(className);
                tr.Cells.Add(arrtibutes);
                table.Rows.Add(tr);
            }
            //表格加入
            this.content.Controls.Add(table);
        }

        //根据属性取出该拥有该属性的产品数,id为频道ID
        private int productsNum(int id,string attributeName,string attributeValue) 
        {
            Model.channel channel = new BLL.channel().GetModel(id);
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM view_channel_" + channel.name + " WHERE ");
            strSql.Append(attributeName + " LIKE '%" + attributeValue + "%'");
            DataTable dt = DbHelperSQL.Query(strSql.ToString()).Tables[0];
            return dt.Rows.Count;
        }

        //递归生成分类及其子类的JSON
        private string catagory2Json(DataTable dt, BLL.article_category category)
        {
            string json = "";
            for (int i = 0; i < dt.Rows.Count; i++) 
            {
                json += "{\"id\":\"" + dt.Rows[i]["id"].ToString();
                json += "\",\"title\":\"" + dt.Rows[i]["title"].ToString();
                int parentsId = int.Parse(dt.Rows[i]["id"].ToString());
                DataTable children = category.GetChildList(parentsId, id);
                if (children.Rows.Count != 0)
                {
                    json += "\",\"children\":[" + catagory2Json(children, category) + "]}";
                }
                else
                {
                    json += "\"}";
                }
                if (i != dt.Rows.Count - 1)
                    json += ",";
            }
            return json;
        }
    }
}