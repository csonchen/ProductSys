//请求地址
var AjaxUrl = "test.ashx";
var optionpie_category = null;//测试类型参数
var datapie_category = Object;//测试类型数据 

var optionpie_bar = null;//月份柱状图统计
var data_bar_count = Object;
var data_bar_date = Object;
$(document).ready(function (e) {
    GetTestStatisticsByCategory(); 
    GetTestStatisticsByBeginTime(); 
});

//加载文件
require.config({
    packages: [
      {
          name: 'echarts',
          location: './scripts/echarts/src',
          main: 'echarts'
      },
      {
          name: 'zrender',
          location: './scripts/zrender/src',// zrender与echarts在同一级目录
          main: 'zrender'
      }
    ]
});
require(
    [
        'echarts',
        'echarts/chart/bar',
        'echarts/chart/pie'
    ],
    function (ec) {
        var myChart_Category = ec.init(document.getElementById('div_pieCategory')); 
        var myChart_Bar = ec.init(document.getElementById('div_bar'));
        
        SetTestStatisticsByCategory(ec, myChart_Category); 
        SetTestStatisticsByBeginTime(ec, myChart_Bar);

        //设置点击事件
        var ecConfig = require('echarts/config');
        myChart_Category.on(ecConfig.EVENT.PIE_SELECTED, function (param) {
            var selected = param.selected;
            //debugger;
            var serie
            serie = optionpie_category.series[0];
            if (jQuery.inArray(true, selected[0]) > -1) {
                for (var i = 0; i < serie.data.length; i++) {
                    if (selected[0][i]) {
                        $("#hid_category").val(serie.data[i].name);
                        GetTestList(serie.data[i].name);
                    }
                }
            }
            else {
                $("#hid_category").val("");
            }
          
        })
         

        myChart_Bar.on(ecConfig.EVENT.CLICK, function (param) {
            var selected = param;
            var xAxis;
            xAxis = optionpie_bar.xAxis[selected.seriesIndex];
            for (var i = 0; i < xAxis.data.length; i++) {
                if (i == selected.dataIndex) {
                    if ($("#hid_date").val() != xAxis.data[i]) {
                        $("#hid_date").val(xAxis.data[i]);
                    } else {
                        $("#hid_date").val("");
                    }
                    GetTestList(xAxis.data[i]);
                }
            }
        })
    }
)


function GetTestList(isfal) {
    alert("点击事件" + isfal);

}
//设置测试类型统计数据： --- 饼图1 ---
function SetTestStatisticsByCategory(ec, myChart_Category) {
    optionpie_category = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        calculable: false,
        series: [
            {
                name: '测试类型',
                type: 'pie',
                selectedMode: 'single',
                radius: '90%',
                center: ['50%', '45%'],
                itemStyle: {
                    normal: {
                        label: {
                            show: true, position: 'inner',
                            formatter: function (a, b, c, d) { return b + "(" + c + ")" },
                            textStyle: {
                                color: '#000'
                            }
                        },
                        labelLine: {
                            show: false
                        }
                    }
                },
                data: datapie_category
            }
        ]
    };
    myChart_Category.setOption(optionpie_category);
}
 

//设置测试月份统计数据： ---柱状图 ---
function SetTestStatisticsByBeginTime(ec, myChart_Bar) {
    
    optionpie_bar = {
        title: {
            text: '测试统计',
            subtext: '--按照月份',
            x: 'center'

        },
        tooltip: {
            trigger: 'axis'
        },
        calculable: false,
        xAxis: [
            {
                type: 'category',
                data: data_bar_date
            }
        ],
        yAxis: [
            {
                type: 'value',
                splitArea: { show: true },
            }
        ],
        series: [
            {
                
                name: '测试数目',
                type: 'bar',
                data: data_bar_count,
                center: ['10%', '15%'],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            position: 'inside',
                            formatter: function (a, b, c, d) { return c + "" },
                            textStyle: {
                                color: '#000'
                            }
                        },
                        labelLine: {
                            show: false
                        }
                    }
                }
            }
        ]
    };
    myChart_Bar.setOption(optionpie_bar);
}

//获取测试类型统计数据
function GetTestStatisticsByCategory() {
    $.ajax({
        type: "post",
        dataType: "text", traditional: true,
        data: { oper: "bycategory" },
        url: AjaxUrl,
        async: false,//表示同步执行
        success: function (data, textStatus) {
            if (data != null) {
                 
                if (data) {
                    datapie_category = eval('(' + data + ')');
                }
                else {
                    alert("获取测试类型统计数据失败！");
                }
            }
        },
        complete: function (XMLHttpRequest, textStatus) { },
        error: function (e) {

             
            alert("获取测试类型统计数据失败，请刷新页面重新加载！");
        }
    });
}

//获取测试状态统计数据
function GetTestStatisticsByState() {
    $.ajax({
        type: "post",
        dataType: "text", traditional: true,
        data: { oper: "bystate" },
        url: AjaxUrl,
        async: false,//表示同步执行
        success: function (data, textStatus) {
            if (data != null) {
                if (data) {
                    datapie_state = eval('(' + data + ')');
                }
                else {
                    alert("获取测试状态统计数据失败！");
                }
            }
        },
        complete: function (XMLHttpRequest, textStatus) { },
        error: function (e) { alert("获取测试状态统计数据失败，请刷新页面重新加载！"); }
    });
}

//获取测试月份统计数据
function GetTestStatisticsByBeginTime() {
    $.ajax({
        type: "post",
        dataType: "text", traditional: true,
        data: { oper: "bybegintime" },
        url: AjaxUrl,
        async: false,//表示同步执行
        success: function (data, textStatus) {
            if (data != null) {
                if (data) {
                    //debugger;
                    var tempdata = data.split(';');
                    var xxdate = tempdata[0];
                    var xxcount = tempdata[1];
                    data_bar_date = eval('(' + xxdate + ')');
                    data_bar_count = eval('(' + xxcount + ')');
                }
                else {
                    alert("获取测试按月统计数据失败！");
                }
            }
        },
        complete: function (XMLHttpRequest, textStatus) { },
        error: function (e) { alert("获取测试按月统计数据失败，请刷新页面重新加载！"); }
    });
}

