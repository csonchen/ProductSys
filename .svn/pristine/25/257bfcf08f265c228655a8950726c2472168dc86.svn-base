using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DTcms.Web.aspx.fg
{
    public partial class productDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //接收地址栏的id
            int id = int.Parse(Request.QueryString["id"]);
            //根据id查找该物品所属类型
            BLL.article BLL_article = new BLL.article();
            Model.article article = BLL_article.GetModel(id);
            //判断该物品的所属类型
            int channelID = article.channel_id;
            switch (channelID)
            { 
                //保健食品
                case 7:
                    ShowHealthFoodDetail(id, channelID, article);
                    break;
                //食品
                case 8:
                    ShowFoodDetail(id,channelID,article);
                    break;
                case 9:
                    ShowDrugDetail(id, channelID, article);
                    break;
                //日化用品
                case 10:
                    ShowDailyNecessityDetail(id, channelID, article);
                    break;
                //家居用品
                case 11:
                    ShowHouseholdArticleDetail(id, channelID, article);
                    break;
                //水用品
                case 12:
                    ShowWaterAndProductDetail(id, channelID, article);
                    break;
                default:
                    break;
            }
            
        }

        #region  水用品===========
        /// <summary>
        /// 水用品样式构造
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowWaterAndProductDetail(int id, int channelID, Model.article article)
        {
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article, 3);

            //主体表格2的构造
            createTable(this.Table2, 4, 6, channelID, article);

            //主体表格4的构造
            createTableOnCell(this.Table4, 7, 7, channelID, article);
        }
        #endregion

        #region  家居用品=========
        /// <summary>
        /// 家居用品样式构造
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowHouseholdArticleDetail(int id, int channelID, Model.article article)
        {
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article, 3);

            //主体表格2的构造
            createTable(this.Table2, 4, 12, channelID, article);
        }
        #endregion

        #region 药品=========
        /// <summary>
        /// 药品
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowDrugDetail(int id, int channelID, Model.article article)
        {
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article, 5);

            //主体表格2的构造
            createTable(this.Table2, 6, 10, channelID, article);

            //主体表格4的构造
            createTableOnCell(this.Table4, 11, 11, channelID, article);
        }
        #endregion

        #region 日化用品========
        /// <summary>
        /// 构建日化用品样式表
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowDailyNecessityDetail(int id, int channelID, Model.article article)
        {
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article, 7);

            //主体表格2的构造
            createTable(this.Table2, 8, 14, channelID, article);

            //主体表格4的构造
            createTableOnCell(this.Table4, 15, 15, channelID, article);
        }
        #endregion

        #region 食品========
        /// <summary>
        /// 构建食品样式表
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowFoodDetail(int id, int channelID, Model.article article)
        {
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article,6);

            //主体表格2的构造
            createTable(this.Table2, 7, 15, channelID, article);

            //主体表格4的构造
            createTableOnCell(this.Table4, 16, 16, channelID, article);

        }
        #endregion

        #region  保健食品========
        /// <summary>
        /// 构建保健食品样式表
        /// </summary>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void ShowHealthFoodDetail(int id, int channelID, Model.article article) 
        {
                
            //主体表格1的构造
            createMainTable(this.Table1, id, channelID, article,10);

            //主体表格2的构造
            createTable(this.Table2, 11, 19, channelID, article);

            //主体表格3的构造
            createTable(this.Table3, 20, 21, channelID, article);

            //主体表格4的构造
            createTableOnCell(this.Table4,22,22,channelID,article);
             
        }
        #endregion

        #region  主体表格======
        /// <summary>
        /// 表格构建
        /// </summary>
        /// <param name="table"></param>
        /// <param name="id"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        /// <param name="top"></param>
        private void createMainTable(Table table,int id, int channelID, Model.article article,int top)
        {
            // 查找商品图片地址并替换
            string imgUrl = new BLL.article().GetModel(id).img_url == "" ? "/images/kongbai.jpg" : new BLL.article().GetModel(id).img_url;
            this.productImg.Src = "../.." + imgUrl;
            //查找商品标题信息
            string title = new BLL.article().GetTitle(id);
            //添加到表格1中
            TableRow titleTr = new TableRow();
            TableCell titleLabelCell = new TableCell();
            titleLabelCell.CssClass = "product_label";
            TableCell titleValueCell = new TableCell();
            titleValueCell.CssClass = "product_body";
            HtmlGenericControl titleH3 = new HtmlGenericControl("h3");
            titleH3.Attributes.Add("class", "pro_header");
            titleH3.InnerHtml = "产品名称";
            titleLabelCell.Controls.Add(titleH3);
            titleValueCell.Text = title;
            titleTr.Controls.Add(titleLabelCell);
            titleTr.Controls.Add(titleValueCell);
            //表格赋值
            this.Table1.Rows.Add(titleTr);

            //根据物品类型id查询相关扩展字段信息
            DataTable dt = new BLL.article_attribute_field().GetList(top, channelID, "").Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                //创建表格行元素
                TableRow tr = new TableRow();
                //创建表格列元素
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                //创建<h3>标签元素和附加其属性
                HtmlGenericControl h3 = new HtmlGenericControl("h3");
                h3.Attributes.Add("class", "pro_header");
                //获取字段并添加到表格
                String label = dr["title"].ToString();
                h3.InnerHtml = label;
                cell1.Controls.Add(h3);
                cell1.CssClass = "product_label";
                //获取字段值并添加到表格
                String labelValue = article.fields[dr["name"].ToString()].ToString();
                //单选、多选字段的内容显示处理 和 判断字段是否为可分类显示
                switch (dr["control_type"].ToString())
                {
                    case "multi-radio":
                        string[] valArr1 = dr["item_option"].ToString().Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                        for (int i = 0; i < valArr1.Length; i++)
                        {
                            string[] valItemArr = valArr1[i].Split('|');
                            if (valItemArr[1] == labelValue)
                            {
                                labelValue = valItemArr[0];
                            }
                        }
                        if (dr["is_classify"].ToString().Equals("1"))
                        {
                            HtmlAnchor a = new HtmlAnchor();
                            a.InnerHtml = labelValue;
                            a.HRef = "#";
                            cell2.Controls.Add(a);
                        }
                        else
                        {
                            cell2.Text = labelValue;
                        }
                        break;
                    case "multi-checkbox":
                        string[] valArr2 = labelValue.Split(',');
                        string[] valArr3 = dr["item_option"].ToString().Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                        for (int i = 0; i < valArr2.Length; i++)
                        {
                            for (int j = 0; j < valArr3.Length; j++)
                            {
                                string[] valItemArr = valArr3[j].Split('|');
                                if (valItemArr[1] == valArr2[i])
                                {
                                    valArr2[i] = valItemArr[0];
                                }
                            }
                        }
                        if (dr["is_classify"].ToString().Equals("1"))
                        {
                            for (int i = 0; i < valArr2.Length; i++)
                            {
                                HtmlAnchor a = new HtmlAnchor();
                                a.InnerHtml = valArr2[i];
                                a.HRef = "#";
                                cell2.Controls.Add(a);
                                Label l = new Label();
                                l.Text = ";";
                                cell2.Controls.Add(l);
                            }
                        }
                        else
                        {
                            for (int i = 0; i < valArr2.Length; i++)
                            {
                                cell2.Text += valArr2[i];
                            }
                        }
                        break;
                    default:
                        cell2.Text = labelValue;
                        break;
                }
                cell2.CssClass = "product_body";
                //添加表格元素
                tr.Cells.Add(cell1);
                tr.Cells.Add(cell2);
                table.Rows.Add(tr);
            }
        }
        #endregion

        #region  副表（含两个单元格）=========
        /// <summary>
        /// 前台表格赋值处理(含两个单元格)
        /// </summary>
        /// <param name="table">前台需要处理的表格</param>
        /// <param name="channelID">产品类型号</param>
        /// <param name="begin">开始位置</param>
        /// <param name="end">结束位置</param>
        /// <param name="article">实例对象</param>
        private void createTable(Table table, int begin, int end, int channelID, Model.article article)
        {
            DataTable dt = new BLL.article_attribute_field().GetList(begin, end, channelID, "").Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                //创建表格行元素
                TableRow tr = new TableRow();
                //创建表格列元素
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                //获取字段并添加到表格
                cell1.CssClass = "ex_detail_label";
                cell2.CssClass = "ex_detail_body";
                String label = dr["title"].ToString();
                String labelValue = article.fields[dr["name"].ToString()].ToString();
                cell1.Text = label.ToString();
                cell2.Text = labelValue.ToString();
                tr.Controls.Add(cell1);
                tr.Controls.Add(cell2);
                table.Controls.Add(tr);
            }
        }
        #endregion

        #region 副表（含一个单元格）========
        /// <summary>
        /// 前台表格赋值处理(含一个单元格)
        /// </summary>
        /// <param name="table"></param>
        /// <param name="begin"></param>
        /// <param name="end"></param>
        /// <param name="channelID"></param>
        /// <param name="article"></param>
        private void createTableOnCell(Table table, int begin, int end, int channelID, Model.article article)
        {
            DataTable dt = new BLL.article_attribute_field().GetList(begin, end, channelID, "").Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                //创建表格行元素
                TableRow tr = new TableRow();
                //创建表格列元素
                TableCell cell1 = new TableCell();
                //获取字段并添加到表格
                cell1.CssClass = "ex_detail_body";
                String labelValue = article.fields[dr["name"].ToString()].ToString();
                cell1.Text = labelValue.ToString();
                tr.Controls.Add(cell1);
                table.Controls.Add(tr);
            }
        }
        #endregion

       
    }
}