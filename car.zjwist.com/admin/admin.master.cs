﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserCookieInfo uc = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues();
        lbTrueName.Text = uc.TrueName;
    }
}