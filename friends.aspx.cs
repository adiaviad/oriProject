using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    public DataSet ds = new DataSet();
    Users u = new Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = u.Friends();
    }
    public void Showlist()
    {
        Response.Write("<table border = '1'><tr>");
        Response.Write("<td> First Name </td><td> Last Name</td>");
        Response.Write("<td> Username </td><td> Email </td>");
        Response.Write("<td> Birth year </td><td> Birth month </td>");
        Response.Write("<td> Birth day </td><td> Gender </td> </tr>");
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            Response.Write("<tr>");
            Response.Write("<td>" + row["firstname"].ToString() + "</td>");
            Response.Write("<td>" + row["lastname"].ToString() + "</td>");
            Response.Write("<td>" + row["username"].ToString() + "</td>");
            Response.Write("<td>" + row["email"].ToString() + "</td>");
            Response.Write("<td>" + row["birthy"].ToString() + "</td>");
            Response.Write("<td>" + row["birthm"].ToString() + "</td>");
            Response.Write("<td>" + row["birthd"].ToString() + "</td>");
            Response.Write("<td>" + row["gender"].ToString() + "</td>");
            Response.Write("</tr>");
        }
        Response.Write("</table>");
    }
}