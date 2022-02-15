using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Users u = new Users();
            String x = Request.Form["Username"];
            String y = Request.Form["Pass"];
            String UserName = u.LogIn(x, y);
            if(UserName != "")
            {
                Session["user"] = Request.Form["Username"];
                Response.Write("<script>alert('Hello');</script");
                Server.Transfer("home.aspx");
            }
            else
            {
                Response.Write("<script>alert('UserNmae or pass incorrect');</script");
            }
        }
    }
}
