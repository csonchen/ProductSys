using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace JCYWebBll
{
    public class CustomResponse
    {
        public static object GetResponseObject(string responsevalue)
        {
            //判断提交方式
            HttpContext context = HttpContext.Current;
            object id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (context.Request.QueryString[responsevalue] == null)
                {
                    return "";
                }
                id = context.Request.QueryString[responsevalue];
            }
            else
            {
                if (context.Request.Form[responsevalue] == null)
                {
                    return "";
                }
                id = context.Request.Form[responsevalue];
            }
            return id;
        }

        public static string GetResponse(string responsevalue)
        {
            //判断提交方式
            HttpContext context = HttpContext.Current;
            string id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (context.Request.QueryString[responsevalue] == null)
                {
                    return "";
                }
                id = context.Request.QueryString[responsevalue];
            }
            else
            {
                if (context.Request.Form[responsevalue] == null)
                {
                    return "";
                }
                id = context.Request.Form[responsevalue];
            }
            return id;
        }
        public static DateTime GetDateTimeResponse(string responsevalue)
        {
            //判断提交方式
            HttpContext context = HttpContext.Current;
            string id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (context.Request.QueryString[responsevalue] == null)
                {
                    return DateTime.Now;
                }
                id = context.Request.QueryString[responsevalue];
            }
            else
            {
                if (context.Request.Form[responsevalue] == null)
                {
                    return DateTime.Now;
                }
                id = context.Request.Form[responsevalue];
            }
            if (id == "")
            {
                return DateTime.Now;
            }
            else
            {
                DateTime datetme = DateTime.Now;
                DateTime.TryParse(id, out datetme);
                return datetme;
            }

        }
        public static int GetIntResponseArg(string responsevalue)
        {
            //判断提交方式
            HttpContext context = HttpContext.Current;
            string id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (context.Request.QueryString[responsevalue] == null)
                {
                    return 0;
                }
                id = context.Request.QueryString[responsevalue];
            }
            else
            {
                if (context.Request.Form[responsevalue] == null)
                {
                    return 0;
                }
                id = context.Request.Form[responsevalue];
            }
            if (id == "")
            {
                return 0;
            }
            else
            {
                int reid = 0;
                int.TryParse(id, out reid);
                return reid;
            }
        }
     

        /// <summary>
        /// 获取可以为空的DateTime
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Nullable<DateTime> GetDateTimeNullable(string responsevalue)
        {
            HttpContext context = HttpContext.Current;
            string id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (!string.IsNullOrWhiteSpace(context.Request.QueryString[responsevalue]))
                {
                    id = context.Request.QueryString[responsevalue];
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(context.Request.Form[responsevalue]))
                {
                    id = context.Request.Form[responsevalue];
                }
               
            }

            DateTime tempDate = DateTime.Now;
            DateTime? returnValue = null;
            if (DateTime.TryParse(id, out tempDate))
            {
                returnValue = tempDate;
            }
            return returnValue;
        }

        /// <summary>
        /// 获取可以为空的int
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Nullable<int> GetIntNullable(string responsevalue)
        {
            HttpContext context = HttpContext.Current;
            string id = "";
            if (context.Request.RequestType.ToLower() == "get")
            {
                if (!string.IsNullOrWhiteSpace(context.Request.QueryString[responsevalue]))
                {
                    id = context.Request.QueryString[responsevalue];
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(context.Request.Form[responsevalue]))
                {
                    id = context.Request.Form[responsevalue];
                }

            }

            int tempInt = 0;
            int? returnValue = null;
            if (int.TryParse(id, out tempInt))
            {
                returnValue = tempInt;
            }
            return returnValue;
        }
    }
}
