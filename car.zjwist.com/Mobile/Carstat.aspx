﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carstat.aspx.cs" Inherits="Mobile_Carstat" %>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=false">
    <link type="text/css" href="css/car.css" rel="stylesheet">
    <link type="text/css" href="http://weui.github.io/weui/weui.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <%--echarts 引入--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.2/echarts.min.js"></script>
    <script src="iscroll.js"></script>
</head>
<body>
    <div class="linediv" id="wrapper" style="overflow: hidden; left: 0px; background-color: rgb(36, 8, 77); height:auto">
        <div id="scroller">
            <div id="pullDown" style="text-align: center;">
                <div style="display: inline-block">
                    <span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
                </div>
            </div>
            <ul id="thelist">
                <div style="position: relative;height: 300px;">
                    <div style="position: absolute; left: 30px; top: 20px;">
                        <img src="images/title.png">
                        <span style="color: White; font-size: large; font-style: normal">今日车辆变化</span>
                    </div>
                    <div id="CharCurr" style="position: absolute; left: 10px; top: 10px; height: 300px; width: 98%;
                        margin: auto;">
                    </div>
                </div>
                <div style="clear:both"></div>
                <div style="position: relative;height: 300px;">
                    <div style="position: absolute; left: 30px; top: 20px;">
                        <img src="images/title.png">
                        <span style="color: White; font-size: large; font-style: normal">今日进出车辆</span>
                    </div>
                    <div id="divCarCountChange" style="position: absolute; left: 10px; top: 10px; height: 300px; width: 98%;
                        margin: auto;">
                    </div>
                </div>
                <div style="clear:both"></div>
                <div style="position: relative;height: 300px;">
                    <div style="position: absolute; left: 30px; top: 20px;">
                        <img src="images/title.png">
                        <span style="color: White; font-size: large; font-style: normal">今日车辆来源</span>
                    </div>
                    <div id="divCharCityFrom" style="position: absolute; left: 10px; top: 10px; height: 300px; width: 98%;
                        margin: auto;">
                    </div>
                </div>
            </ul>
        </div>
    </div>

   
    <script>

    function GetData() {
        $.getJSON("ajax/WelComeMobile.ashx",
            {
                UnitID: 3,
                r: Math.random()
            },
            function (e) {
                CharCurr(e.ChartFivMinute, e.ChartCurrCount);
                CarCountChange(e.ChartFivMinute, e.ChartEnterCount, e.ChartLeaveCount);
                CharCityFrom(e.ChartCityName, e.ChartCityCount);
            });
    }

     //今日车辆变化折线图
        function CharCurr(CharCurrTime, CharCurrCount) {
            var ChartComeCount = echarts.init(document.getElementById('CharCurr'));
            ChartComeCount.setOption({
                tooltip: {
                   trigger: 'axis',
                   formatter:'{b0}<br />数量{c0}',
                   borderWidth:2,
                   borderColor: '#ffffff',
                   textStyle:{
                        fontWeight:'100',
                        fontSize:8
                   }
                },
//                title: {
//                   left: 'left',
//                   text: '今日车辆变化',
//                   textStyle:{
//                        color:'#ffffff'
//                   }
//                },
                
                xAxis: {
                   type: 'category',
                   boundaryGap: true,
                   data: CharCurrTime,
                   splitLine:{
                        show:true,
                        lineStyle:{
                            color:'rgb(96,68,136)'
                        }
                   },
                   axisLabel:{
                        show:true,
                        textStyle:{
                            color:'rgb(102,94,118)'
                        }
                   }
               },
               yAxis: {
                  type: 'value',
                  data: CharCurrCount,
                  splitLine:false,
                  axisLabel:{
                        show:true,
                        textStyle:{
                            color:'rgb(102,94,118)'
                        }
                  }
              },
               series: [
               {
                    //name:'数量',
                    type:'line',
                    smooth:true,
                    sampling: 'average',
                    itemStyle: {
                   	    normal: {
                            color: 'rgb(61, 254, 206)'
                        }
                    },
                    areaStyle: {
                         normal: {
                             color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(91, 19, 207)'
                                }, {
                                offset: 1,
                                    color: 'rgb(33, 9, 67)'
                                }])
                            }
                        },
                    data:CharCurrCount,
                }]
            });
        };

    
    

    //今日进出车辆折线图
    function CarCountChange(ChartFivMinute, ChartEnterCount, ChartLeaveCount) {
        var lineChart = echarts.init(document.getElementById('divCarCountChange'));

        lineChart.setOption({
//            title: {
//                left: 'left',
//                text: '今日进出车辆',
//                textStyle: {
//                    color: '#ffffff'
//                }
//            },
            tooltip: {
                trigger: 'axis',
                formatter: '{b0}<br /><span style="color:#47fad0">∨</span>{c0}<br /><span style="color:red">∧</span>{c1}',
                borderWidth: 2,
                borderColor: '#ffffff',
                textStyle: {
                    fontWeight: '100',
                    fontSize: 8
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ChartFivMinute,
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: 'rgb(89,65,123)'
                    }
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            yAxis: [
            {
                type: 'value',
                splitLine: false,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            series: [
            {
                name: '进入',
                type: 'line',
                itemStyle: {
                   	    normal: {
                            color: 'rgb(111, 255, 219)'
                        }
                    },
                areaStyle: { 
                    normal: {
                        color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(91, 19, 207)'
                                }, {
                                offset: 1,
                                    color: 'rgb(33, 9, 67)'
                                }])
                    } 
                },
                data: ChartEnterCount
            },
           {
               name: '离开',
               type: 'line',
               itemStyle: {
                   	    normal: {
                            color: 'rgb(202, 67, 125)'
                        }
                    },
               areaStyle: { 
                    normal: {
                        color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(152, 86, 124)'
                                }, {
                                offset: 1,
                                    color: 'rgb(33, 9, 67)'
                                }])
                    } 
                },
               data: ChartLeaveCount
           }]
        });

    }


    //今日车辆来源柱形图
    function CharCityFrom(ChartCityName, ChartCityCount){
         var pieChart = echarts.init(document.getElementById('divCharCityFrom'));

         pieChart.setOption({
//            title:{
//                text:'今日车辆来源',
//                left: 'left',
//                textStyle: {
//                    color: '#ffffff'
//                }
//            },
            color: ['#6fffdc'],
            tooltip : {
                trigger: 'axis',
                formatter: '{b0}<br />{c0}',
                borderWidth: 2,
                borderColor: '#ffffff',
                textStyle: {
                    fontWeight: '100',
                    fontSize: 8
                },
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
            {
                type : 'category',
                data : ChartCityName,
                axisTick: {
                    alignWithLabel: true
                },
                splitLine: false,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            yAxis : [
            {
                type : 'value',
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: 'rgb(89,65,123)'
                    }
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            series : [
            {
                name:'来源地',
                type:'bar',
                barWidth: '60%',
                data:ChartCityCount
            }]
         });
    }
   

    var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;

    function pullDownAction() {
        setTimeout(function () {
            var el;
            el = document.getElementById('thelist');
            myScroll.refresh();
            GetData();
        }, 1000);
    }


    function loaded() {
        pullDownEl = document.getElementById('pullDown');
        pullDownOffset = pullDownEl.offsetHeight;

        myScroll = new iScroll('wrapper', {
            useTransition: true,
            topOffset: pullDownOffset,
            onRefresh: function () {
                if (pullDownEl.className.match('loading')) {
                    pullDownEl.className = '';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '更新完成...';
                }
            },
            onScrollMove: function () {
                if (this.y > 5 && !pullDownEl.className.match('flip')) {
                    pullDownEl.className = 'flip';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '放开刷新...';
                    this.minScrollY = 0;
                } else if (this.y < 5 && pullDownEl.className.match('flip')) {
                    pullDownEl.className = '';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
                    this.minScrollY = -pullDownOffset;
                }
            },
            onScrollEnd: function () {
                if (pullDownEl.className.match('flip')) {
                    pullDownEl.className = 'loading';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '等待更新...';
                    pullDownAction();
                }
            }
        });

        setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
    }
    document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

    GetData();
    </script>
</body>
</html>
