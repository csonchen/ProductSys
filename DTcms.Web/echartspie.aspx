<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="echartspie.aspx.cs" Inherits="echartsTest.echartspie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    	<div class="case_type">
			<div class="pie_chart_name">测试类型</div>
            <!--放置饼图-->
			<div id="div_pieCategory" style="height:210px; width: 300px; float: left;" class="pie_chart_img"></div>
		</div>

        <div class="case_date">                          
            <!--放置柱状图-->
            <div id="div_bar" style="height:210px; width: 300px; float: left;"></div>
        </div>
    </div>
               <input id="hid_category" type="hidden" value="" />
               <input id="hid_state" type="hidden" value="" />
               <input id="hid_date" type="hidden" value="" />   
    </form>
    <script src="../../scripts/js/jquery-1.9.1.js"></script>
    <script src="../../scripts/js/esl.js"></script>
    <script src="../../scripts/BusinessJs/echarts.js"></script>
</body>
</html>
