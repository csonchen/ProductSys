using JCYWebBll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace echartsTest
{
    /// <summary>
    /// test 的摘要说明
    /// </summary>
    public class test : IHttpHandler
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
                    GetTestStatisticsByCategory(context);//按照测试类型统计
                    break;
                case "bystate":
                    GetTestStatisticsByState(context);//按照测试状态统计
                    break;
                case "bybegintime":
                    GetTestStatisticsByBeginTime(context);//按照月份统计数据
                    break;
                default:  
                    break;
            }
        }

        /// <summary>
        /// 按照测试类型统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByCategory(HttpContext context)
        {
            string returnvalue = "[{ value:33,name:'其他'},{ value:52,name:'测试类型1'},{ value:36,name:'测试类型12'},{ value:31,name:'测试类型222121'}]";
       

            context.Response.Write(returnvalue);
            context.Response.End();

        }
        /// <summary>
        /// 按照测试状态统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByState(HttpContext context)
        {
            string returnvalue = "";
           
            context.Response.Write(returnvalue);
            context.Response.End();

        }
        /// <summary>
        /// 按照月份统计
        /// </summary>
        /// <param name="context"></param>
        private void GetTestStatisticsByBeginTime(HttpContext context)
        {
            //Xdata: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            //Ydata: [20, 40, 70, 23, 25, 76, 35, 62, 32, 20, 60, 30],
            var tempstr_X = "";
            var tempstr_Y = "";
            string xxdate = "";
            int xxcount = 0;
            string returnvalue = "['2014-1','2014-2','2014-3','2013-4','2014-4','2013-5'];[2,10,25,1,8,1]";
            context.Response.Write(returnvalue);
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