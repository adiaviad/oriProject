using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users u = new Users();
        
        if (IsPostBack)
        {
            bool UN = u.Register(Request.Form["userName"], Request.Form["FName"], Request.Form["LName"], Request.Form["Passw"], Request.Form["Email"], Request.Form["Byear"], Request.Form["Bmonth"], Request.Form["Bday"], Request.Form["gender"]);

            if (UN)
            {
                Session["user"] = Request.Form["userName"];
                Response.Write("<script>alert('register succesful');</script>");
                Server.Transfer("home.aspx");
            }
            else
            {
                Response.Write("<script>alert('name taken');</script>");
            }

        }
    }
}