﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="StatCountyFlow.aspx.cs" Inherits="admin_StatCountyFlow" %>

<%@ Register Src="StatCountyMenu.ascx" TagName="StatCountyMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:StatCountyMenu ID="StatMenu1" runat="server" />
    <div class="con_tables">
        <div class="ct_block">
            <div class="slt">
                <div class="slt_time">
                    <div class="slt_tl">
                        <asp:DropDownList runat="server" ID="ddlYear">
                        </asp:DropDownList>
                        年
                    </div>
                    <div class="sltt_quick" runat="server" id="divMonth">
                        <div class="slttq" runat="server" id="div1">
                            <asp:LinkButton ID="btn1Month" runat="server" OnClick="btn1Month_Click">1月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div2">
                            <asp:LinkButton ID="btn2Month" runat="server" OnClick="btn2Month_Click">2月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div3">
                            <asp:LinkButton ID="btn3Month" runat="server" OnClick="btn3Month_Click">3月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div4">
                            <asp:LinkButton ID="btn4Month" runat="server" OnClick="btn4Month_Click">4月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div5">
                            <asp:LinkButton ID="btn5Month" runat="server" OnClick="btn5Month_Click">5月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div6">
                            <asp:LinkButton ID="btn6Month" runat="server" OnClick="btn6Month_Click">6月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div7">
                            <asp:LinkButton ID="btn7Month" runat="server" OnClick="btn7Month_Click">7月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div8">
                            <asp:LinkButton ID="btn8Month" runat="server" OnClick="btn8Month_Click">8月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div9">
                            <asp:LinkButton ID="btn9Month" runat="server" OnClick="btn9Month_Click">9月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div10">
                            <asp:LinkButton ID="btn10Month" runat="server" OnClick="btn10Month_Click">10月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div11">
                            <asp:LinkButton ID="btn11Month" runat="server" OnClick="btn11Month_Click">11月</asp:LinkButton>
                        </div>
                        <div class="slttq" runat="server" id="div12">
                            <asp:LinkButton ID="btn12Month" runat="server" OnClick="btn12Month_Click">12月</asp:LinkButton>
                        </div>
                        <div class="slttq" onclick="ShowCompare()">
                            对比
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="slt divCompare" style="display: none">
                <div class="slt_time">
                    <div class="slt_tl">
                        <asp:DropDownList runat="server" ID="ddlCompareYear">
                        </asp:DropDownList>
                        年
                    </div>
                    <div class="sltt_quick">
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(1,this)">1月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(2,this)">2月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(3,this)">3月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(4,this)">4月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(5,this)">5月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(6,this)">6月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(7,this)">7月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(8,this)">8月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(9,this)">9月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(10,this)">10月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(11,this)">11月</a>
                        </div>
                        <div class="slttq classcomparemonth">
                            <a href="javascript:;" onclick="CompareClick(12,this)">12月</a>
                        </div>
                        <div class="slttq" id="div26" onclick="CompareShow()">
                            比较
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divCounty" style="width: 100%">
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divScenic" style="width: 100%">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <script src="http://cdn.tourzj.com/js/echarts.min.js" type="text/javascript"></script>
    <script>
        var ChartCounty;
        var ChartScenic;

        $(window).on("load", function () {
            $(".content").css({ "height": "auto" });
            //$("#divFlowBlock").height($(".content").height() - 275);
            ChartCounty = echarts.init(document.getElementById('divCounty'));
            ChartScenic = echarts.init(document.getElementById('divScenic'));
            ChartInit();
        });
        function ChartInit() {
           
            ChartCounty.setOption({
                title: {
                    text:"<%= CountyTitle %>"
                },
                tooltip: {
                    trigger: 'axis'
                },
                backgroundColor: '#FF',
                legend: {
                    data: ['进入数量','离开数量']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    boundaryGap: false,
                    splitLine: {
                        show: false
                    },
                    data: [<%= ChartDate %>]
                }],
                yAxis: [{
                    splitLine: {
                        show: false
                    },
                    type: 'value'
                }],
                series: [{
                    name: '进入数量',
                    type: 'line',
                    data: [<%= CountyEnter %>]
                },
                {
                    name: '离开数量',
                    type: 'line',
                    data: [<%= CountyLeave %>]
                }]
            });

             ChartScenic.setOption({
                title: {
                    text:"<%= ScenicTitle %>"
                },
                tooltip: {
                    trigger: 'axis'
                },
                backgroundColor: '#FF',
                legend: {
                    data: ['车辆数量']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    boundaryGap: false,
                    splitLine: {
                        show: false
                    },
                    data: [<%= ChartDate %>]
                }],
                yAxis: [{
                    splitLine: {
                        show: false
                    },
                    type: 'value'
                }],
                series: [{
                    name: '景区数量',
                    type: 'line',
                    data: [<%= ScenicCount %>]
                }]
            });
        }

        function ShowCompare(){
            //
            if ($(".divCompare").is(":hidden"))
            {
                $(".divCompare").show();
            }
            else
            {
             $(".divCompare").hide();
            }
        }

        var CompareMonth = null;

        function CompareClick(month,amonth){
            CompareMonth = month;
            //样式设置
            $(".classcomparemonth").removeClass("slt_on");
            amonth.parentNode.className = "slttq classcomparemonth slt_on";
        }

        function CompareShow(){
            //显示数据！
            if (CompareMonth == null){
                alert("请选择需要比较的月份")
            }
            else{
            $.getJSON("statcountyflowcompare.ashx",{
                Year:$("[id$='ddlCompareYear']").val(),
                Month:CompareMonth,
                unitid:<%= unitid %>,
                r:Math.random()
            },function(e){
                //画第二条线
                 ChartCounty.setOption({
                    legend: {
                        data: ['进入','离开','对比进入','对比离开']
                    },
                    series: [
                    {
                        name: '进入数量',
                        type: 'line',
                        data: [<%= CountyEnter %>]
                    },
                    {
                        name: '离开数量',
                        type: 'line',
                        data: [<%= CountyLeave %>]
                    },
                    {
                        name: '对比进入',
                        type: 'line',
                        data: e.CountyEnter
                    },
                    {
                        name: '对比离开',
                        type: 'line',
                        data: e.CountyLeave
                    }]
                });

                ChartScenic.setOption({
                    legend: {
                        data: ['景区数量','对比数量']
                    },
                    series: [
                    {
                        name: '景区数量',
                        type: 'line',
                        data: [<%= ScenicCount %>]
                    },
                    {
                        name: '对比数量',
                        type: 'line',
                        data: e.ScenicCount
                    }]
                });
            });
          }
        }
    </script>
</asp:Content>