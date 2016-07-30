﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class car_oldindex : System.Web.UI.Page
{
    public string unitid;
    public string datayesterday;

    protected void Page_Load(object sender, EventArgs e)
    {
        datayesterday = Request["d"];

        if (!string.IsNullOrEmpty(Request["unitid"]))
        {
            unitid = Request["unitid"];
        }
        else
        {
            unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        }
    }
}