using DTcms.Common;
using JCYWebBll;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DTcms.Web.tools
{
    /// <summary>
    /// product_charts 的摘要说明
    /// </summary>
    public class product_charts : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Test = CustomResponse.GetResponse("lc");
            string categroy = CustomResponse.GetResponse("cl");
            string oper = CustomResponse.GetResponse("oper");
            string condition = CustomResponse.GetResponse("cd");
            string id = CustomResponse.GetResponse("id");
            switch (oper)
            {

                case "bycategory":
                    GetTestStatisticsByCategory(context);//按照保健食品功能统计
                    break;
                case "bystate":
                    GetTestStatisticsByState(context);//按照产品种类不同状态统计
                    break;
                case "bybegintime":
                    GetTestStatisticsByBeginTime(context);//按照不同人群所需保健食品统计
                    break;
                case "byaddtime":
                    GetTestStatisticsByAddTime(context);//按照年度研发产品统计数据
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 按年度研发统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByAddTime(HttpContext context)
        {
            //string returnvalue = "['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']";
  
            BLL.article BLL_article = new BLL.article();

            //查找所有的保健食品(按批准日期升序排列)
            int channel_id = 7;
            DataTable articles = BLL_article.GetList(0,"channel_id=" + channel_id,"add_time asc,id desc").Tables[0];
            ArrayList addtimeList = new ArrayList();
            //用于存放不同年度的产品数量
            //ArrayList countList = new ArrayList();
            Dictionary<string, int> dic = new Dictionary<string, int>();
            foreach (DataRow dr in articles.Rows)
            {
                DateTime dd = Convert.ToDateTime(dr["add_time"].ToString());
                //格式化日期格式
                string time = dd.ToString("yyyy/MM/dd hh:mm:ss", DateTimeFormatInfo.InvariantInfo);
                //分隔年份
                string[] addTimes = time.Split('/');
                //添加年份
                addtimeList.Add(addTimes[0]);
                //返回不同年度的产品总数(从高到低)
                int count = BLL_article.GetCount("channel_id = " + channel_id + " and YEAR(add_time) = " + addTimes[0]);
                string productYear = addTimes[0];
                if (addtimeList.Count >= 2)
                {
                    //比较当前年份和集合中的上一年份
                    if (!productYear.Equals(addtimeList[addtimeList.Count - 2]))
                    {
                        //以键值对形式存储到集合中
                        dic.Add(addTimes[0], count);
                    }
                }
                else 
                {
                    dic.Add(addTimes[0], count);
                }
            }
            //取出最小年份
            int minYear = int.Parse(addtimeList[0].ToString());
            //取出最大年份
            int maxYear = int.Parse(addtimeList[addtimeList.Count - 1].ToString());
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            //存储所有的年份
            ArrayList allYear = new ArrayList();
            //构造年份区间
            while (minYear <= maxYear)
            {
                allYear.Add(minYear.ToString());
                sb.Append("'" + minYear + "'" + ",");
                minYear += 1;
            }
            //去末尾逗号
            String value = Utils.DelLastComma(sb.ToString());
            StringBuilder sb2 = new StringBuilder();
            sb2.Append(value);
            sb2.Append("];[");

            Dictionary<string,int>.KeyCollection keyCol = dic.Keys;
            //拼接不同年份研发的产品数量
            bool flag = false;
            foreach (string year in allYear)
            {
                    foreach (string yearKey in keyCol)
                    {
                        if (yearKey.Equals(year))
                        {
                            sb2.Append(dic[yearKey] + ",");
                            flag = false;
                            break;
                        }
                        else 
                        {
                            flag = true;
                        }
                    }
                    if (flag)
                    {
                        sb2.Append("" + 0 + ",");
                    }
            }
            value = Utils.DelLastComma(sb2.ToString());
            StringBuilder result = new StringBuilder();
            result.Append(value);
            result.Append("];[");


            

            #region 文字区域动态数据获取======
            //获取保健食品的数量
            int healthCount = BLL_article.GetCount("channel_id=" + channel_id);
            //获取产品中最大的批准日期
            int healthMaxYear = maxYear;
            //获取上市的保健食品的数量
            DataTable newArticles = BLL_article.GetList(0, "channel_id=" + channel_id, "product_status", "0", "sort_id asc,id desc").Tables[0];
            int passArticleCount = newArticles.Rows.Count;
            //上市的保健食品所占的百分比
            string persent = ((passArticleCount * 1.0 / healthCount) * 100).ToString("0.00") + "%";
            #endregion
            result.Append(healthCount.ToString());
            result.Append("];[");
            result.Append(healthMaxYear.ToString());
            result.Append("];[");
            result.Append(passArticleCount.ToString());
            result.Append("]");
            result.Append("];[");
            result.Append(persent.ToString());
            result.Append("]");
            context.Response.Write(result.ToString());
            context.Response.End();
        }

        /// <summary>
        /// 按照按照保健食品功能统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByCategory(HttpContext context)
        {
            //统计不同功能产品数量
            //按适产品保健功能分类
            Model.article_attribute_field healthFunction = new BLL.article_attribute_field().GetModel(17);
            Dictionary<String, int> dic = new Dictionary<string, int>();
            BLL.article BLL_article = new BLL.article();
            //赋值选项
            string[] valArr = healthFunction.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    DataTable articles = BLL_article.GetList(0, "channel_id=" + 7, "health_function", valItemArr[1].ToString(), "sort_id asc,id desc").Tables[0];
                    //映射到集合中去
                    dic.Add(valItemArr[0], articles.Rows.Count);
                }
            }

            Dictionary<String, int>.KeyCollection kc = dic.Keys;
            StringBuilder sb = new StringBuilder();
            StringBuilder result = new StringBuilder();
            sb.Append("[");
            foreach (String str in kc)
            {
                if (dic[str] != 0)
                {
                    string value = "{value:" + dic[str] + ",name:'" + str + "'},";
                    //添加到构造字符串中
                    sb.Append(value);
                }
                
            }
            //去掉构造字符串中的末尾逗号
            String prexResult = Utils.DelLastComma(sb.ToString());
            result.Append(prexResult);
            result.Append("]");

            context.Response.Write(result.ToString());
            context.Response.End();

        }
        /// <summary>
        /// 按照产品种类不同状态统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByState(HttpContext context)
        {
            //string returnvalue = "['周一','周二','周三','周四','周五','周六','周日'];" +
                //"[{name:'邮件营销',type:'bar',stack:'广告',data:[120,132,101,124,90,230,210]},{name:'联盟广告',type:'bar',stack:'广告',data:[220, 182, 191, 234, 290, 330, 310]}]";
            int category_id = 1;
            DataTable dt = new BLL.channel().GetList(0, "category_id = " + category_id, "sort_id asc,id desc").Tables[0];
            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            sb.Append("[");
            foreach (DataRow dr in dt.Rows)
            {
                //将类别名称添加到集合中
                sb.Append("'" + dr["title"].ToString() + "'" + ",");
            }

            BLL.article BLL_article = new BLL.article();
            Dictionary<String, int[]> dic = new Dictionary<string, int[]>();

            Model.article_attribute_field productStatus = new BLL.article_attribute_field().GetModel(3);
            
            //赋值选项
            string[] valArr = productStatus.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                //用于存放不同产品状态的产品数量
                ArrayList list = new ArrayList();
                if (valItemArr.Length == 2)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        //将类别名称添加到集合中
                        //sb.Append("'" + dr["title"].ToString() + "'" + ",");
                        DataTable articles = BLL_article.GetList(0, "channel_id=" + dr["id"].ToString(), "product_status", valItemArr[1].ToString(), "sort_id asc,id desc").Tables[0];
                        //将数量添加到集合中
                        list.Add(articles.Rows.Count);
                    }
                    //添加到集合中
                    dic.Add(valItemArr[0].ToString(),(int[])list.ToArray(typeof(int)));
                }
            }

            //去掉结尾的逗号
            String value = Utils.DelLastComma(sb.ToString());
            sb2.Append(value + "];[");

            Dictionary<String,int[]>.KeyCollection keyCol = dic.Keys;

            //构造不同产品状态数量字符串
            foreach (String str in keyCol)
            {
                //{name:'邮件营销',type:'bar',stack:'广告',data:[120,132,101,124,90,230,210]}
                string data = "";
                for (int i = 0; i < dic[str].Length; i++)
                {
                    data += dic[str][i] + ",";
                }
                data = Utils.DelLastComma(data);
                sb2.Append("{name:'" + str + "',type:'bar',stack:'广告',data:[" + data + "]},");
            }
            value = Utils.DelLastComma(sb2.ToString());
            StringBuilder sb3 = new StringBuilder();
            sb3.Append(value);
            sb3.Append("];[");

            //构造图表上方工具栏
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    sb3.Append("'" + valItemArr[0] + "'" + ",");
                }
            }
            value = Utils.DelLastComma(sb3.ToString());
            StringBuilder result = new StringBuilder();
            result.Append(value);
            result.Append("]");
            context.Response.Write(result.ToString());
            context.Response.End();
        }

        /// <summary>
        /// 按照不同人群所需保健食品统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByBeginTime(HttpContext context)
        {
            //获取适宜人群分类
            int _channel_id = 7;
            List<Model.article_attribute_field> ls = new BLL.article_attribute_field().GetModelList(_channel_id, "is_sys=0");
            List<String> suitableType = new List<String>();

            //统计产品数量
            //按适宜人群分类
            Model.article_attribute_field suitableClassify = new BLL.article_attribute_field().GetModel(6);
            Dictionary<String, int> dic = new Dictionary<string, int>();
            BLL.article BLL_article = new BLL.article();
            //赋值选项
            string[] valArr = suitableClassify.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    DataTable articles = BLL_article.GetList(0, "channel_id=" + 7, "suitable_classify", valItemArr[1].ToString(), "sort_id asc,id desc").Tables[0];
                    //映射到集合中去
                    dic.Add(valItemArr[0], articles.Rows.Count);
                }
            }


            foreach (Model.article_attribute_field modelt in ls)
            {
                //判断字段是否为“适宜人群-分类”
                if (modelt.name == "suitable_classify")
                { 
                    //分割字符取出数据
                    string[] valArr2 = modelt.item_option.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                    for (int i = 0; i < valArr2.Length; i++)
                    {
                        string[] valItemArr2 = valArr2[i].Split('|');
                        if (valItemArr2.Length == 2)
                        {
                            //取出第一项并添加到集合中去
                            suitableType.Add(valItemArr2[0].ToString());
                        }
                    }
                }
            }
            StringBuilder itemType = new StringBuilder();
            StringBuilder valueType = new StringBuilder();
            StringBuilder result = new StringBuilder();
            itemType.Append("[");
            Dictionary<String,int>.KeyCollection keyColl = dic.Keys;
            foreach (String str in suitableType)
            {
                itemType.Append("'" + str + "'" + ","); 
            }

            //去掉字符串末尾的逗号
            string value = Utils.DelLastComma(itemType.ToString());
            valueType.Append(value);
            valueType.Append("];[");
            foreach (String str1 in keyColl)
            {
                foreach (String str2 in suitableType)
                {
                    if (str2.Equals(str1))
                    {
                        int i = dic[str1];
                        valueType.Append(i + ",");
                    }
                }
            }
            DataTable newArticles = BLL_article.GetList(0, "channel_id = " + 7,"sort_id asc,id desc").Tables[0];
            value = Utils.DelLastComma(valueType.ToString());
            result.Append(value);
            result.Append("];[");
            #region 文字区域动态数据获取=========
            //获取女士专用产品的数量
            DataTable ladys = BLL_article.GetList2(0, "channel_id=" + 7, "suitable_classify", "2", "sort_id asc,id desc").Tables[0];
            int ladyCount = ladys.Rows.Count;
            //获取女士专用产品的产品名称
            StringBuilder ladyTitles = new StringBuilder();
            ladyTitles.Append("(");
            foreach(DataRow dr in ladys.Rows)
            {
                string title = dr["title"].ToString();
                ladyTitles.Append(title + ",");
            }
            //去掉末尾的逗号
            string strLady = Utils.DelLastComma(ladyTitles.ToString());

            //获取老年人专用产品的数量
            int oldCount = BLL_article.GetList2(0, "channel_id=" + 7, "suitable_classify", "4", "sort_id asc,id desc").Tables[0].Rows.Count;

            result.Append(ladyCount.ToString() + "个产品");
            result.Append(strLady);
            result.Append(")];[");
            result.Append(oldCount.ToString());
            result.Append("]");
            #endregion
            //输出数据到页面
            context.Response.Write(result.ToString());
            context.Response.End();
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