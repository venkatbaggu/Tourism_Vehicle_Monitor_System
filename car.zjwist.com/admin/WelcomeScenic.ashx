﻿<%@ WebHandler Language="C#" Class="WelcomeScenic" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class WelcomeScenic : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        double coefficient;


        WSData wsd = new WSData();

        DataSet ds = MySQL.ExecProc("usp_WelcomeScenic_PC", new string[] { context.Request["UnitID"], context.Request["datechange"] }, out sqlexec, out sqlresult);
        wsd.UnitName = ds.Tables[0].Rows[0]["UnitName"].ToString();
        wsd.CityName = ds.Tables[0].Rows[0]["CityName"].ToString();
        coefficient = Convert.ToDouble(ds.Tables[0].Rows[0]["Coefficient"]);
        wsd.DeviceCount = Convert.ToInt32(ds.Tables[1].Rows[0]["DeviceCount"]);
        wsd.CurrCount = Convert.ToInt32(ds.Tables[2].Rows[0]["CurrCount"]);

        if (!string.IsNullOrEmpty(ds.Tables[7].Rows[0]["StayNightCount"].ToString()))
        {
            wsd.StayNightCount = ds.Tables[7].Rows[0]["StayNightCount"].ToString();
        }
        else
        {
            wsd.StayNightCount = "0";
        }

        wsd.EnterCount = ds.Tables[3].Rows[0]["EnterCount"].ToString();
        wsd.LeaveCount = ds.Tables[3].Rows[0]["LeaveCount"].ToString();

        int entercount, leavecount, totalentercount, totalleavecount, chartcurrcount;
        entercount = leavecount = totalentercount = totalleavecount = chartcurrcount = 0;

        int j = 0;

        foreach (DataRow dr in ds.Tables[4].Rows)
        {


            if (j % 2 == 0)
            {
                wsd.ChartFivMinute.Add(dr["rTime"].ToString());

                if (context.Request["datechange"] == DateTime.Now.ToString("yyyy-MM-dd") &&
                    Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd") + " " + dr["rtime"].ToString() + ":00") > DateTime.Now)
                {
                    wsd.ChartEnterCount.Add(null);
                    wsd.ChartLeaveCount.Add(null);
                    wsd.ChartCurrCount.Add(null);
                }
                else
                {
                    int leavecountchange = Convert.ToInt32(Math.Truncate(leavecount * coefficient));

                    wsd.ChartEnterCount.Add(entercount.ToString());
                    wsd.ChartLeaveCount.Add(leavecountchange.ToString("F0"));

                    if (chartcurrcount < 0)
                    {
                        wsd.ChartCurrCount.Add("0");
                    }
                    else
                    {
                        wsd.ChartCurrCount.Add(chartcurrcount.ToString("F0"));
                    }
                }

                if (string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount = 0;
                }
                else
                {
                    entercount = Convert.ToInt32(dr["EnterCount"]);
                }
                if (string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
                {
                    leavecount = 0;
                }
                else
                {
                    leavecount = Convert.ToInt32(dr["LeaveCount"]);
                }

            }

            else
            {
                if (!string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount += Convert.ToInt32(dr["EnterCount"]);
                }
                if (!string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
                {
                    leavecount += Convert.ToInt32(dr["LeaveCount"]);
                }
            }
            j++;
        }

        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            wsd.ChartTypeName.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());

            wsd.ChartTypeCount.Add(Convert.ToInt32(dr["TypeCount"]));


        }

        wsd.MapData = "{\"" + ds.Tables[0].Rows[0]["UnitName"].ToString() + "\":[" + ds.Tables[0].Rows[0]["lat"].ToString() + "," + ds.Tables[0].Rows[0]["lnt"].ToString() + "],"; ;

        //int MoreFiveCity = 0;

        int citycount = 0;
        foreach (DataRow dr in ds.Tables[6].Rows)
        {
            if (dr["CityName"].ToString() != "丽水")
            {

                if (Convert.ToInt32(dr["MCount"]) > 5 || citycount < 11)
                {
                    wsd.ChartCityName.Add(dr["CityName"].ToString());
                    wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));
                }
                else
                {
                    wsd.ChartCityName.Add(dr["CityName"].ToString());
                    wsd.ChartCityCountLess.Add(Convert.ToInt32(dr["MCount"]));
                }
            }
            wsd.MapData += "\"" + dr["CityName"].ToString() + "\":[" + dr["lon"].ToString() + "," + dr["lat"].ToString() + "],";

            citycount++;
        }

        wsd.MapData = wsd.MapData.Substring(0, wsd.MapData.Length - 1) + "}";

        foreach (DataRow dr in ds.Tables[8].Rows)
        {
            WSData.DeviceCountInfo di = new WSData.DeviceCountInfo();

            di.DeviceName = dr["DeviceInstall"].ToString();
            di.EnterCount = Convert.ToInt32(dr["DeviceEnterCount"]);
            di.LeaveCount = Convert.ToInt32(dr["DeviceLeaveCount"]);

            wsd.deviceCountInfo.Add(di);
        }


        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(wsd));

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public class WSData
    {
        public WSData()
        {
            ChartFivMinute = new List<string>();
            ChartCurrCount = new List<string>();
            ChartEnterCount = new List<string>();
            ChartLeaveCount = new List<string>();
            ChartTypeName = new List<string>();
            ChartTypeCount = new List<int>();
            ChartCityName = new List<string>();
            ChartCityCount = new List<int>();
            ChartCityNameLess = new List<string>();
            ChartCityCountLess = new List<int>();

            deviceCountInfo = new List<DeviceCountInfo>();

        }
        /// <summary>
        /// 单位名称
        /// </summary>
        public string UnitName { get; set; }
        /// <summary>
        /// 当前地区的车辆前缀
        /// </summary>
        public string CityName { get; set; }
        /// <summary>
        /// 设备数量
        /// </summary>
        public int DeviceCount { get; set; }
        /// <summary>
        /// 当前车辆数量
        /// </summary>
        public int CurrCount { get; set; }
        /// <summary>
        /// 当前车辆饱和度
        /// </summary>
        public string Level { get; set; }
        /// <summary>
        /// 过夜车辆数量
        /// </summary>
        public string StayNightCount { get; set; }
        /// <summary>
        /// 本日进入车辆总数
        /// </summary>
        public string EnterCount { get; set; }
        /// <summary>
        /// 本日离开车辆总数
        /// </summary>
        public string LeaveCount { get; set; }
        /// <summary>
        /// 5分钟的时间刻度！
        /// </summary>
        public List<string> ChartFivMinute { get; set; }
        /// <summary>
        /// 当前车辆变化
        /// </summary>
        public List<string> ChartCurrCount { get; set; }
        /// <summary>
        /// 进入车辆数量变化
        /// </summary>
        public List<string> ChartEnterCount { get; set; }
        /// <summary>
        /// 离开车辆数量变化
        /// </summary>
        public List<string> ChartLeaveCount { get; set; }
        /// <summary>
        /// 车辆类型
        /// </summary>
        public List<string> ChartTypeName { get; set; }
        /// <summary>
        /// 类型数量
        /// </summary>
        public List<int> ChartTypeCount { get; set; }

        /// <summary>
        /// 来源地名称
        /// </summary>
        public List<string> ChartCityName { get; set; }
        /// <summary>
        /// 来源地数量大于5
        /// </summary>
        public List<int> ChartCityCount { get; set; }

        /// <summary>
        /// 来源地名称
        /// </summary>
        public List<string> ChartCityNameLess { get; set; }
        /// <summary>
        /// 来源地数量小于5
        /// </summary>
        public List<int> ChartCityCountLess { get; set; }


        /// <summary>
        /// 地图的数据！
        /// </summary>
        public string MapData { get; set; }

        public List<DeviceCountInfo> deviceCountInfo { get; set; }

        public class DeviceCountInfo
        {
            public string DeviceName { get; set; }
            public int EnterCount { get; set; }
            public int LeaveCount { get; set; }

        }

    }


}