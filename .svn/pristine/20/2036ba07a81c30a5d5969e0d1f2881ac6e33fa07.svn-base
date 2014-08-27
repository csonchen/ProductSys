<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productClassify.aspx.cs" Inherits="DTcms.Web.aspx.fg.productClassify" %>

<%@ Register Src="~/aspx/fg/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="~/aspx/fg/bottom.ascx" TagName="bottom" TagPrefix="uc2"%>
<%@ Register Src="~/aspx/fg/leftNav.ascx" TagName="left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太阳神产品体系-产品分类</title>
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/Site.css" rel="stylesheet" />
    
    
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.7.2.js"></script>
    
    <script type="text/javascript" src="js/jquery.pagination.js"></script>
    <script type="text/javascript" src="js/proSys.js"></script>

    <link href="../../css/JQpagination.css" rel="stylesheet" />
    <link href="../../css/xbreadcrumbs.css" rel="stylesheet" />

    
    <style type="text/css">
        .product_item .item_type 
        {
            margin-top: 10px;
        }
        .attrName {
            background-color:#C33;
            color:white;
            width:100px;
            font-size:large;
            text-align:center;
        }


        #search_box { 
            width: 201px; 
            height: 31px; 
            background: url(../../images/bg_search_box.gif); 
            display: inline-block;
            float: right;
            margin-bottom: -12px;
            margin-right: 20px;
        } 
        #search_box #search_text { 
            float: left; 
            padding: 0; 
            margin: 6px 0 0 6px; 
            border: 0; 
            width: 159px; 
            background: none; 
            font-size: 12px;
            color:gray;
        } 
        #search_box #to_search { 
            float: right; 
            margin: 3px 4px 0 0; 
        } 

        #category a:hover {
            text-decoration: none;
            background-color: lemonChiffon;
        }

        #category i { position:absolute; right:0;left: 175px; top:0; display:block; width:28px; height:100%; background:url(../../admin/skin/default/skin_icons.png)  -49px -160px no-repeat #fafafa;}
    </style>
</head>
<body>
    
    <div class="customMain">
        <!--头部-->
        <uc1:head ID="head1" runat="server" />
         
        <!--内容区-->
        <div id="bb" class="content">
                <uc3:left ID="left1" runat="server"/>
                <!--右边产品展示区-->
                <div id="aa" class="product_show">
                    <div>
                        <div id="category" class="product_item">
                            <!--多级联动分类列表，JS动态加载数据-->
                        </div>
                        <div id="content" runat="server" class="product_item">
                            <!--后台动态加载数据-->
                        </div>
                        <div class="product_item">
                            <div id="totalTip" style="color:black;font-size:15px;display: inline-block;line-height: 30px;"></div>
                            <!--搜索框-->
                            <div id="search_box"> 
                                <input type="text" id="search_text" value="搜索产品..." onfocus="search_focus()" onblur="search_blur()" onkeydown="if(event.keyCode==13){search();}" class="swap_value" /> 
                                <a href="javascript:search();"><image src="../../images/btn_search_box.gif" width="27" height="24" id="to_search"/></a>
                            </div>
                        </div>

                        <br style="clear:both;" />
                        <div id="photos" class="product_item" style="margin-top: -25px;">
                            <!--产品图片显示，JS动态加载数据-->
                        </div>

                        <br style="clear:both;" />
                        <br />
                        <div id="Pagination" class="pagination">
                            <!--分页插件-->
                        </div>  
                    </div>
                    
                </div>
            </div>
         
        <!--底部信息区-->
        <uc2:bottom ID="bottom1" runat="server"></uc2:bottom>   
    </div>

    
    <script type="text/javascript" src="../../scripts/xbreadcrumbs.js"></script>
    <script type="text/javascript" src="../../scripts/js/esl.js"></script>
    <script type="text/javascript" src="../../scripts/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#breadcrumbs').xBreadcrumbs();
        });
    </script>

    <script type="text/javascript">
        function suitScreen() {
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
                b.style.height = a.clientHeight + 10 + "px";
            } else {
                b.style.height = c.clientHeight + 10 + "px";
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
        }
        suitScreen();
    </script>   


    
</body>
</html>
