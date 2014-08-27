<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs"
    Inherits="DTcms.Web.aspx.product.productDetails" %>

<%@ Register Src="../ascx/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="../ascx/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品明细页面</title>
    <link href="../css/global.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.3.2.min.js"></script>
    <script src="../../admin/js/function.js" type="text/javascript"></script>
    <style type="text/css">
        .summary
        {
            color: #666;
            margin-bottom: 5px;
            margin-top: 10px;
        }
        .clearfix
        {
            display: block;
            _zoom: 1;
        }
        html
        {
            text-align: center;
        }
        body
        {
            width:100%;
            margin: 0 auto;
            text-align: center;
        }
        .prodetail
        {
        }
        .prodetail ul
        {
            float: left;
            list-style-type: none;
        }
        .prodetail ul leftli
        {
            width: 200px;
        }
        .prodetail ul leftp
        {
            width: 160px;
        }
        .prodetail ul rigthp
        {
            width: 280px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //热点产品
            GetHotProduct(1);
        });
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        //热点产品
        function GetHotProduct(ipage) {
            var stris_hot = 1; //热点标识
            if (stris_hot == "" || stris_hot == undefined) {
                stris_hot = "";
            }
            var productname = $("#productname").html();
            var pagesize = 2;
            //alert(productname);
            var pageindex1 = (parseInt(ipage) - 1) * pagesize + 1;
            var pageindex2 = ipage * pagesize;
            var channel = 2;
            var classidsel1 = 0;
            channel = getUrlParam("channel");
            classidsel1 = getUrlParam("classidsel1");
            var currentclass = getUrlParam("currentclass");
            //if (classidsel1 == undefined || classidsel1 == "" || classidsel1 == "0") {
            //    var currentclass = getUrlParam("currentclass");
            //    $.ajax({
            //        type: 'POST',
            //        dataType: 'json',
            //        url: "productDetails.aspx?action=GetProductFirstClass",
            //        data: { currentclass: currentclass },
            //        cache: false,
            //        beforeSend: function () {
            //            //$('#loading').show();
            //        },
            //        success: function (result) {
            //            if (result.IsOK == "Y") {
            //                classidsel1 = result.Data.firstclass;
            //            }
            //        }
            //    });
            //}
            if (channel == undefined) {channel = 2; }
            if (classidsel1 == undefined) { classidsel1 = 2; }
            //var curretnpage = parseInt(("HotProCPage").val());
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetHotProduct",
                data: { is_hot: stris_hot, pageindex1: pageindex1, pageindex2: pageindex2, productname: productname, channel_id: channel, category_id: currentclass },
                cache: false,
                beforeSend: function () {
                    //$('#loading').show();
                },
                success: function (result) {
                    if (result.IsOK == "Y") {
                        var strHtml = "";
                        var strbody = "";
                        var strtop = "";
                        var strbottom = "";
                        var table = result.Data.hotProductTB;
                        var pagecsize = result.Data.pagesize;


                        for (var i = 0; i < table.length; i++) {
                            var row = table[i];
                            var strImgUrl = "";
                            var strid = "";
                            var strtitle = "";
                            var strAddTime = "";
                            var strPrice = "";
                            var strCompanyName = ""; //品牌名称
                            var row = table[i];
                            if (row.img_url == "" || row.img_url == undefined || row.img_url == null) {
                                strImgUrl = "";
                            }
                            else {
                                strImgUrl = row.img_url;
                            }
                            if (row.id == "" || row.id == undefined || row.id == null) {
                                strid = 0;
                            }
                            else {
                                strid = row.id;
                            }
                            if (row.title == "" || row.title == undefined || row.title == null) {
                                strtitle = "无";
                            }
                            else {
                                strtitle = patchStr(row.title, 16, "", 0);
                            }
                            if (row.add_time == "" || row.add_time == undefined || row.add_time == null) {
                                strAddTime = "无";
                            }
                            else {
                                strAddTime = ChangeDateFormat(row.add_time);
                            }
                            if (row.market_price == "" || row.market_price == undefined || row.market_price == null) {
                                strPrice = 0;
                            }
                            else {
                                strPrice = row.market_price;
                            }
                            if (row.company_name == "" || row.company_name == undefined || row.company_name == null) {
                                strCompanyName = 0;
                            }
                            else {
                                strCompanyName = patchStr(row.company_name, 5, "", 0);
                            }
                            //   var strImgUrl = row.img_url;
                            //    var strid = row.id;
                            //    var strtitle = row.title; //品牌名称
                            //     var strAddTime = ChangeDateFormat(row.add_time);
                            //var strAddTime = row.add_time; //发布时间
                            //   var strPrice = row.market_price; //价格
                            //strbody += "<li   style=\"list-style:none;\"><a href=\"javascript:GetProductType('" + strid + "')\">" + strtitle + "</a></li>";
                            strbody += "<ul class=\"items clearfix\">";
                            strbody += "<li class=\"item\">";
                            strbody += "<div class=\"img\">";
                            //strbody += "<img alt=\"\" src=\"" + strImgUrl + "\"/></div>";
                            strbody += "<table class=\"center\">";
                            strbody += "<tr><td>";
                            strbody += "<a href=\"productDetails.aspx?articleId=" + strid + "\">";
                            strbody += "<img alt=\"\" src=\"" + strImgUrl + "\" style=\"width:200px;height:200px;background-color:white;\" class=\"cover\"/>";
                            strbody += "</td></tr>";
                            strbody += "</table>";
                            strbody += "</div>";
                            strbody += "<div class=\"info\" style=\"text-align:left;\">";
                            strbody += "<ul class=\"clearfix\">";
                            strbody += "<div class=\"info\">";
                            strbody += "<li>";
                            //strbody += "<a href=\"productDetails.aspx?articleId=" + strid + "\">" + strtitle + "</a>";
                            strbody += "<a href=\"productDetails.aspx?articleId=" + strid + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" >" + strtitle + "</a>";

                            strbody += "</li>";
                            strbody += "<li>";
                            strbody += "<span>品牌：" + strCompanyName + "</span>";
                            strbody += "</li>";
                            strbody += "<li>";
                            strbody += "<span>参考价格：" + strPrice + "</span>";
                            strbody += "</li>";
                            strbody += "</div></ul></div></li></ul>";
                        }
                        var up = parseInt(ipage) - 1;
                        if (up <= 0) { up = 1; }
                        var down = parseInt(ipage) + 1;
                        if (parseInt(pagecsize) <= 0) { down = parseInt(ipage) - 1 }
                        if (parseInt(pagecsize) < 2) { down = parseInt(ipage) }
                        strtop = "<div style=\"float:left;text-align:center;width:100%;\"><a href=\"javascript:GetHotProduct(" + up + ")\" >上一页</a>　<a href=\"javascript:GetHotProduct(" + down + ")\" >下一页</a></div><div class=\"bd\" style=\"margin-top:20px;\">";
                        strbody += "</div>";
                        strbottom = "<div style=\"float:left;text-align:center;width:100%\"><a href=\"javascript:GetHotProduct(" + up + ")\" >上一页</a>　<a href=\"javascript:GetHotProduct(" + down + ")\" >下一页</a></div>";
                        strHtml = strtop + strbody + strbottom;
                        $("#hotProduct").html(strHtml);
                        $("#hotProduct").html(strHtml);
                        //GetInventoryClass();
                        //sourchByClass(sparent);
                    }
                },
                error: function () {
                    var ddd = 0;
                    //alert('网络错误!');
                },
                complete: function () {
                    var ddd = 0;
                    //$('#loading').hide();
                }
            });
        }
        function ChangeDateFormat(cellval) {
            var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            return date.getFullYear() + "-" + month + "-" + currentDate;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mybody">
        <uc1:head ID="head1" runat="server" />
        <div class="body">
            <div class="inner" style="float: left;">
                <div class="topbar-search">
                    <div style="float:left;margin-left:10px">产品列表＞
                    <asp:Repeater ID="relist2" runat="server">
                        <%--<ItemTemplate><%#Eval("artTitle").ToString().Length > 7 ? Eval("artTitle").ToString().Substring(0, 7)+"..." : Eval("artTitle").ToString()%>--%>
                        <ItemTemplate><%#Eval("artTitle").ToString()%>
                        </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="inneraa">
                <div class="list-itemlist">
                    <div class="clear">
                    </div>
                    <div style="width: 20%; float: left; margin-top: 10px">
                        <%--相关产品开始--%>
                        <div class="list-aside">
                            <div id="list-p4p-aside" class="list-mod">
                                
                                    <div class="vertical">
                                        <div class="hd clearfix">
                                            <p class="text">
                                                <a href="#" target="_blank">相关产品</a></p>
                                            <input type="hidden" id="HotProCPage" value="1" />
                                        </div>
                                        <div id="hotProduct" style="padding:3px;">
                                            <div class="bd">
                                                <ul class="items clearfix">
                                                    <li class="item">
                                                        <div class="img">
                                                            <table class="center">
                                                                <tr>
                                                                    <td>
                                                                        <a href="#"></a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="info">
                                                            <ul class="clearfix">
                                                                <li><a href="#" target="_blank">XXXXXX产品1</a> </li>
                                                                <li><span>产品描述2....</span> </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                
                            </div>
                        </div>
                        <%--相关产品结束--%>
                    </div>
                    <div style="width: 80%; float: left; margin-top: 10px">
                        <div style="border-style: solid; border-width: 1px; border-color: #CCCCCC; padding: 10px">
                            <div style="text-align: left;">
                                <asp:Repeater ID="relist1" runat="server">
                                    <ItemTemplate>
                                        <div style="text-align:left;float:right;">
                                                <img alt="" style="width: 300px; height: 300px; margin-right: 20px;
                                                    padding-left: 10px" src='<%#Eval("artimgurl")%>' /></div>
                                        <div style="float:left;width:650px">
                                        <div title="<%#Eval("artTitle")%>" class="rowspace">
                                        <div class="rowleftformat">产品名称：</div>
                                        <body><div id="productname" class="rowrightformat"><%#Eval("artTitle").ToString().Length > 45 ? Eval("artTitle").ToString().Substring(0, 45)+"..." : Eval("artTitle")%></div></body>
                                        </div>
                                        <div class="clear"></div>
                                        <div title="<%#Eval("company_name")%>" class="rowspace">
                                         <div class="rowleftformat">企业名称：</div>
                                         <div class="rowrightformat"><%#Eval("company_name").ToString().Length > 45 ? Eval("company_name").ToString().Substring(0, 45) + "..." : Eval("company_name")%></div>
                                         </div>
                                        <div class="clear"></div>
                                        <div class="rowspace">
                                         <div class="rowleftformat">产品类别：</div>
                                         <div class="rowrightformat"><%#Eval("catTitle")%></div>
                                         </div>
                                        <div class="clear"></div>
                                        <div class="rowspace">
                                        <div class="rowleftformat">产品规格：</div>
                                        <div class="rowrightformat"><%#Eval("goods_size")%></div>
                                        </div>
                                        <div class="clear"></div>
                                        <div class="rowspace">
                                        <div class="rowleftformat">产品价格：</div>
                                        <div class="rowrightformat"><%#Eval("market_price") %></div>
                                        </div>
                                        
                                        </div>
                                        <%--<div style="text-align: left; padding: 5px; margin: 10px;">
                                            &nbsp &nbsp &nbsp 发布时间：<%#Eval("artaddtime")%></div>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater ID="relistAtrribute" runat="server">
                                    <ItemTemplate>
                                        <div style="float:left;width:650px">
                                            <div class="rowspace">
 
                                            <div class="rowleftformat"><%#Eval("arrributeType")%></div>
                                            <div class="rowrightformat"><%#Eval("content") %></div>
                                            
                                                <%--<div style="float:left;text-align:left;width:115px;"><%#Eval("arrributeType")%></div>
                                                <div style="float:right;text-align:left;width:83%"><%#Eval("content") %></div>--%>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="clear">
                                </div>
                                <div>
                                    <div style="background-color: #CCCCCC; height: 30px; vertical-align: middle; margin-top: 15px;
                                        text-align: center;">
                                        其他备注信息：</div>
                                    <asp:Repeater ID="replistContent" runat="server">
                                        <ItemTemplate>
                                            <div style="text-align: left">
                                                <%#Eval("artcontent")%></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <uc2:bottom ID="bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
