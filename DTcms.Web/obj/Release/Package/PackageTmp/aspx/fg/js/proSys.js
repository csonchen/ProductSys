$(document).ready(function () {
    //控制多选框样式
    $(".multi-checkbox").children("a").click(function () {
        var name = $(this).attr("class");
        if (name == "" || name == null) {
            name = "selected";
        } else {
            name = "";
        }
        $(this).attr("class", name);
        ajaxSend();
    })

    //控制单选框样式
    $(".multi-radio").children("a").click(function () {
        var items = $(this).parent().children();
        if ($(this).attr("class") == "" || $(this).attr("class") == null) {
            for (var i = 0; i < items.length; i++) {
                var otherAElement = items[i];
                if (otherAElement.className == "selected") {
                    otherAElement.className = "";
                }
            }
            $(this).attr("class", "selected");
        } else {
            $(this).attr("class", "");
        }
        ajaxSend();
    })

    //初始页面时获取该分类的所有商品
    ajaxSend();

    /*****************************************************************平面化*****************************************************************/
    //动态生成多级树形下拉框
    
    categoryObj = eval("(" + $("#categoryJson").val() + ")");
    if (categoryObj != null) {
        var div = $("<div></div>").attr("class", "dropdown bs-example");
        div.append($("<a></a>").attr("data-toggle", "dropdown").attr("id", "categoryList").css("margin", "auto").css("padding-left","15px").css("width","160").css("overflow-x","hidden").attr("href","javascript:;").html("--请选择分类--").attr("val","0").append("<i></i>"));
        var ul = $("<ul></ul>").attr("class","dropdown-menu").attr("role","menu").attr("aria-labelledby","categoryList");
        for (var i = 0; i < categoryObj.category.length; i++) {
            var li = $("<li></li>").attr("role", "presentation").append($("<a></a>").attr("role", "menuitem").attr("href", "javascript:;").click(function () { $("#categoryList").html($(this).html()).attr("val", $(this).val()).append("<i></i>"); ajaxSend(); }).attr("value", categoryObj.category[i].id).html(categoryObj.category[i].title));
            ul.append(li);
            if (categoryObj.category[i].children != null) {
                for (var j = 0; j < categoryObj.category[i].children.length; j++) {
                    var li = $("<li></li>").attr("role", "presentation").append($("<a></a>").attr("role", "menuitem").attr("href", "javascript:;").click(function () { $("#categoryList").html($(this).html()).attr("val", $(this).val()).append("<i></i>"); ajaxSend(); }).attr("value", categoryObj.category[i].children[j].id).html("&nbsp;&nbsp;┣" + categoryObj.category[i].children[j].title));
                    ul.append(li);
                    if (categoryObj.category[i].children[j].children != null) {
                        for (var k = 0; k < categoryObj.category[i].children[j].children.length; k++) {
                            var li = $("<li></li>").attr("role", "presentation").append($("<a></a>").attr("role", "menuitem").attr("href", "javascript:;").click(function () { $("#categoryList").html($(this).html()).attr("val", $(this).val()).append("<i></i>"); ajaxSend(); }).attr("value", categoryObj.category[i].children[j].children[k].id).html("&nbsp;&nbsp;&nbsp;&nbsp;┣" + categoryObj.category[i].children[j].children[k].title));
                            ul.append(li);
                        }
                    }
                }
            }
        }

        //添加table到页面
        $("#category").append($("<table></table>").append($("<tr></tr>").append($("<td></td>").attr("class", "attrName").html("选择分类")).append($("<td></td>").attr("class", "item_content").append(div.append(ul)))));
    }
    
})

//分页每页显示数目
var items_per_page = 9;
//全局存储JSON数据
var jsonObj;

//ajax发送条件筛选信息
function ajaxSend() {

    //频道ID
    var msg = "channelId=" + $("#channelId").val();

    //分类类型
    if ($("#categoryList").html() != null)
        msg += "&category=" + $("#categoryList").attr("val");

    //模糊搜索
    if ($("#search_text").val() != "搜索产品...")
        msg += "&search=" + $("#search_text").val();

    //遍历复选框的选择内容
    var checkboxs = $(".multi-checkbox");
    for (var i = 0; i < checkboxs.length; i++) {
        msg += "&";

        var checkbox = checkboxs.eq(i);
        msg += checkbox.attr("id") + "=";

        var items = checkbox.children();
        for (var j = 0; j < items.length; j++) {
            var otherAElement = items[j];
            if (otherAElement.className == "selected") {
                msg += j + ",";
            }
        }
    }

    //遍历单选框的选择内容
    var radios = $(".multi-radio");
    for (var i = 0; i < radios.length; i++) {
        msg += "&";

        var radio = radios.eq(i);
        msg += radio.attr("id") + "=";

        var items = radio.children();
        for (var j = 0; j < items.length; j++) {
            var otherAElement = items[j];
            if (otherAElement.className == "selected") {
                msg += j;
                break;
            }
        }
    }
    
    //ajax发送信息，并将获取的JSON数据生成 对应产品信息
    $.get("../../tools/classify_ajax.ashx?" + msg, function (data, status) {
        if (status == "success") {
            $("#photos").empty();
            jsonObj = eval("(" + data + ")");
            for (var i = 0; i < jsonObj.products.length && i < items_per_page; i++) {
                var img;
                if (jsonObj.products[i].img_url != "")
                    img = $("<img/>").attr("style", "max-width:200px;max-height:240px;").attr("border", "0").attr("src", "../.." + jsonObj.products[i].img_url);
                else 
                    img = $("<img/>").attr("style", "max-width:200px;max-height:240px;").attr("border", "0").attr("src", "../../images/kongbai.jpg");
                var div1 = $("<div></div>").attr("class", "topImg").append(img);
                var div2 = $("<div></div>").attr("class", "bottomMsg").html(jsonObj.products[i].title);
                var a = $("<a></a>").attr("href", "productDetail.aspx?id=" + jsonObj.products[i].id).append(div1, div2);
                var div3 = $("<div></div>").attr("class", "product_photoItem").append(a);
                $("#photos").append(div3);
            }

            //提示总产品数
            $("#totalTip").html("该条件下，共有<font color='red'>" + jsonObj.total + "</font>个产品。")
            
            //如果总数比每页个数少就无需加载分页插件
            if (jsonObj.total > items_per_page) {
                //加载分页插件
                $("#Pagination").pagination(jsonObj.total, {
                    'items_per_page': items_per_page,
                    'num_display_entries':4,
                    'num_edge_entries':2,
                    'prev_text': "上一页",
                    'next_text': "下一页",
                    'callback': pageselectCallback
                });
            } else {
                $("#Pagination").html("");
            }
            
            //适应屏幕
            suitScreen();
        }
    });
}

//选择分页时，加载替换主体内容框中产品信息
function pageselectCallback(page_index, jq) {
    $("#photos").empty();
    for (var i = page_index * items_per_page; i < jsonObj.products.length && i < items_per_page * (page_index + 1) ; i++) {
        var img;
        if (jsonObj.products[i].img_url != "")
            img = $("<img/>").attr("style", "max-width:200px;max-height:240px;").attr("border", "0").attr("src", "../.." + jsonObj.products[i].img_url);
        else
            img = $("<img/>").attr("style", "max-width:200px;max-height:240px;").attr("border", "0").attr("src", "../../images/kongbai.jpg");
        var div1 = $("<div></div>").attr("class", "topImg").append(img);
        var div2 = $("<div></div>").attr("class", "bottomMsg").html(jsonObj.products[i].title);
        var a = $("<a></a>").attr("href", "productDetail.aspx?id=" + jsonObj.products[i].id).append(div1, div2);
        var div3 = $("<div></div>").attr("class", "product_photoItem").append(a);
        $("#photos").append(div3);
    }
    //适应屏幕
    suitScreen();
    return true;
}


//搜索框聚焦时操作
function search_focus()
{
    if ($("#search_text").val() == "搜索产品...")
    {
        $("#search_text").css("color", "black").val("");
    }
}

//搜索框失去焦点时操作
function search_blur()
{
    if ($("#search_text").val() == "")
    {
        $("#search_text").css("color", "gray").val("搜索产品...");
    }
}

//title关键字搜索
function search()
{
    ajaxSend();
}