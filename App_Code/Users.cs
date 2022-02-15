using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;


/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{
    private string username;
    private string firstname;
    private string lastname;
    private string password;
    private string email;
    private string birthy;
    private string birthm;
    private string birthd;
    private string gender;

    public OleDbConnection objCon = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;DATA Source=" + HttpContext.Current.Server.MapPath("~") + @"\AppData\project_Database.accdb" + "");

    public Users()
    {
        //
        // TODO: Add constructor logic here
        //
        objCon.Open();
    }



    public string LogIn(string UserName, string password)
    {
        string userName = "";

        var objParam = new OleDbParameter();
        var objCmd = new OleDbCommand("login", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        objParam = new OleDbParameter("@username", OleDbType.Char);
        objParam.Value = UserName;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@password", OleDbType.Char);
        objParam.Value = password;
        objCmd.Parameters.Add(objParam);

        if (objCmd.ExecuteScalar() != null)
            userName = objCmd.ExecuteScalar().ToString();
        return userName;

    }

    public DataSet Update(string username)
    {
        var ds = new DataSet();
        var da = new OleDbDataAdapter("show_data", objCon);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        var objParam = new OleDbParameter("@username", OleDbType.Char);
        objParam.Value = username;
        da.SelectCommand.Parameters.Add(objParam);

        da.Fill(ds);
        return (ds);

    }

    public bool Register(string UserName, string FirstName, string LastName, string UserPass, string email, string bYear, string bMonth, string bDay, string Gender)
    {
        OleDbParameter objParaml = new OleDbParameter();
        OleDbCommand objCmdl = new OleDbCommand("user_check", objCon);
        objCmdl.CommandType = CommandType.StoredProcedure;

        objParaml = new OleDbParameter("@username", OleDbType.Char);
        objParaml.Value = UserName;
        objCmdl.Parameters.Add(objParaml);

        if (objCmdl.ExecuteScalar() != null)
            return false;

        var objParam = new OleDbParameter();
        var objCmd = new OleDbCommand("insertUser", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        objParam = new OleDbParameter("@username", OleDbType.Char);
        objParam.Value = UserName;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@firstname", OleDbType.Char);
        objParam.Value = FirstName;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@lastname", OleDbType.Char);
        objParam.Value = LastName;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@password", OleDbType.Char);
        objParam.Value = UserPass;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@email", OleDbType.Char);
        objParam.Value = email;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthy", OleDbType.Char);
        objParam.Value = bYear;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthm", OleDbType.Char);
        objParam.Value = bMonth;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthd", OleDbType.Char);
        objParam.Value = bDay;
        objCmd.Parameters.Add(objParam);

        Debug.WriteLine("hello");

        objParam = new OleDbParameter("@gender", OleDbType.Char);
        objParam.Value = Gender;
        objCmd.Parameters.Add(objParam);

        objCmd.ExecuteNonQuery();

        return true;
    }


    public DataSet Friends()
    {
        DataSet ds = new DataSet();
        OleDbDataAdapter da = new OleDbDataAdapter("Friends", objCon);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        da.Fill(ds);
        return ds;
    }

    public bool UpdateUserDetails(string Fname, string Lname, string passwordt, string checkPass, string email, string bYear, string bMonth, string bDay, string Gender, string user)
    {
        var objParam = new OleDbParameter();

        var objCmd = new OleDbCommand("update", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        objParam = new OleDbParameter("@firstname", OleDbType.Char);
        objParam.Value = Fname;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@lastname", OleDbType.Char);
        objParam.Value = Lname;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@password", OleDbType.Char);
        objParam.Value = passwordt;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@email", OleDbType.Char);
        objParam.Value = email;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthy", OleDbType.Char);
        objParam.Value = bYear;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthm", OleDbType.Char);
        objParam.Value = bMonth;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@birthd", OleDbType.Char);
        objParam.Value = bDay;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@gender", OleDbType.Char);
        objParam.Value = Gender;
        objCmd.Parameters.Add(objParam);

        objParam = new OleDbParameter("@username", OleDbType.Char);
        objParam.Value = user;
        objCmd.Parameters.Add(objParam);

        objCmd.ExecuteNonQuery();
        return true;

    }

}