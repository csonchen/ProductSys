<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productDetail.aspx.cs" Inherits="DTcms.Web.aspx.fg.productDetail" %>
<%@ Register Src="~/aspx/fg/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="~/aspx/fg/bottom.ascx" TagName="bottom" TagPrefix="uc2"%>
<%@ Register Src="~/aspx/fg/leftNav.ascx" TagName="left" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太阳神产品体系-产品资料</title>
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/Site.css" rel="stylesheet" />
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/xbreadcrumbs.js"></script>
    <link href="../../css/xbreadcrumbs.css" rel="stylesheet" />
</head>
<body>
    <div class="customMain">
        <!--头部-->
        <uc1:head ID="head1" runat="server" />
        
            <!--内容区-->
            <div id="bb" class="content">
                <uc3:left ID="left1" runat="server"/>
                <!--右边产品资料展示区-->
                <div id="aa" class="product_detail">
                    <div class="top">
                        <div class="product_img">
                            <img id="productImg" runat="server" alt="" style="max-width:200px;max-height:240px;" border="0" src="../../images/kongbai.jpg" />
                        </div>
                        <div class="detail">
                            <asp:Table ID="Table1" runat="server">
                                
                            </asp:Table>
                        </div>
                         
                        <div class="ex_detail">
                            <asp:Table ID="Table2" runat="server" BorderWidth="1" BorderStyle="Double" CellSpacing="1" Font-Underline="False">
                                <asp:TableRow CssClass="pro_gray">
                                    <asp:TableHeaderCell ColumnSpan="2" Height="35">
                                        <strong>
                                            一、产品基本信息
                                        </strong>
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>

                        <div class="ex_detail">
                            <asp:Table ID="Table3" runat="server" BorderWidth="1" BorderStyle="Double" CellSpacing="1" Font-Underline="False" Width="765px">
                                <asp:TableRow CssClass="pro_gray">
                                    <asp:TableHeaderCell ColumnSpan="2" Height="35">
                                        <strong>
                                            二、产品法规状态
                                        </strong>
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>

                        <div class="ex_detail">
                            <asp:Table ID="Table4" runat="server"  BorderWidth="1" BorderStyle="Double" CellSpacing="1" Font-Underline="False" Width="765px">
                                <asp:TableRow CssClass="pro_gray">
                                    <asp:TableHeaderCell ColumnSpan="2" Height="35">
                                        <strong>
                                            三、产品科技内涵
                                        </strong>
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                                
                            </asp:Table>
                        </div>
                        
                        <div class="foot_detail">
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="description_context">
                                        <span>创建时间: 2012/7/6 12:19 创建者: </span>
                                        <span>
                                            <a href="#">黄象尧</a>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="description_context">
                                        <span>上次修改时间: 2013/10/12 16:38 修改者:  </span>
                                        <span>
                                            <a href="#">劳祖宏</a>
                                        </span>
                                    </td>
                                </tr>
                            </table>
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
        var a = document.getElementById("aa");
        var b = document.getElementById("bb");
        //简单计算用于自适应
        b.style.height = a.clientHeight + "px";

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
