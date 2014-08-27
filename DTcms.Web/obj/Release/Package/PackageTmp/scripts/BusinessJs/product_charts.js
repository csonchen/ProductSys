//请求地址
var AjaxUrl = "../../tools/product_charts.ashx";
var optionpie_category = null;//不同功能的保健品数量统计
var datapie_category = Object;

var optionpie_bar = null;//不同人群适宜保健品数量统计
var data_bar_count = Object;
var data_bar_date = Object;

var optionstack_bar = null;//不同产品状态的产品数量统计
var data_stack_type = Object;
var data_stack_value = Object;
var data_stack_tooltip = Object;

var optionbar_addtime = null;//不同年如研发产品数量统计
var data_bar2_year = Object;
var data_bar2_value = Object; 

var str = location.search;
var array = str.split("=");
var type = array[1];

//页面加载完毕，加载表格数据
$(document).ready(function (e) {
    GetTestStatisticsByState();
    GetTestStatisticsByAddTime();
    GetTestStatisticsByCategory();
    GetTestStatisticsByBeginTime();
});

//加载相关表格样式文件
require.config({
    packages: [
      {
          name: 'echarts',
          location: '../../scripts/echarts/src',
          main: 'echarts'
      },
      {
          name: 'zrender',
          location: '../../scripts/zrender-1.1.2/src',// zrender与echarts在同一级目录
          main: 'zrender'
      }
    ]
});

require(
    [
        'echarts',
        'echarts/chart/line',
        'echarts/chart/bar',
        'echarts/chart/pie'       
    ],
    function (ec) {
        var myChart_Category = ec.init(document.getElementById('div_pieCategory'));
        
        var myChart_Bar = ec.init(document.getElementById('div_bar'));
        //堆积柱状图
        var myChart_Stack = ec.init(document.getElementById('div_stack'));
        //柱状图（研发产品数量）
        var myChart_AddtimeBar = ec.init(document.getElementById('div_addtime'));
        

        //不同功能保健产品数量图
        SetTestStatisticsByCategory(ec, myChart_Category);
        
        //适宜不同人群的保健产品数量图
        SetTestStatisticsByBeginTime(ec, myChart_Bar);
        //设置堆积柱状图样式（不同种类产品的数量）
        SetTestStatisticsByState(ec, myChart_Stack);
        //设置柱状图样式（不同年度研发产品数量）
        SetTestStatisticsByAddTime(ec,myChart_AddtimeBar);    
        
    }
)

/*
*前台数据表格格式设置
*/
//设置不同年度研发保健品数量数据  ---柱状图2---
function SetTestStatisticsByAddTime(ec, myChart_AddtimeBar) {
    optionbar_addtime = {
        title: {
            text: '年度研发（或批准）的保健食品数量统计',
            x:'center'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['保健食品数量'],
            x:'right'
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            y:'center',
            feature: {
                dataView: { show: true, readOnly: true },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: false,
        xAxis: [
            {
                type: 'category',
                data : data_bar2_year
            }
        ],
        yAxis: [
            {
                type: 'value',
                splitArea: { show: true }
            }
        ],
        series: [
            {
                name: '保健食品数量',
                type: 'bar',
                data: data_bar2_value,
                markPoint: {
                    data: [
                        { type: 'max', name: '最大值' },
                        { type: 'min', name: '最小值' }
                    ]
                },
                markLine: {
                    data: [
                        { type: 'average', name: '平均值' }
                    ]
                }
            }
        ]
    };
    myChart_AddtimeBar.setOption(optionbar_addtime);
}

//设置不同功能保健食品数量统计数据： --- 饼图1 ---
function SetTestStatisticsByCategory(ec, myChart_Category) {
    optionpie_category = {
        title: {
            text: '现有保健食品功能分布',
            x:'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        calculable: false,
        toolbox: {
            show: true,
            feature: {
                dataView: { show: true, readOnly: true },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        series: [
            {
                type: 'pie',
                selectedMode: 'single',
                radius: '60%',
                center: ['50%', '45%'],
                itemStyle: {
                    normal: {
                        label: {
                            show: true, position: 'outer',
                            formatter: function (a, b, c, d) { return b + "(" + c + ")" },
                            textStyle: {
                                color: '#000'
                            }
                        },
                        labelLine: {
                            show: true
                        }
                    }
                },
                
                data: datapie_category
            }
        ]
    };
    myChart_Category.setOption(optionpie_category);
}

//设置不同状态保健品的数据  ---堆积柱状图---
function SetTestStatisticsByState(ec, myChart_Stack) {
    optionstack_bar = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: data_stack_tooltip
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            x: 'right',
            y: 'center',
            feature: {
                dataView: { show: true, readOnly: true },
                magicType: { show: true, type: ['line', 'bar', 'stack', 'tiled'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: false,
        xAxis: [
            {
                type: 'category',
                data: data_stack_type//接受后台数据动态添加
            }
        ],
        yAxis: [
            {
                type: 'value',
                splitArea: { show: true }
            }
        ],
        series: data_stack_value 
    };

    myChart_Stack.setOption(optionstack_bar);
}

//设置适宜不同人群的保健食品统计数据： ---柱状图 ---
function SetTestStatisticsByBeginTime(ec, myChart_Bar) {

    optionpie_bar = {
        title: {
            text: '适宜不同人群的保健品数量',
            //subtext: '--按照月份',
            x: 'center'

        },
        tooltip: {
            trigger: 'axis'
        },
        toolbox: {
            show: true,
            feature: {
                dataView : {show: true, readOnly: true},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
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
                splitArea: { show: true }
            }
        ],
        series: [
            {

                name: '适宜不同人群的保健品数量',
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


/*
*后台数据获取
*/
//获取不同功能保健食品统计数据
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

//获取不同状态保健品统计数据
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
                    //datapie_state = eval('(' + data + ')');
                    var tempdata = data.split(';');
                    var xxdate = tempdata[0];
                    var xxcount = tempdata[1];
                    var xxtip = tempdata[2];
                    data_stack_type = eval('(' + xxdate + ')');
                    data_stack_value = eval('(' + xxcount + ')');
                    data_stack_tooltip = eval('(' + xxtip + ')');
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

//获取不同年度批准的保健品数据
function GetTestStatisticsByAddTime() {
    $.ajax({
        type: "post",
        dataType: "text",
        traditional: true,
        data: { oper: "byaddtime" },
        url: AjaxUrl,
        async: false,
        success: function (data, textStatus) {
            if (data != null) {
                if (data) {
                    var tempdata = data.split(';');
                    var xx_date = tempdata[0];
                    var xx_value = tempdata[1];
                    //保健食品数量
                    var health_count = tempdata[2];
                    //截止年份
                    var product_maxyear = tempdata[3];
                    //上市的保健食品的数量
                    var product_sellcount = tempdata[4];
                    //获取上市的保健食品的百分比
                    var persent = tempdata[5];
                    //赋值到前台label标签中
                    $('#productCount').html(health_count);
                    $('#productMaxYear').html(product_maxyear);
                    $('#productSellCount').html(product_sellcount);
                    $('#sellPersent').html(persent);
                    data_bar2_year = eval('(' + xx_date + ')');
                    data_bar2_value = eval('(' + xx_value + ')');
                } else {
                    alert("获取年度研发产品数据失败！");
                }
            }
        },
        complete: function (XMLHttpRequest, textStatus) { },
        error: function (e) { alert("获取年度研发产品数据失败，请刷新页面重新加载！"); }
    });
}

//获取不同人群适宜保健食品统计数据
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
                    //女士专用产品数量
                    var lady_count = tempdata[2];
                    //老年人专用产品数量
                    var old_count = tempdata[3];
                    $('#ladyCount').html(lady_count);
                    $('#oldCount').html(old_count);
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

