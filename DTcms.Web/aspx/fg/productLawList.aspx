<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productLawList.aspx.cs" Inherits="DTcms.Web.aspx.fg.productLawList" %>
<%@ Register Src="~/aspx/fg/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="~/aspx/fg/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>太阳神产品体系-产品法规</title>
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/Site.css" rel="stylesheet" />
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../../scripts/xbreadcrumbs.js"></script>
    <script type="text/javascript" src="js/jquery.pagination.js"></script>
    <script type="text/javascript">
        //分页每页显示数目
        var items_per_page = 30;
        var jsonObj;

        $(document).ready(function () {
            $('#breadcrumbs').xBreadcrumbs();

            jsonObj = eval("(" + $("#LawJson").val() + ")");

            $("#Pagination").pagination(jsonObj.laws.length, {
                'items_per_page': items_per_page,
                'num_display_entries': 5,
                'num_edge_entries': 1,
                'prev_text': "上一页",
                'next_text': "下一页",
                'callback': pageselectCallback
            });
        });

        //选择分页时，加载替换主体内容框中产品信息
        function pageselectCallback(page_index, jq) {
            $("#mylaw tr").not("#head").remove();
            for (var i = page_index * items_per_page; i < jsonObj.laws.length && i < items_per_page * (page_index + 1) ; i++) {
                var checkBox = $("<input></input>").attr("type", "checkbox").attr("name", "ct121");
                var img = $("<img/>").attr("src", "../../images/" + jsonObj.laws[i].type + ".png");
                var a = $("<a target='_blank'></a>").attr("href", "showDoc.aspx?filePath=" + jsonObj.laws[i].file_path).html(jsonObj.laws[i].title);
                var tr = $("<tr></tr>").append($("<td></td>").append(checkBox)).append($("<td></td>").append(img)).append($("<td></td>").append(a))
                           .append($("<td></td>").append(jsonObj.laws[i].category)).append($("<td></td>").append("")).append($("<td></td>").append(jsonObj.laws[i].updateTime)).append($("<td></td>").append(jsonObj.laws[i].modify_person));
                $("#mylaw tbody").append(tr);
            }
            return true;
        }
    </script>
    <link href="../../css/JQpagination.css" rel="stylesheet" />
    <link href="../../css/xbreadcrumbs.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="customMain">
        <!--头部-->
        <uc1:head ID="head1" runat="server" />
         
        <!--内容区-->
        <div id="bb" class="content">
                <!--左边菜单栏-->
                <div id="cc" class="product_type">
                    <div  class="law_tool">
                        <h2><img src="../../images/itdl.png" />产品法规</h2>
                        <ul runat="server" id="law_nav">
                            
                        </ul>
                    </div>
                </div>

                <!--右边产品展示区-->
                <div id="aa" class="product_show">
                    <div class="law_body">
                        <input type="hidden" id="LawJson" runat="server" />
                        <asp:Table runat="server" ID="mylaw" Width="100%" CellSpacing="0" CellPadding="0" BorderWidth="0">
                            <asp:TableHeaderRow ID="head">
                                <asp:TableHeaderCell CssClass="law_checkbox" Width="5%">
                                    <input type="checkbox"/>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_icon" Width="5%">
                                    类型
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_title" Width="30%">
                                    名称
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_type" Width="13%">
                                    类别
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_biaoqian" Width="10%">
                                    文档标签
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_updatetime" Width="18%">
                                    修改时间
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_updateperson" Width="7%">
                                    修改者
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="law_level" Width="12%">
                                    等级（0-5）
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>
                         
                    </div>
                    
                </div>
            </div>
        <div id="Pagination" class="pagination" style="margin-left:400px;">
          <!--分页插件-->
         </div> 
        <!--底部信息区-->
        <uc2:bottom ID="bottom1" runat="server"></uc2:bottom>   
    </div>


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
    </script>
    </form>
</body>
</html>
