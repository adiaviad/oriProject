<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script lang ="javascript" type="text/javascript">

        function Clear()
        {
            document.getElementById("mUsername").style.visibility = "hidden;"
            document.getElementById("mPassword").style.visibility = "hidden;"
        }
        function CheckForm()
        {
            var flag = true;
            var n = document.getElementById("Username").value;
            var p = document.getElementById("Pass").value;

            if (n.length == 0)
            {
                document.getElementById("mUsername").value = "pls enter username";
                document.getElementById("mUsername").style.visibility = "visible";
                flag = false;
            }
            else
                document.getElementById("mUsername").style.visibility = "hidden";

            if (p.length == 0)
            {
                document.getElementById("mPassword").value = "pls enter password";
                document.getElementById("mPassword").style.visibility = "visible";
                flag = false;
            }
            else
                document.getElementById("mPassword").style.visibility = "hidden";

            return flag;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <table border="0">
            <tr>
                <td><h2 style ="color:dimgrey;font-family:Roboto"> Username </h2></td>
                <td><input type="text" id="Username" name="Username" style="color:black; " /> </td>
                <td><input type="text" name="mUsername" id="mUsername" style="visibility:hidden; color:black" disabled="disabled" /> </td>
            </tr>
            <tr>
                <td> <h2 style ="color:dimgrey;font-family:Roboto"> Password </h2> </td>
                <td> <input type="password" id="Pass" name="Pass" style="color:black" /maxlength ="12" </td>
                <td> <input type="text" name="mPassword" id="mPassword" style="visibility:hidden;" disabled="disabled" /> </td>
            </tr>
            <tr>
                <td> <input type="Submit" value="Send" /> <input type="Reset" value="Clean" /> </td>
            </tr>
        </table>
    </center>

</asp:Content>

