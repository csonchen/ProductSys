<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productCharts.aspx.cs" Inherits="DTcms.Web.aspx.fg.productCharts" %>
<%@ Register Src="~/aspx/fg/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="~/aspx/fg/bottom.ascx" TagName="bottom" TagPrefix="uc2"%>
<%@ Register Src="~/aspx/fg/leftNav.ascx" TagName="left" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太阳神产品体系-产品图表</title>
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/Site.css" rel="stylesheet" />
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/xbreadcrumbs.js"></script>
    <link href="../../css/xbreadcrumbs.css" rel="stylesheet" />
    <script src="../../scripts/js/esl.js"></script>
    <script type="text/javascript">
        $(function () {
            var str = location.search;
            var array = str.split("=");
            var type = array[1];
            switch (type) {
                case "1":
                    document.getElementById("case_state").style.display = 'inline';
                    break;
                case "2":
                    document.getElementById("case_addtime").style.display = 'inline';
                    document.getElementById("year_product").style.display = 'inline';
                    break;
                case "3":
                    document.getElementById("case_type").style.display = 'inline';
                    document.getElementById("effective_product").style.display = 'inline';
                    break;
                case "4":
                    document.getElementById("case_date").style.display = 'inline';
                    document.getElementById("suitPerople_product").style.display = 'inline';
                default:
                    //默认显示不同人群保健品的适用数量
                    document.getElementById("case_date").style.display = "inline";
                    break;
            }
        });
    </script>
</head>
<body>
    <div class="customMain">
            <!--头部-->
            <uc1:head ID="head1" runat="server" />
        
            <!--内容区-->
            <div id="bb" class="content">
                <uc3:left ID="left1" runat="server"/>

                <!--右边图表展示区-->
                <div id="aa" class="product_show">
                    <div id="position">
                        <div style="padding-left:20px;color:White;"></div>
                    </div>
                    <div>
                        <div id="year_product" class="charts_text" style="display:none">
                            <font size="4">
                                公司目前获得批文的保健食品共<label id="productCount"></label>个（截止至<label id="productMaxYear"></label>年），正常生产与销售的产品<label id="productSellCount"></label>个（<label id="sellPersent"></label>）。
                            </font>
                        </div>
                        <div id="effective_product" class="charts_text" style="display:none">
                            <font size="4">
                                    现有保健食品的功能声称中，符合2003年国家公布的27项功能中的17项（63%），
                                缺少10项（37%）。这缺少的10项功能中，包括了一些主要“大功能”（辅助降血压、辅助降血糖等）。
                            </font>
                        </div>
                        <div id="suitPerople_product" class="charts_text" style="display:none">
                            <font size="4">
                                现有保健食品成年人大多可服用，其中<label id="ladyCount"></label>为女士专用产品，针对中老年人群的产品只有<label id="oldCount"></label>个，孕妇专用产品更是阙如。
                            </font>
                        </div>
                        <div class="charts_photo">
                             <!--动态生成图片-->
                                <div id="case_type"  class="case_type" style="display:none" >
                                    <!--放置饼图-->
			                        <div id="div_pieCategory" style="height:500px; width: 700px; float: left;" class="pie_chart_img"></div>
		                        </div>

                                <div id="case_date"  class="case_date" style="display:none">                          
                                    <!--放置柱状图-->
                                    <div id="div_bar" style="height:500px; width: 750px; float: left;"></div>
                                </div>

                                <div id="case_state" class="case_state" style="display:none">
                                    <!--放置堆积柱状图-->
                                    <div id="div_stack" style="height:500px; width: 700px; float: left;"></div>
                                </div>

                                <div id="case_addtime" class="case_addtime"style="display:none">
                                    <!--放置柱状图（研发产品数量统计图）-->
                                    <div id="div_addtime" style="height:500px; width: 750px; float: left;"></div>
                                </div>
                                <input id="hid_category" type="hidden" value="" />
                                <input id="hid_state" type="hidden" value="" />
                                <input id="hid_date" type="hidden" value="" /> 
                            <!--
                                <img alt="" src="../../images/保健功能分布图.jpg" />
                                -->
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
    <!--动态取出后台的数据生成图-->
    <script src="../../scripts/BusinessJs/product_charts.js"></script>
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
</body>
</html>
