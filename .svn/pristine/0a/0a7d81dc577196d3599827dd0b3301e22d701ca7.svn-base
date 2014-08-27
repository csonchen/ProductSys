<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DTcms.Web.aspx.product.Index" %>

<%@ Register Src="../ascx/head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="../ascx/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>产品情报页面</title>
    <link href="../css/global.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script src="../../scripts/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../scripts/jquery/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../admin/js/function.js" type="text/javascript"></script>
    <style type="text/css">
        .value
        {
            color:Black;
        }
         .value1
        {
            color:#C40000;
        }

        
        .btnUnDelete
        {
            background: url(../css/Image/undelete.jpg) no-repeat;
            height: 14px;
            width: 10px;
            border: 0px;
        }
        
        #companyId
        {
            overflow: hidden;
            font-size: 12px;
        }
        #proTypeId1
        {
            overflow: hidden;
            font-size: 12px;
        }
        #proTypeId2
        {
            overflow: hidden;
            font-size: 12px;
        }
        #proTypeId3
        {
            overflow: hidden;
            font-size: 12px;
        }
        .hiddenbox
        {
            display: none;
        }
        html
        {
            text-align: center;
        }
        body
        {
            width: 100%;
            margin: 0 auto;
            text-align: center;
        }
        .style1
        {
            width: 38px;
            height: 26px;
        }
        .style2
        {
            width: 61px;
            height: 22px;
        }
        #bottom
        {
            background: none repeat scroll 0 0 #F7F7F7;
            border-top: 0px solid #FFFFFF;
            padding-bottom: 48px;
            width: 100%;
        }
        .bottom
        {
            line-height: 20px;
            margin: 0 auto;
            overflow: hidden;
            padding: 10px 21px 0 12px;
            width: 938px;
        }
        
        .bot_menu
        {
            float: left;
            font-family: "微软雅黑";
            line-height: 20px;
            width: 480px;
        }
    </style>
    <script type="text/javascript">
        function show() {
            var obj = document.getElementById("companyId"); //要作用的品牌DIV
            var objBrand = document.getElementById("brandClassId"); //要作用的品牌分类DIV
            var obj1 = document.getElementById("test1"); //作用的按钮“更多”
            if (obj1.title == '展开') {
                $("#test1").html("∧收起");
                obj.style.height = 75 + 'px';
                obj.style.overflow = 'auto';
                objBrand.style.height = 75 + 'px';
                objBrand.style.overflow = 'hidden';
                obj1.title = '隐藏';
            }
            else {
                $("#test1").html("∨更多");
                obj.style.height = 44 + 'px';
                obj.style.overflow = 'hidden';
                objBrand.style.height =44 + "px";
                objBrand.style.overflow = 'auto';
                obj1.title = '展开';
            }
        }
        function show1() {
            var obj = document.getElementById("proTypeId1"); //要作用的DIV
            var obj1 = document.getElementById("test1"); //作用的按钮
            if (obj1.title == '展开') {
                obj.style.height = null;
                obj.style.overflow = 'auto';
                obj1.title = '隐藏';
            }
            else {
                obj.style.height = 20 + 'px';
                obj.style.overflow = 'hidden';
                obj1.title = '展开';
            }
        }

    </script>

    <script type="text/javascript">
        var sorttype = "default_sort";
        var timesort = 1; //0表示时间正序排序，1表示时间倒叙排序
        var pricesort = 0; //0表示价格正序排序，1表示价格倒叙排序
        var productsort = 0; //0表示产品正序排序，1表示产品倒叙排序
        var channel = ""; //所选频道
        var blandidlist = ""; //所选品牌项列表，以盗号分开
        var classid = ""; //所选大分类
        var classidlist = ""; //所选分类项列表，以逗号分开
        var addclasslist = ""; //所选扩展属性，以逗号分开
        var displaytype = 1; //0表示列表展示，1表示图片展示
        var strlayer = 1;
        function sourch(strtype, sort) {
            if (strtype == "timesort") {
                if (timesort == 0) {
                    timesort = 1;
                    $("#time_sort").html("时间排序↑");
                }
                else if (timesort == 1) {
                    timesort = 0;
                    $("#time_sort").html("时间排序↓");
                }
                sorttype = "timesort";
                $("#time_sort").attr("class", "selecteda");
                $("#price_sort").attr("class", "noselect");
                $("#price_sort").html("价格排序");
                $("#default_sort").attr("class", "noselect");
            }
            else if (strtype == "pricesort") {
                if (pricesort == 0) {
                    pricesort = 1;
                    $("#price_sort").html("价格排序↑");
                }
                else if (pricesort == 1) {
                    pricesort = 0;
                    $("#price_sort").html("价格排序↓");
                }
                sorttype = "pricesort";
                $("#price_sort").attr("class", "selecteda");
                $("#time_sort").attr("class", "noselect");
                $("#time_sort").html("时间排序");
                $("#default_sort").attr("class", "noselect");
            }
            else if (strtype == "productsort") {
                if (productsort == 0) {
                    productsort = 1;
                }
                else if (productsort == 1) {
                    productsort = 0;
                }
            }
            else if (strtype == "displaytype") {
                displaytype = sort;
            }
            else if (strtype == "default_sort") {
                sorttype = "default_sort";
                $("#default_sort").attr("class", "selecteda");
                $("#price_sort").attr("class", "noselect");
                $("#price_sort").html("价格排序");
                $("#time_sort").attr("class", "noselect");
                $("#time_sort").html("时间排序");
            }
            GetInventoryByClass();
        }

        function sourchByClass(class_id, addclass, addclassid) {
            if (class_id == undefined) { class_id = ""; }
            if (addclass == undefined) { addclass = ""; }
            if (addclassid == undefined) { addclassid = ""; }
            if (addclasslist == undefined) { addclasslist = ""; }
            var attrid = addclassid.substr(0, addclassid.toString().indexOf('_'));
            if (addclass!=""){
                if (addclasslist != undefined && addclasslist != "" && addclasslist.toString().indexOf(addclass) >= 0) {
                    addclasslist = addclasslist.replace(attrid + '!' + addclass, "");
                    addclasslist = addclasslist.replace(",,", ",");

                
                    $('#addclassstyle_' + addclassid).attr("class", "cat");
                    $('#value_' + addclassid).attr("class", "value");
                    $("#Inventory_" + addclassid).hide();
                }
                else {
                    if (addclasslist != undefined && addclasslist.length <= 0) { addclasslist = attrid + '!' + addclass; }
                    else { addclasslist += "," + attrid + '!' + addclass}
                    $('#addclassstyle_' + addclassid).attr("class", "cat1");
                    $('#value_' + addclassid).attr("class", "value1");
                    $("#Inventory_" + addclassid).show();
                    $("#Inventory_" + addclassid).bind('click', function () {
                        $("#Inventory_" + addclassid).hide();
                        addclasslist = addclasslist.replace(addclass, "");
                        addclasslist = addclasslist.replace(",,", ",");
                        $('#addclassstyle_' + addclassid).attr("class", "cat");
                        $('#value_' + addclassid).attr("class", "value");
                        if (firstload == 1) { GetInventoryByClass(); }
                    });
                }
            }
            if (addclasslist.substr(0, 1) == ",") { addclasslist = addclasslist.substr(1, addclasslist.length - 1); }
            if (addclasslist.substr((addclasslist.length - 1), 1) == ",") { addclasslist = addclasslist.substr(0, addclasslist.length - 1); }
            if (firstload == 1) { GetInventoryByClass(); }
        }

        //var oldchannelid = "";
        function sourchByBland(bland_id) {
            if (bland_id == undefined) { bland_id = ""; }
            else if (bland_id == "0") {
                if (blandidlist.indexOf(",")) {
                    var items = blandidlist.split(",");
                    for (var i = 0; i < items.length; i++) {
                        UnSetBlandStyle(items[i]);
                    }
                } else { UnSetBlandStyle(blandidlist); }
                blandidlist = "";
            } else {
                if (blandidlist.indexOf(bland_id + ",") >= 0) {
                    UnSetBlandStyle(bland_id); 
                    return;
                }
                else {
                    blandidlist += bland_id + ",";
                }
            }
            //            blandidlist = bland_id
            //            $("#ProductBland_" + oldchannelid).attr("class", "noselect");
//            $("#ProductBland_" + bland_id).attr("class", "selecteda");
//            $("#btn_" + bland_id).show();
            SetBlandStyle(bland_id);
            //            if (oldchannelid != bland_id) {
            //                $("#btn_" + oldchannelid).hide();
            //            }
            //            oldchannelid = bland_id;
//            $("#btn_" + bland_id).bind('click', function () {
//                $("#btn_" + bland_id).hide();
//                //                $("#ProductBland_" + oldchannelid).attr("class", "noselect");
//                $("#ProductBland_" + bland_id).attr("class", "noselect");
//                //                blandidlist = bland_id;
//                var strbland_id = bland_id + ",";
//                blandidlist = blandidlist.replace(strbland_id, "");
//                GetInventoryByClass();
//            });
            GetInventoryByClass();
        }

        function SetBlandStyle(bland_id) {
            $("#ProductBland_" + bland_id).attr("class", "selecteda");
            $("#btn_" + bland_id).show();
        }

        function UnSetBlandStyle(bland_id) {
            $("#btn_" + bland_id).hide();
            //                $("#ProductBland_" + oldchannelid).attr("class", "noselect");
            $("#ProductBland_" + bland_id).attr("class", "noselect");
            //                blandidlist = bland_id;
            var strbland_id = bland_id + ",";
            //blandidlist = blandidlist.replace(strbland_id, "");
            re = new RegExp(strbland_id, "g");
            blandidlist = blandidlist.replace(re, "");
            GetInventoryByClass();
        }

        function sourchByDClass(class_id) {
            if (class_id == undefined) { class_id = ""; }
            classid = class_id
            GetInventoryByClass();
        }
        //属性分类
        function GetInventoryClass() {
            var strchannel_id = channel;
            var strcategory_id = classid;
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetProductClass",
                data: { channel_id: strchannel_id, category_id: strcategory_id },

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
                        var strdefault_value = "";
                        var table = result.Data.proTable;
                        $.each(table, function (index, row) {
                            var strid = row.id;
                            var strtitle = row.title; //标题
                            strdefault_value = row.default_value; //默认属性
                            //strdefault_value = patchStr(strdefault_value,8," ",0);
                            var strchannel_id = row.channel_id;
                            var strcategory_id = row.category_id;
                            strHtml += "<tr class=\"row\">";
                            strHtml += "<td class=\"row-hd\">";
                            //strHtml += "<span class=\"cat \" style=\"margin-top:0px\"><a style=\"color:white;margin-left:8px;\"  href=\"javascript:sourchByClass('" + strcategory_id + "')\">" + strtitle + "</a></span>";
                            strHtml += "<span class=\"cat \" style=\"margin-top:0px\"><a style=\"color:white;margin-left:8px;\">" + strtitle + "</a></span>";
                            strHtml += "</td>";
                            strHtml += "<td style=\"overflow:hidden;word-break:break-all;border-bottom: 1px dotted #E0E0E0;\">";
                            //组建扩展属性列表
                            var strdefaults = strdefault_value.split(",");
                            
                            var i = 0;
                            for (i; i < strdefaults.length; i++) {
                                var straddclassTip = strdefaults[i];
                                var straddclass = patchStr(strdefaults[i], 7, "", 0);
                                if (straddclass != undefined && straddclass != "") {
                                    strHtml += "<div style=\"width:125px;heigth:26px;text-align:left;float:left;\">";
                                    strHtml += "<span title=\"" + straddclassTip + "\" class=\"cat \"  id=\"addclassstyle_" + strid + "_" + i + "\" style=\"margin-top:2px;\">";
                                    strHtml += "<a class=\"value\" id=\"value_" + strid + "_" + i + "\" href=\"javascript:sourchByClass('" + strcategory_id + "','" + straddclassTip + "','" + strid + "_" + i + "')\">" + straddclass + "</a>";
                                    strHtml += "</span>";
                                    strHtml += "<img src=\"../css/Image/delete.jpg\" class=\"crumbDelete2\" id=\"Inventory_" + strid + "_" + i + "\"  />";
                                    strHtml += "</div>";
                                }
                            }
                            strHtml += "</td>";
                            strHtml += "</tr>";
                        });
                        $("#Pros").html(strHtml);
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
        function trim(s) {
            try {
                return s.replace(/^\s+|\s+$/g, "");
            }
            catch (e) {
                return s;
            }
        }
        //产品类别分类
        var OldStrId = 0;
        var Layer = 0; //点击的分类级别
        var firstTypeId = ""; //点击一级分类Id
        var twoTypeId = ""; //点击一级分类Id
        var scendTypeId = ""; //点击一级分类Id
        var parentId = 0; ; //分类父Id
        var strclasslist = "";
        var IsLayerDown = 0;
        function GetProductType(str_id,sclasslayer,parentId) {
            var strchannel_id = channel; //产品频道ID
            var strcategory_id = str_id; //产品分类ID
            var strParentId = parentId;
            if (str_id == "" || str_id == undefined) {
                strcategory_id = "";
            }
            if (parentId == "" || parentId == undefined) {
                strParentId = "";
            }
            if (IsLayerDown == 0) {
                if (sclasslayer == 0 || sclasslayer == 1) {
                    if (str_id == classidsel1 && str_id != "") {
                        IsLayerDown = 1;
                        UnSetProClassStyle(str_id, sclasslayer);
                        classidsel1 = 0;
                        classidsel2 = 0;
                        classidsel3 = 0;
                        addclasslist = "";
                        return;
                    }
                }
                else if (sclasslayer == 2) {
                    if (str_id == classidsel2 && str_id != "") {
                        IsLayerDown = 1;
                        UnSetProClassStyle(str_id, sclasslayer);
                        classidsel2 = 0;
                        classidsel3 = 0;
                        addclasslist = "";
                        return;
                    }
                }
                else if (sclasslayer == 3) {
                    if (str_id == classidsel3 && str_id != "") {
                        IsLayerDown = 1;
                        UnSetProClassStyle(str_id, sclasslayer);
                        classidsel3 = 0;
                        addclasslist = "";
                        return;
                    }
                }
            }
            var strClassLayer = parseInt(sclasslayer) + 1;   //分类级别1、2、3
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetProductType",
                data: { channel_id: strchannel_id, category_id: strcategory_id, class_layer: sclasslayer, parent_id: strParentId },
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
                        var table = result.Data.productClassTB;
                        $.each(table, function (index, row) {
                            var strid = row.id;
                            var strtitle = row.title; //标题
                            var strchannel_id = row.channel_id;
                            var strclass_layer = row.class_layer; //分类级别
                            var strclassList = row.class_list; //class_list
                            var strSingleclassList = strclassList.split(','); //分割classList获取单个id
                            for (var i = 0; i < strSingleclassList.length; i++) {
                                strclasslist = strSingleclassList[i];
                            }
                            if (index < 10 && (strclass_layer == 2 || strclass_layer == 3)) {
                            }
                            else if (index == 10 && (strclass_layer == 2 || strclass_layer == 3)) {
                                //                                strbody += "<li style=\"float:right; position:inherit;\"><a id=\"test1\"  href=\"javascript:void(0);\" onclick=\"show1();\" title=\"展开\">更多</a></li>";
                                //                                strbody += "<br>";
                                //                                strbody += "</ul><ul>";
                            }
                            else {
                            }
                            strbody += "<li>";
                            strbody += "<a id=\"ProductClass_" + strid + "\" class=\"noselect\" href=\"javascript:GetProductType('" + strid + "','" + strclass_layer + "')\">" + strtitle + "</a>";
                            strbody += "<img src=\"../css/Image/delete.jpg\" class=\"crumbDelete\" id=\"Product_" + strid + "\" onclick=\"UnSetProClassStyle('" + strid + "','" + strclass_layer + "')\"  />";
                            strbody += "</li>";
                            // strbody += "<li><a id=\"ProductClass_" + strid + "\" class=\"noselect\" style=\"color:Black;\" href=\"javascript:GetProductType('" + strid + "','" + strclass_layer + "')\">" + strtitle + "</a><input class=\"btnDelete\" id=\"Product_" + strid + "\" type=\"button\" style=\"display:none;\" /></li>";

                        });
                        if (parseInt(sclasslayer) == 0) {
                            //strbody = "<li><a id=\"ProductClass_0\" class=\"noselect\" href=\"javascript:GetProductType('0','1')\">全部</a></li>" + strbody;
                        }
                        var proClassId = $("#proClassId");
                        //设置分类Div适应高度
                        if (sclasslayer == 0) {
                            proClassId.attr("style", "border:0px;border-bottom: 1px dotted #E0E0E0;float:left;color:white;width:108px;height:22px;margin-bottom: 0px;background-color:#B10000;");
                        }
                        if (sclasslayer == 1) {
                            if (strbody != "") {
                                proClassId.attr("style", "border:0px;border-bottom: 1px dotted #E0E0E0;float:left;color:white;width:108px;height:50px;margin-bottom: 0px;background-color:#B10000;");
                            }
                            else {
                                proClassId.attr("style", "border:0px;border-bottom: 1px dotted #E0E0E0;float:left;color:white;width:108px;height:22px;margin-bottom: 0px;background-color:#B10000;");
                            }
                        }
                        else if (sclasslayer == 2) {
                            if (strbody != "") {
                                proClassId.attr("style", "border:0px;border-bottom: 1px dotted #E0E0E0;float:left;color:white;width:108px;height:78px;margin-bottom: 0px;background-color:#B10000;");
                            }
                            else {
                                proClassId.attr("style", "border:0px;border-bottom: 1px dotted #E0E0E0;float:left;color:white;width:108px;height:50px;margin-bottom: 0px;background-color:#B10000;");
                            }
                        }
                        if (strbody != "") {
                            $("#proTypeId" + strClassLayer).show();
                        } else {
                            $("#proTypeId" + strClassLayer).hide();
                        }
                        SetProClassStyle(str_id, sclasslayer, parentId)
                        strtop = "<ul>";
                        strbottom = "</ul>";
                        strHtml = strtop + strbody + strbottom;
                        $("#proTypeId" + strClassLayer).html(strHtml); //拼接Html

                        //设置下级显示状态
                        var num = parseInt(strClassLayer) + 1;
                        $("#proTypeId" + num).html("");
                        $("#proTypeId" + num).hide();

                        //设置选中和不选中样式

                        //   $("#ProductClass_" + classid).attr("class", "noselect");

                        classid = str_id;
                        GetInventoryClass();
                        if (firstload == 1) { GetInventoryClass(); }
                        sourchByClass(str_id);
                    }
                },
                error: function () {
                    var ddd = 0;
                    //alert('网络错误!');
                },
                complete: function () {
                    var ddd = 0;
                    IsLayerDown = 0;
                    //$('#loading').hide();
                }
            });
        }

        var classidsel1 = 0, classidsel2 = 0, classidsel3 = 0;
        function SetProClassStyle(str_id, sclasslayer, parentId) {
            //str_id编号, sclasslayer级层, parentId父级编号
            if (sclasslayer == 1) {
                if (classidsel1 != str_id) {
                    SetProClassStyleByID(classidsel1, 0);
                }
                classidsel1 = str_id;
                GetHotProduct(1);
             }
            else if (sclasslayer == 2) {
                if (classidsel2 != str_id) {
                    SetProClassStyleByID(classidsel2, 0);
                }
                classidsel2 = str_id; 
            }
            else if (sclasslayer == 3) {
                if (classidsel3 != str_id) {
                    SetProClassStyleByID(classidsel3, 0);
                }
                classidsel3 = str_id;
            }
            SetProClassStyleByID(str_id, 1);
        }
        function UnSetProClassStyle(str_id, sclasslayer) {
            if (sclasslayer == 1) {
                classid = 0;
                var num = parseInt(sclasslayer) + 2;
                $("#proTypeId" + num).html("");
                $("#proTypeId" + num).hide();
            }
            else if (sclasslayer == 2) {
                classid = classidsel1;
            }
            else if (sclasslayer == 3) {
                classid = classidsel2;
            }
            var num = parseInt(sclasslayer) - 1;
            GetProductType(classid, num);
//            //设置下级显示状态
//            var num = parseInt(sclasslayer) + 1;
//            $("#proTypeId" + num).html("");
//            $("#proTypeId" + num).hide();
//            SetProClassStyleByID(str_id, 0);
        }
        function SetProClassStyleByID(str_id, itype) {
            if (itype == 0) {
                $("#Product_" + str_id).hide();
                $("#ProductClass_" + str_id).attr("class", "noselect");
            } else if (itype == 1) {
                $("#ProductClass_" + str_id).attr("class", "selecteda");
                $("#Product_" + str_id).show();
            }
        }
       
        //品牌分类
        function GetCompanyName(channel_id) {
            var strchannel_id = channel_id; //产品频道ID
            if (channel_id == "" | channel_id == undefined) {
                strchannel_id = "";
            }
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetCompanyName",
                data: { channel_id: strchannel_id },
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
                        //var strName = "";
                        var newTitle = "";
                        var table = result.Data.companyTB;
                        $.each(table, function (index, row) {
                            var strid = row.id;
                            var strtitle = row.title; //品牌名称
                            //strtitle = patchStr(strtitle, 5, "", 0);
                            newTitle = patchStr(strtitle, 5, "", 0);
                            var strchannel_id = row.channel_id;
                            var strclass_layer = row.class_layer; //分类级别
                            if (index == 9) {
                                strbody = "<li style=\"position:inherit;width:72px;\"><a id=\"test2\"  href=\"javascript:sourchByBland('0');\";\">全部</a></li>" + strbody;
                                                                strbody += "<li style=\"float:right; position:inherit;margin-right:6px;\"><a id=\"test1\"  href=\"javascript:void(0);\" onclick=\"show();\" title=\"展开\">∨更多</a></li>";
                                                                //strbody += "<br>";
                                                                strbody += "<div class=\"clear\"></div>";
                                                                strbody += "</ul><ul>";
                                //$("#brandClassId").style.height = 75 + 'px';
                                if (table.length > 9) {
//                                    $("#brandClassId").attr("style", "border:0px;float:left;color:white;width:108px;height:75px;margin-top:0px; margin-bottom:0px;background-color:#F4A7a0;border-bottom: 1px dotted #E0E0E0;");
                                    expland = 1;
                                }
                            }
                            strbody += "<li style=\"list-style:none;width:72px;\">";
                            strbody += "<div title=\"" + strtitle + "\" style=\"float:left;width:78px;\">";
                            strbody += "<a id=\"ProductBland_" + strid + "\" class=\"noselect\" href=\"javascript:sourchByBland('" + strid + "')\">" + newTitle + "</a> <img class=\"crumbDelete\" id=\"btn_" + strid + "\" src=\"../css/Image/delete.jpg\" onclick=\"UnSetBlandStyle('" + strid + "');\"  />";
                            strbody += "</div>";
                            strbody += "</li>";
                        });
                        //  strbody += "<li style=\"float:right; position:inherit;\"><a id=\"test1\"  href=\"javascript:void(0);\" onclick=\"show();\" title=\"展开\">更多</a></li>";
                        strtop = "<ul>";
                        strbottom = "</ul>";
                        strHtml = strtop + strbody + strbottom;
                        $("#companyId").html(strHtml);
                        GetInventoryClass();
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
        //热点产品
        function GetHotProduct(ipage) {
            var stris_hot = 1; //热点标识
            if (stris_hot == "" || stris_hot == undefined) {
                stris_hot = "";
            }
            var pagesize = 2;
            var pageindex1 = (parseInt(ipage) - 1) * pagesize + 1;
            var pageindex2 = ipage * pagesize;
            //var curretnpage = parseInt(("HotProCPage").val());
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetHotProduct",
                data: { is_hot: stris_hot, pageindex1: pageindex1, pageindex2: pageindex2, channel_id: channel, category_id: classidsel1 },
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

                        //newTitle = patchStr(strtitle, 5, "", 0);
                        for (var i = 0; i < table.length; i++) {
                            var row = table[i];
                            var strImgUrl = "";
                            var strid = "";
                            var strtitle = "";    //产品名称
                            var strAddTime = ""; //发布时间
                            var strPrice = "";  //价格
                            var strCompanyName = ""; //品牌名称
                            var row = table[i];
                            var currentclass = row.category_id;
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
                                strtitle = patchStr(row.title, 7, "", 0);
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
                            //strbody += "</div><div style=\"float:left;text-align:center;width:100%\"><a href=\"javascript:GetHotProduct(" + up + ")\" >上一页</a>　<a href=\"javascript:GetHotProduct(" + down + ")\" >下一页</a></div>";
                            strbody += "<ul class=\"items clearfix\">";
                            strbody += "<li class=\"item\">";
                            strbody += "<div class=\"img\">";
                            //strbody += "<img alt=\"\" src=\"" + strImgUrl + "\"/></div>";
                            strbody += "<table class=\"center\">";
                            strbody += "<tr><td>";
                            strbody += "<a href=\"productDetails.aspx?articleId=" + strid + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" target=\"_blank\">";
                            strbody += "<img alt=\"\" src=\"" + strImgUrl + "\" style=\"width:180px;height:180px;background-color:white;\" class=\"cover\"/>";
                            strbody += "</td></tr>";
                            strbody += "</table>";
                            strbody += "</div>";
                            strbody += "<div class=\"info\" style=\"text-align:left;\">";
                            strbody += "<ul class=\"clearfix\">";
                            strbody += "<div class=\"info\">";
                            strbody += "<li>";
                            //strbody += "<a href=\"productDetails.aspx?articleId=" + strid + "\">产品名称：" + splitstring(strtitle, 30) + "</a>";
                            strbody += "<a title=\"" + row.title + "\" href=\"productDetails.aspx?articleId=" + strid + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" target=\"_blank\">" + strtitle + "</a>";
                            strbody += "</li>";
                            strbody += "<li>";
                            strbody += "<span title=\"" + row.company_name + "\">品牌：" + strCompanyName + "</span>";
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
                        strtop = "<div style=\"float:left;text-align:center;width:100%;margin-top:2px;\"><a href=\"javascript:GetHotProduct(" + up + ")\" >上一页</a>　<a href=\"javascript:GetHotProduct(" + down + ")\" >下一页</a></div><div class=\"bd\" style=\"margin-top:20px;\">";
                        strbody += "</div>";
                        strbottom = "<div style=\"float:left;text-align:center;width:100%;margin-bottom:5px;\"><a href=\"javascript:GetHotProduct(" + up + ")\" >上一页</a>　<a href=\"javascript:GetHotProduct(" + down + ")\" >下一页</a></div>";
                        strHtml = strtop + strbody + strbottom;
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
        //产品分类
        function GetInventoryByClass(htype) {
            var page1 = 0;
            //var page2 = 0;
            var pagecount = 25;
            var currentPage = parseInt($("#pagenum").val());
            var p1 = $("#price1").val();
            var p2 = $("#price2").val();
            if (p1 == undefined || p1 == "") { p1 = "0"; }
            else { p1 = p1.replace("￥", ""); }
            if (p2 == undefined || p2 == "") { p2 = "0"; }
            else { p2 = p2.replace("￥", ""); }
            var price1 = parseFloat(p1);
            var price2 = parseFloat(p2);
            var sourchtittle = $("#proName1").val(); //搜索字段
            if (sourchtittle == "该条件下查找") {sourchtittle = ""; }
            page1 = currentPage
            //page2 = currentPage * pagecount;
            var sDataImport = "";
            if (htype == "out") { sDataImport = "DataImport"; }
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "Index.aspx?action=GetProductByClass",
                data: { timesort: timesort, pricesort: pricesort, sorttype: sorttype, productsort: productsort, channel: channel, classid: classid, blandidlist: blandidlist, classidlist: classidlist, addclasslist: addclasslist, sourchtittle: sourchtittle, startIndex: page1, endIndex: pagecount, price1: price1, price2: price2, DataImport: sDataImport },

                cache: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (result) {
                    if (result.IsOK == "Y") {
                        var sImport = result.Data.DataImport;
                        if (sImport != "" && sImport != undefined) {
                            if (sImport == 200) { alert("数据导出成功"); }
                            else if (sImport == 100) { alert("数据导出失败"); }
                            else { alert("无数据导出"); }
                            return;
                        }
                        var strHtml = "";
                        var strbody = "";
                        var strtop = "";
                        var strbottom = "";
                        var table = result.Data.proTable;
                        var irowsnum = result.Data.rowsnum;
                        var irowsnum = result.Data.rowsnum;
                        var imgcount = 0;

                        for (var i = 0; i < table.length; i++) {
                            var imgUrl = "";
                            var title = "";
                            var tiptitle = "";
                            var typeName = "";
                            var add_time = "";
                            var sort_id = "";
                            var click = "";
                            var market_price = "";
                            var strProId = "";
                            var brand = ""; //品牌名称
                            var good_size = ""; //产品规格
                            var row = table[i];
                            //tiptitle = row.title;
                            var currentclass = row.category_id;
                            if (row.img_url == "" || row.img_url == undefined || row.img_url == null) {
                                imgUrl = "";
                            }
                            else {
                                imgUrl = row.img_url;
                            }
                            if (row.title == "" || row.title == undefined || row.title == null) {
                                title = "无";
                            }
                            else {
                                title = row.title;
                                tiptitle = patchStr(row.title, 15, "", 0);
                                if (displaytype == 0) { tiptitle = patchStr(row.title, 40, "", 0); }
                            }
                            if (row.typeName == "" || row.typeName == undefined || row.typeName == null) {
                                typeName = "无";
                            }
                            else {
                                typeName = row.typeName;
                            }
                            if (row.add_time == "" || row.add_time == undefined || row.add_time == null) {
                                add_time = "无";
                            }
                            else {
                                add_time = ChangeDateFormat(row.add_time);
                            }
                            if (row.sort_id == "" || row.sort_id == undefined || row.sort_id == null) {
                                sort_id = 99;
                            }
                            else {
                                sort_id = row.sort_id;
                            }
                            if (row.click == "" || row.click == undefined || row.click == null) {
                                click = 0;
                            }
                            else {
                                click = row.click;
                            }
                            if (row.market_price == "" || row.market_price == undefined || row.market_price == null) {
                                market_price = 0;
                            }
                            else {
                                market_price = row.market_price;
                            }
                            if (row.id == "" || row.id == undefined || row.id == null) {
                                strProId = 0;
                            }
                            else {
                                strProId = row.id;
                            }
                            if (row.company_name == "" || row.company_name == undefined || row.company_name == null) {
                                brand = "无";
                            }
                            else {
                                brand = patchStr(row.company_name, 5, "", 0);
                            }
                            if (row.goods_size == "" || row.goods_size == undefined || row.goods_size == null) {
                                good_size = "无";
                            }
                            else {
                                good_size = row.goods_size;
                            }
                            //var imgUrl = row.img_url; //图片路径
                            //var title = row.title; //标题
                            //var typeName = row.category_id; //分类
                            //var typeName = row.typeName;
                            //ChangeDateFormat
                            //var add_time = ChangeDateFormat(row.add_time);
                            //var add_time = new Date(parseInt(row.add_time.replace("/Date(", "").replace(")/", ""), 10)); //row.add_time; //发布时间
                            //var sort_id = row.sort_id; //添加排序
                            // var click = row.click; //人气
                            //var market_price = row.market_price; //市场价格
                            //var strProId = row.id; //产品Id
                            if (displaytype == 0) {
                                // //产品名称 品牌 产品规格 参考价格 所属类别
                                strbody += "<tr class=\"tr_odd_bg\">";
                                //strbody += "<td style=\"text-align:left;height:23px\" title=\"" + title + "\">　<a href=\"productDetails.aspx?articleId=" + strProId + "\">" + splitstring(title, 45) + "</a></td>";
                                strbody += "<td style=\"text-align:left;height:23px\" title=\"" + title + "\">　<a href=\"productDetails.aspx?articleId=" + strProId + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" target=\"_blank\">" + tiptitle + "</a></td>";
                                strbody += "<td style=\"text-align:left\">" + brand + "</td>"; //品牌
                                strbody += "<td style=\"text-align:left\">" + good_size + "</td>"; //产品规格
                                strbody += "<td style=\"text-align:left\">" + market_price + "</td>"; //参考价格
                                strbody += "<td style=\"text-align:left\">" + typeName + "</td>"; //所属类别
                                //strbody += "<td style=\"text-align:left\">" + add_time + "</td>";
                                strbody += "</tr>";
                            }
                            else if (displaytype == 1) {
                                imgcount++;
                                if (imgcount % 5 == 1) {
                                    if (strbody == "") {
                                        strbody += "<ul>";
                                    } else {
                                        strbody += "</ul><div class=\"clear\"></div>";
                                        strbody += "<ul>";
                                    }
                                }
                                strbody += "<li style=\"width:230px;heigth:300px;margin-left:10px;margin-left:20px;\">";
                                strbody += "<div class=\"box\" style=\"margin-top:10px;border-color: #f3d7bb;border: 1px solid #ccc;padding:5px\">";
                                strbody += "<dl>";
                                strbody += "<dd style=\"text-align:center;\">";
                                strbody += "<a href=\"productDetails.aspx?articleId=" + strProId + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" target=\"_blank\">";
                                strbody += "<img alt=\"\" src=\"../.." + imgUrl + "\" style=\"width:180px;height:180px;background-color:white;\" class=\"cover\"/></a>";
                                strbody += "</dd>"
                                strbody += "<dd style=\"text-align:left;width:100%;font-size:14px;\"><a href=\"productDetails.aspx?articleId=" + strProId + "&channel=" + channel + "&classidsel1=" + classidsel1 + "&currentclass=" + currentclass + "\" title=\"" + title + "\" target=\"_blank\">" + tiptitle + "</a></dd>";
                                //strbody += "<dd style=\"text-align:left;width:100%\"><a href=\"productDetails.aspx?articleId=" + strProId + "\" title=\"" + tiptitle + "\">" + tiptitle + "</a></dd>";
                                strbody += "<dd style=\"text-align:left;\">规格：" + good_size + "</dd>";
                                strbody += "<dd style=\"text-align:left;\">价格：" + market_price + "</dd>";
                                strbody += "<dd style=\"text-align:left;\">品牌：" + brand + "</dd>";
                                //strbody += "<dd style=\"text-align:left;\">发布时间：" + add_time + "</dd>";
                                strbody += "</dl>";
                                strbody += "<div class=\"clear\"></div>";
                                strbody += "</div>";
                                strbody += "</li>";
                            }
                        }
                        if (displaytype == 0) {
                            if (table.length == 0 || strbody == "") {
                                strbody = "<tr><td colspan='4' style=\"color:red; padding:20px; width:100%\">没有数据</td></tr>";
                            }
                            //产品名称 品牌 产品规格 参考价格 所属类别
                            strtop = "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"msgtable\">";
                            strtop += "<tr style=\"background-color:#E0E0E0\">"; //class=\"tr_odd_bg\"
                            strtop += "<th style=\"text-align:center;width:40%;height:30px;vertical-align:middle\">产品名称</th>";
                            strtop += "<th style=\"text-align:left;width:16%;vertical-align:middle\">品牌</th>";
                            strtop += "<th style=\"text-align:left;width:20%;vertical-align:middle\">产品规格</th>";
                            strtop += "<th style=\"text-align:left;width:13%;vertical-align:middle\">参考价格</th>";
                            strtop += "<th style=\"text-align:left;width:110;vertical-align:middle\">所属类别</th>";

                            //strtop += "<th style=\"text-align:left;width:110;vertical-align:middle\">发布时间</th>";
                            strtop += "</tr>";
                            strbottom += "</table>";
                            strHtml = strtop + strbody + strbottom;
                            $("#tabledisplay").html(strHtml);
                            $("#imgdisplay").html('');
                        } else if (displaytype == 1) {
                            if (table.length == 0 || strbody == "") {
                                strbody = "<li style=\"color:red; padding:20px; width:100%\">没有数据</li>";
                            }
                            strtop = "<ul>";
                            strbottom = "</ul>"
                            strHtml = strtop + strbody + strbottom;
                            $("#tabledisplay").html('');
                            $("#imgdisplay").html(strHtml);
                        }
                        //分页html开始pagenum
                        var ipagenum = 0;
                        ipagenum = parseInt(irowsnum) / parseInt(pagecount);
                        if (parseInt(irowsnum) % parseInt(pagecount) > 0)
                        { ipagenum = parseInt(ipagenum) + 1 }
                        var pagehtml = "<li><a href=\"javascript:gotopage(" + 1 + ");\"> 首页 </a></li>"; //首页
                        var uppage = parseInt(currentPage) - 1;
                        if (uppage < 1) { uppage = 1; }
                        pagehtml += "<li><a href=\"javascript:gotopage(" + uppage + ");\">«上一页</a></li>"; //上一页
                        var downpage = parseInt(currentPage) + 1;
                        if (downpage > ipagenum) { downpage = downpage - 1; }
                        if (ipagenum >= 8) {
                            var icenterpage = currentPage - 2;
                            if (icenterpage < 1) { icenterpage = 1; }
                            var ofset = ipagenum - currentPage;
                            if (ofset < 2) { icenterpage = icenterpage - ofset; }
                            if (ipagenum == currentPage) { icenterpage = ipagenum - 4; }
                            for (var i = icenterpage; i < (icenterpage + 8); i++) {
                                if (i == currentPage) {
                                    pagehtml += "<li class=\"current\">" + i + "</li>";
                                } else {
                                    pagehtml += "<li ><a href=\"javascript:gotopage(" + i + ");\">" + i + "</a></li>";
                                }
                            }
                        } else {
                            for (var i = 1; i <= ipagenum; i++) {
                                if (i == currentPage) {
                                    pagehtml += "<li class=\"current\">" + i + "</li>";
                                } else {
                                    pagehtml += "<li ><a href=\"javascript:gotopage(" + i + ");\">" + i + "</a></li>";
                                }
                            }
                        }
                        pagehtml += "<li><a href=\"javascript:gotopage(" + downpage + ");\">下一页»</a></li>";  //下一页
                        pagehtml += "<li><a href=\"javascript:gotopage(" + ipagenum + ");\"> 末页 </a></li>";  //尾页
                        pagehtml += "<li style=\"width:150px\">共" + ipagenum + "页，跳到 <input id=\"pagenum\" value=\"" + currentPage + "\" style=\"width:20px;text-align: center;\" /> 页</li>";
                        pagehtml += "<li><input type=\"button\" class=\"pagebutton\" value=\"确定\" onclick=\"gotopage(-1);\" /></li>";
                        $("#pagehtml").html("<ul style=\"margin-top:5px\">" + pagehtml + "</ul>");
                        //分页html结束
                        $("#rowsnum").html("当前有" + irowsnum + "条记录");
                    }
                },
                error: function () {
                    var ddd = 0;
                    //alert('网络错误!');
                },
                complete: function () {
                    $('#loading').hide();
                    var ddd = 0;
                    //backtotop();
                    SetSourhResultEle(timesort, pricesort, sorttype, productsort, channel, classid, blandidlist, classidlist, addclasslist, sourchtittle, page1, pagecount, sDataImport);
                    //$('#loading').hide();
                }
            });
        }
        function formprice(ele) {
            var price = $(ele).val();
            if (price == undefined || price == "") { $(ele).val(""); }
            else {
                price = price.replace("￥","");
                price = parseFloat(price).toString();
                if (price == "NaN") {price = 0;}
                $(ele).val("" + price);
            }
        }
        function SetSourhResultEle(stimesort, spricesort, ssorttype, sproductsort, schannel, sclassid, sblandidlist, sclassidlist, saddclasslist, ssourchtittle, sstartIndex, sendIndex, sDataImport) {
            $("#timesort").val(stimesort);
            $("#pricesort").val(spricesort);
            $("#sorttype").val(ssorttype);
            $("#productsort").val(sproductsort);
            $("#channel").val(schannel);
            $("#classid").val(sclassid);
            $("#blandidlist").val(sblandidlist);
            $("#classidlist").val(sclassidlist);
            $("#addclasslist").val(saddclasslist);
            $("#sourchtittle").val(ssourchtittle);
            $("#startIndex").val(sstartIndex);
            $("#endIndex").val(sendIndex);
            $("#DataImport").val(sDataImport);
        }
        function getEleValue(ele) {
            var value = "";
            value = $("#" + ele).val();
            return value;
        }
        //产品分类
        function doDataImport() {
            var dd = "";
            var sDataImport = "";
            sDataImport = "DataImport"; 
            var link = "DataImport.aspx?action=DataImport";
            var frm = $("#frmDataImport").serialize();
            var sclassid = getEleValue("classid");
            if (sclassid == undefined || sclassid == 0 || sclassid == "") {
                alert("请先选择产品分类后再导出"); 
                return;
            }
            if (frm == undefined || frm == "") {
                frm = "timesort=" + getEleValue("timesort") + "&" + "pricesort=" + getEleValue("pricesort") + "&" + "sorttype=" + getEleValue("sorttype") + "&" + "productsort=" + getEleValue("productsort") + "&" + "channel=" + getEleValue("channel") + "&" + "classid=" + getEleValue("classid") + "&" + "blandidlist=" + getEleValue("blandidlist") + "&" + "classidlist=" + getEleValue("classidlist") + "&" + "addclasslist=" + getEleValue("addclasslist") + "&" + "sourchtittle=" + getEleValue("sourchtittle") + "&" + "startIndex=" + getEleValue("startIndex") + "&" + "endIndex=" + getEleValue("endIndex") + "&" + "DataImport=DataImport";
            }
            if (frm != undefined && frm != "") {
                link += "&" + frm;
            }
            window.open(link, '_blank');
            return;
        }
        function gotopage(ipage) {
            if (ipage > 0) {
                $("#pagenum").val(ipage);
            }
            GetInventoryByClass();
        }
        function splitstring(str, strlength) {
            if (str.length > strlength) {
                str = str.substring(0, strlength);
            }
            return str;
        }
        var firstload = 0;
        var expland = 0;
        $(function () {
            //document.getElementById("companyId").style.height = 25 + 'px';
            //document.getElementById("proTypeId1").style.height = 32 + 'px';
            //brandClassId
            //document.getElementById("brandClassId").style.height = 26 + 'px';
            $("#tabledisplay tr:odd").filter(":gt(0)").addClass("odd");
            $("#tabledisplay tr:event").filter(":gt(0)").addClass("event");

            channel = 2;
            GetProductType(classid, 0);
            classid = getUrlParam("classId");
            var blandid = getUrlParam("blandid");
            var channel_id = parseInt(channel + 1);
            GetCompanyName(channel_id);
            if (classid != undefined && classid != "") { GetProductType(classid, 1); }
            if (blandidlist != undefined && blandidlist != "") { sourchByBland(blandidlist); }
            if (blandid != undefined && blandid != "") {
                sourchByBland(blandid);
                //SetBlandStyle(blandid);
                setTimeout(function () {
                    SetBlandStyle(blandid);
                    if (expland == 1) { show(); expland = 0; }
                }, 1000);
            }
            GetInventoryClass();
            sourch("default_sort", "0");
            //热点产品
            GetHotProduct(1);
            firstload = 1;
        });
//        function SetBlandStyle(bland_id) {
//            $("#ProductBland_" + bland_id).attr("class", "selecteda");
//            $("#btn_" + bland_id).show();
//        }
        function GetRequest() { //?outId=14
            var url = location.search; //获取url中"?"符后的字串  outId=14
            var theRequest = new Object();
            var strs = url.split("=");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
            }

            return theRequest;
        }
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        function ChangeDateFormat(cellval) {
            var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            return date.getFullYear() + "-" + month + "-" + currentDate;
        }
      
    </script>
    <%--置顶效果开始--%>
    <script type="text/javascript">
        $(document).ready(function () {
            //首先将#back-to-top隐藏
            $("#back-to-top").hide();
            //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
            $(function () {
                $(window).scroll(function () {
                    var itop = $(window).scrollTop();
                    if (itop > 400) {
                        $("#back-to-top").fadeIn(1500);
                    }
                    else {
                        $("#back-to-top").fadeOut(1500);
                    }
                });
            });
        });
        function backtotop() {
            //当点击跳转链接后，回到页面顶部位置、
            $('body,html').animate({ scrollTop: 0 }, 1000);
            return false;
        }
        $(window).resize(function () {
            //show.height($(document).height());
            //使用$(window).height()、$(window).width()可以获取当前窗口高度和宽度
        });
    </script>
    <%--置顶效果结束--%>
</head>
<body id="top" >
<%--    <p id="back-to-top" onclick="backtotop();">
        <a href="#top"><span></span>返回顶部</a></p>--%>
    <form id="frmDataImport" action="Index.aspx?action=DataImport" method="post" >
        <input type="hidden" id="timesort" value="" />
        <input type="hidden" id="pricesort" value="" />
        <input type="hidden" id="sorttype" value="" />
        <input type="hidden" id="productsort" value="" />
        <input type="hidden" id="channel" value="" />
        <input type="hidden" id="classid" value="" />
        <input type="hidden" id="blandidlist" value="" />
        <input type="hidden" id="classidlist" value="" />
        <input type="hidden" id="addclasslist" value="" />
        <input type="hidden" id="sourchtittle" value="" />
        <input type="hidden" id="startIndex" value="" />
        <input type="hidden" id="endIndex" value="" />
        <input type="hidden" id="DataImport" value="" />
    </form>
    <form id="form1" runat="server">
    <div id="mybody">
        <uc1:head id="head2" runat="server" />
        <div id="myposition" class="body">
            <div class="inner" style="height:36px">
                <div class="topbar-search">
                    <div style="float:left;margin-left:10px">产品情报＞</div>
<%--                <div class="J_TopbarSearch" style="float:left">
                        <input class="search-input" type="text" id="proName1" placeholder="该条件下查找" _default="该条件下查找" />
                        <input id="proName" class="menu-search-form-text" type="text"/>
                        <span class="topbar-submit" onclick="GetInventoryByClass();"></span>
                        <input type="hidden" id="protxtPage" value="1" />
                    </div>--%>
                    <div class="menu-search">
                            <input class="menu-search-form-text" id="proName1" placeholder="该条件下查找" _default="该条件下查找" type="text"/>
				            <input class="menu-search-form-button" type="button" onclick="GetInventoryByClass();" value="搜索"/>
		            </div>

                </div>
                <div class="clear"></div>
            </div>
            <div class="inner" style="text-align: center; margin-top: 10px">
                <!--绑定品牌开始-->
                <div class="tools_box" style="border:0px;">
                    <div class="prdkey" id="brandClassId">
                        品牌分类</div>
                    <div class="tool_bar" >
                        <div class="generalul2" id="companyId" style="height:44px;padding-left: 3px; padding-top: 5px;text-align: left; background-color: White;">
                        </div>
                    </div>
                </div>
                <!--绑定品牌结束-->
                <!--产品分类开始-->
                <div class="tools_box" style="border:0px;">
                    <div class="prdkey" id="proClassId" >产品分类</div>
                    <div class="tool_bar">
                            <div class="generalul2" id="proTypeId1" style="height:22px;padding-left: 3px; padding-top: 5px;text-align: left; background-color: White;"></div>
                             <div id="proTypeId2" class="generalul" style="height:22px;padding-left: 3px; padding-top: 5px;text-align: left; display: none;"></div>
                            <div id="proTypeId3" class="generalul" style="height:22px;padding-left: 3px; padding-top: 5px;text-align: left; display: none;"></div>
                    </div>
                </div>
                <!--产品分类结束-->
                <%--扩展属性开始--%>
                <table class="select-table"  style="width:100%">
                    <tbody class="select-tbody" id="Pros">
                        <tr class="row">
                            <td class="prdkey">
                                <%--<span class="cat "><a href="javascript:sourchByClass('<%#Eval("category_id")%>')">
                                    <%#Eval("title")%></a></span>--%>
                            </td>
                            <td style="overflow: hidden; word-break: break-all;">
                               <%-- <span class="cat "><a href="javascript:sourchByClass('<%#Eval("category_id")%>')">
                                    <%#Eval("default_value")%></a></span>--%>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%--扩展属性结束--%>
                <%--图片、时间、图片列表展示方式开始--%>
                <div class="inner">
                                <div id="loading" style="position: fixed; left: 400px; top: 300px; width: 128px;heigth: 128px; display: none"><img alt="" src="../images/jindu.gif" /></div>
                    <table style="margin: 10px; padding: 10px; width: 97%" class="select-table">
                        <tr class="row">
                            <td style="width: 20%">
                                <div style="float: left">
                                    <a id="default_sort" href="javascript:sourch('default_sort')">默认排序</a>&nbsp&nbsp<a id="time_sort" href="javascript:sourch('timesort')">时间排序</a>&nbsp&nbsp<a id="price_sort" href="javascript:sourch('pricesort')">价格排序</a>
                                </div>
                            </td>
                            <td>
                                <div style="border: 1px solid #CCCCCC;height:26px;margin:-5px;padding:5px 0px 0px 5px">
                                <div style="float:left">
                                <span class="rmb">¥</span><input type="text" id="price1"  style="width:45px" onblur="formprice(this);" /> - 
                                <span class="rmb">¥</span><input type="text" id="price2"  style="width:45px" onblur="formprice(this);" />
                                </div>
                                <div style="float:left;padding-left:5px">
                                <%--<img alt="" src="../../admin/images/down.png" style="height:18px" onclick="GetInventoryByClass();" />--%>
                                <input class="search-submit" type="button" value="确定" onclick="GetInventoryByClass();" />
                                </div>
                                </div>
                            </td>
                            <td>
                                <div style="float:left;margin-left:15px;width:130px;text-align:left" id="rowsnum">当前有0条记录</div>
                            </td>
                            <td style="width: 50%">
                                <div style="float: right;">
                                    <a href="javascript:doDataImport()" title="数据下载">
                                        <img alt="" src="../../admin/images/down.png" style="height:18px" /></a> <a href="javascript:sourch('displaytype',0)" title="文字列表视图">
                                        <img alt="" src="../../admin/images/ico-show-txt.png" /></a> <a href="javascript:sourch('displaytype',1)"
                                            title="图像列表视图">
                                            <img alt="" src="../../admin/images/ico-show-img.png" /></a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <%--图片、时间、图片列表展示方式结束--%>
                <%--产品展示开始--%>
                <div class="inner">
                    <div style="float: left; width: 100%; margin-top: 10px; border-color: #f3d7bb; border: 1px solid #ccc;">
                        <!--列表展示.开始-->
                        <table id="tabledisplay" class="msgtable" style="width: 100%;">
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <!--列表展示.结束-->
                        <!--图片展示.开始-->
                        <div id="imgdisplay" class="general1ul" style="margin-top: 10px">
                            暂无记录
                        </div>
                        <!--图片展示.结束-->
                        <div class="clear">
                        </div>
                        <div id="pagehtml" class="pagestyle" style="margin-top: 10px; margin-bottom: 10px">
                            <ul style="margin-top: 5px">
<%--                                <li style="background-image: url(../images/page_first.png); width: 30px"><a href="javascript:gotopage(1);">
                                </a></li>
                                <li style="background-image: url(../images/page_up.png); width: 26px"><a href="javascript:gotopage(1);">
                                </a></li>
                                <li style="background-image: url(../images/page_num.png); width: 20px"><a href="javascript:gotopage(1);">
                                    1</a></li>
                                <li style="background-image: url(../images/page_num.png); width: 20px"><a href="javascript:gotopage(2);">
                                    2</a></li>
                                <li style="background-image: url(../images/page_num.png); width: 20px"><a href="javascript:gotopage(3);">
                                    3</a></li>
                                <li style="background-image: url(../images/page_down.png); width: 26px"><a href="javascript:gotopage(1);">
                                </a></li>
                                <li style="background-image: url(../images/page_last.png); width: 30px"><a href="javascript:gotopage(1);">
                                </a></li>--%>
                                <li style="width: 200px">共100页，跳到
                                    <input id="pagenum" value="1" style="width: 50px" />
                                    页</li>
                                <li style="width: 60px">
                                    <img alt="" class="style1" style="width: 60px; cursor: pointer" src="../images/page_ok.png"
                                        onclick="gotopage(1);" /></li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
<%--                    <div id="proscroll" style="float: right; margin-top: 10px; width: 20%">
                        <!--相关产品开始-->
                        <div id="proscrolling" class="list-aside">
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
                                                        <li><a href="#" target="_blank">产品</a> </li>
                                                        <li><span>产品描述</span> </li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--相关产品结束-->
                    </div>--%>
                </div>
                <%--产品展示结束--%>
            </div>
        </div>
        <div class="clear">
        </div>
        <!-- footer begin -->
        <%--  <uc2:bottom ID="bottom1" runat="server" />--%>
        <%--<div id="bottom"   style="border:5px solid:red;">
	<div class="bottom">
	    <div class="bot_menu">
	        <a href="/sitemap/">网站导航</a>|<a href="/contact/">联系我们</a>|<a href="/declare/">责任声明</a>|<a target="_blank" href="https://mail.apollo.com.cn">企业邮箱</a>|<a target="_blank" href="/ca.zip">根证书下载</a><br>
		    <span>COPYRIGHT &copy; 2012 </span>广东太阳神集团有限公司    <a target="_blank" href="http://www.miitbeian.gov.cn">粤ICP备09185647号-2</a>
		</div>
		<div class="bot_copyright">互联网药品信息服务许可证(非经营性)(粤)-非经营性-2005-0002</div>
	</div>
</div>--%>
        <!-- footer end -->
    </div>
    <uc2:bottom id="bottom1" runat="server" />
    </form>
</body>
</html>
