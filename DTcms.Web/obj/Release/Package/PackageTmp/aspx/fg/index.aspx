<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DTcms.Web.aspx.fg.index" %>
<%@ Register Src="~/aspx/fg/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="~/aspx/fg/bottom.ascx" TagName="bottom" TagPrefix="uc2"%>
<%@ Register Src="~/aspx/fg/leftNav.ascx" TagName="left" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太阳神产品体系</title>
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/Site.css" rel="stylesheet" />
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/xbreadcrumbs.js"></script>
    <link href="../../css/xbreadcrumbs.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="customMain">
            <!--头部-->
            <uc1:head ID="head1" runat="server" />
         
            <!--内容区-->
            <div id="bb" class="content">
                <uc3:left ID="left1" runat="server"/>

                <!--右边产品展示区-->
                <div id="aa" class="product_show">
                        <div id="Div1"  runat="server">
                            <div id="products" runat="server" class="product_item">
                                <div class="item_type">
                                    产品信息统计分析
                                </div>
                                <div class="item_content new_content">
                                    <a href="./productCharts.aspx?type=1">各产品品类中不同状态产品的比例</a>
                                    <a href="./productCharts.aspx?type=2">年度研发（或批准）的保健食品数量统计</a>
                                    <a href="./productCharts.aspx?type=3">现有保健食品功能分布</a>
                                    <a href="./productCharts.aspx?type=4">适宜不同人群的保健食品数量</a>
                                </div>
                                <div class="item_type">
                                    产品法规
                                </div>
                                <div runat="server" id="law_nav" class="item_content new_content">

                                </div>
                                <div class="item_type">
                                    上市产品资源管理
                                </div>
                                <div runat="server" id="productType_nav" class="item_content new_content">

                                </div>
                            </div>
                        </div>
                    
                    </div>
            </div>
         
            <!--底部信息区-->
            <uc2:bottom ID="bottom1" runat="server"></uc2:bottom>
        </div>

        <script type="text/javascript">
                $(document).ready(function () {
                    $('#breadcrumbs').xBreadcrumbs();
                });
        </script>

        <script type="text/javascript">
            /*
            *处理高度自适应问题
            */
            var a = document.getElementById("aa");//获取右边产品显示栏元素
            var b = document.getElementById("bb");//获取内容主体元素
            var c = document.getElementById("cc");//获取左边菜单栏元素
            //简单计算用于自适应
            //b.style.height = b.style.height + (a.clientHeight * 2 - 300) + "px";
            //比较左右两边的高度
            if (a.clientHeight > c.clientHeight) {
                b.style.height = a.clientHeight + 30 + "px";
            } else {
                b.style.height = c.clientHeight + 30 + "px";
            }

            //光标移出搜索框
            function searchBlur(inputElement) {
                var val = inputElement.value;
                //去空格
                val = $.trim(val);
                if (val == "" || val == 0) {
                    inputElement.value = "搜索此网站...";
                }
            }
            //光标移进搜索框
            function searchFocus(inputElement) {
                if (inputElement.value == "搜索此网站...") {
                    inputElement.value = "";
                }
            }
        </script>
    </form>
</body>
</html>
