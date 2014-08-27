using System;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.Web.tools
{
    /// <summary>
    /// classify_ajax 的摘要说明
    /// </summary>
    public class classify_ajax : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            //取出频道ID，根据频道ID取出对应扩展属性
            int id = int.Parse(context.Request.Params["channelId"]);
            List<Model.article_attribute_field> ls = new BLL.article_attribute_field().GetModelList(id, "is_classify=1");
            Model.channel channel = new BLL.channel().GetModel(id);

            //如果存在产品分类，取出产品及其父类类型
            string category = context.Request.QueryString["category"];
            if (category != null && category != "0")
            {
                BLL.article_category article_category = new BLL.article_category();
                DataTable dt1 = article_category.GetList(int.Parse(context.Request.QueryString["category"]), id);
                for (int i = 0; i < dt1.Rows.Count; i++) 
                {
                    category += "," + dt1.Rows[i]["id"] ;
                }
            }
 

            //建立频道视图(view)的查询语句，根据传过来的选择信息取出对应的产品的id,title,img_url
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT id,title,img_url FROM view_channel_" + channel.name + " WHERE ");

            //搜索关键字查询
            if (context.Request.QueryString["search"] != null)
            {
                strSql.Append("title LIKE '%" + context.Request.QueryString["search"] + "%' AND");
            }

            //如果存在产品分类，添加产品分类条件
            if (category != null && category != "0")
            {
                string[] arr = category.Split(',');
                category = "";
                for (int i = 0; i < arr.Length; i++)
                {
                    if (arr[i] != "")
                    {
                        category += " category_id=" + arr[i] + " OR";
                    }
                }
                category = category.Substring(0, category.Length - 2) + "AND";
                strSql.Append(category);
            }

            foreach (Model.article_attribute_field modelt in ls)
            {
                string attributes= context.Request.QueryString[modelt.name];
                string[] arr = attributes.Split(',');
                for (int i = 0; i < arr.Length; i++)
                {
                    if (arr[i] != "")
                    {
                        strSql.Append(" " + modelt.name + " LIKE ");
                        strSql.Append("'%" + arr[i] +"%' AND");
                    }
                }
            }
            DataTable dt = DbHelperSQL.Query(strSql.ToString().Substring(0, strSql.ToString().Length - 3)).Tables[0];
            //返回Json数据
            context.Response.Write(dt2Json(dt));
        }

        //根据DataTable类型生成对应Json类型
        private string dt2Json(DataTable dt)
        {
            string json = "{\"total\":\"" + dt.Rows.Count +  "\",\"products\":[";
            foreach (DataRow dr in dt.Rows)
            {
                json += "{\"id\":\"" + dr["id"] + "\",";
                json += "\"title\":\"" + dr["title"] + "\",";
                json += "\"img_url\":\"" + dr["img_url"] + "\"},";
            }
            if (dt.Rows.Count > 0)
            {
                json = json.Substring(0, json.Length - 1);
            }
            json += "]}";
            return json;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}