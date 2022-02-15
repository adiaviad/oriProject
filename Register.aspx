<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
    <script lang="javascript" type="text/javascript">

        function Clear() {

            document.getElementById("mFName").style.visibility = "hidden";
            document.getElementById("mLName").style.visibility = "hidden";
            document.getElementById("muserName").style.visibility = "hidden";
            document.getElementById("mPassw").style.visibility = "hidden";
            document.getElementById("mCheckPass").style.visibility = "hidden";
            document.getElementById("mEmail").style.visibility = "hidden";
            document.getElementById("mCheckPass").style.visibility = "hidden";
            document.getElementById("mBirth").style.visibility = "hidden";
            document.getElementById("mGender").style.visibility = "hidden";
        }
        function CheckForm() {

            var flag = true;
            var f = document.getElementById("FName").value;
            var l = document.getElementById("LName").value;
            var u = document.getElementById("userName").value;
            var p = document.getElementById("Passw").value;
            var c = document.getElementById("CheckPass").value;
            var e = document.getElementById("Email").value;
            var y = document.getElementById("Byear").value;
            var m = document.getElementById("Bmonth").value;
            var d = document.getElementById("Bday").value;
            var gender = document.getElementsByName("gender");

            // CHECKS FIRST NAME
            if (f.length == 0) {
                document.getElementById("mFName").value = "Must enter first a name";
                document.getElementById("mFName").style.visibility = "visible";
                flag = false;
            }
            else {
                if (f.length < 2) {
                    document.getElementById("mFName").value = "Must enter a real name";
                    document.getElementById("mFName").style.visibility = "visible";
                    flag = false;
                }
                else {
                    var status = false;
                    for (var i in f.toString()) {
                        if (f[i] == " ") {
                            status = true;
                            console.log(status);
                        }
                    }
                    if (status == true) {
                        document.getElementById("mFName").value = "No spaces";
                        document.getElementById("mFName").style.visibility = "visible";
                        flag = false;
                    }
                    else
                        document.getElementById("mFName").style.visibility = "hidden";
                }
            }

            // CHECKS LAST NAME
            if (l.length == 0) {
                document.getElementById("mLName").value = "Must enter a last name";
                document.getElementById("mLName").style.visibility = "visible";
                flag = false;
            }
            else {
                if (l.length < 2) {
                    document.getElementById("mLName").value = "Must enter a real name";
                    document.getElementById("mLName").style.visibility = "visible";
                    flag = false;
                }
                else {
                    var status2 = false;
                    for (var i = 0; i < l.length; i++) {
                        if (l.charAt(i) == " ")
                            status2 = true;
                    }
                    if (status2 == true) {
                        document.getElementById("mLName").value = "No spaces";
                        document.getElementById("mLName").style.visibility = "visible";
                        falg = false;
                    }
                    else
                        document.getElementById("mLName").style.visibility = "hidden";
                }
            }


            // CHECKS USERNAME
            if (u.length == 0) {
                document.getElementById("muserName").value = "Must enter a username";
                document.getElementById("muserName").style.visibility = "visible";
                flag = false;
            }
            else {
                if (u.length < 2 || u.length > 15) {
                    document.getElementById("muserName").value = "Must enter between 2 and 15 characters";
                    document.getElementById("muserName").style.visibility = "visible";
                    flag = false;
                }
                else {
                    status = false;
                    for (var i = 0; i < u.length; i++) {
                        if (u.charAt(i) == " ")
                            status = true;
                    }
                    if (status == true) {
                        document.getElementById("muserName").value = "No spaces";
                        document.getElementById("muserName").style.visibility = "visible";
                        flag = false;
                    }
                    else
                        document.getElementById("muserName").style.visibility = "hidden";
                }
            }

            // CHECK PASSWORD
            if (p.length == 0) {
                document.getElementById("mPassw").value = "Must enter a password";
                document.getElementById("mPassw").style.visibility = "visible";
                flag = false;
            }
            else
                if (p.length < 2 || p.length > 15) {
                    document.getElementById("mPassw").value = "Must enter between 2 and 15 characters";
                    document.getElementById("mPassw").style.visibility = "visible";
                    flag = false;
                }
                else {
                    status = false;
                    for (var i = 0; i < p.length; i++) {
                        if (p.charAt(i) == " ")
                            status = true;
                    }
                    if (status == true) {
                        document.getElementById("mPassw").value = "No spaces";
                        document.getElementById("mPassw").style.visibility = "visible";
                        flag = false;
                    }
                    else
                        document.getElementById("mPassw").style.visibility = "hidden";
                }
            var cp = p;

            //CONFIRM PASSWORD
            if (c.length == 0) {
                document.getElementById("mCheckPass").value = "Must enter a password";
                document.getElementById("mCheckPass").style.visibility = "visible";
                flag = false;
            }
            else {
                if (c != p) {
                    document.getElementById("mCheckPass").value = "Psswords don't match";
                    document.getElementById("mCheckPass").style.visibility = "visible";
                    flag = false;
                }
                else
                    document.getElementById("mCheckPass").style.visibility = "hidden";
            }


            // CHECK EMAIL
            if (e.length == 0) {
                document.getElementById("mEmail").value = "Must enter an Email";
                document.getElementById("mEmail").style.visibility = "visible";
                flag = false;
            }
            else {
                status = false;
                for (var i = 0; i < e.length; i++) {
                    if (e.charAt(i) == "@")
                        status = true;
                }
                if (status == false) {
                    document.getElementById("mEmail").value = "Must include @";
                    document.getElementById("mEmail").style.visibility = "visible";
                    flag = false;
                }
                else
                {
                    status = false;
                    for (var i = 0; i < e.length; i++) {
                        if (e.charAt(i) == ".")
                            status = true;
                    }
                    if (status == false) {
                        document.getElementById("mEmail").value = "Must include .";
                        document.getElementById("mEmail").style.visibility = "visible";
                        flag = false;
                    }
                    else
                    {
                        if (e.lastIndexOf(".") - e.indexOf("@") <= 2) {
                            document.getElementById("mEmail").value = "2 chars between @ and .";
                            document.getElementById("mEmail").style.visibility = "visible";
                            flag = false;
                        }
                        else
                        {
                            var counter = 0;
                            for (var i in e) {
                                if (e[i] == "@")
                                    counter++;
                            }
                            if (counter > 1) {
                                document.getElementById("mEmail").value = "only one @";
                                document.getElementById("mEmail").style.visibility = "visible";
                                flag = false;
                            }
                            else {
                                if (e[e.length - 1] == ".") {
                                    document.getElementById("mEmail").value = "the last char cant be .";
                                    document.getElementById("mEmail").style.visibility = "visible";
                                    flag = false;
                                }
                                else
                                document.getElementById("mEmail").style.visibility = "hidden";
                            }
                        }
                    }
                }
            }

            // CHECK BIRTHDAY

            if (y == 0) {
                document.getElementById("mBirth").value = "Must enter a birth year";
                document.getElementById("mBirth").style.visibility = "visible";
                flag = false;
            }
            else {
                if (m == 0) {
                    document.getElementById("mBirth").value = "Must enter a birth month";
                    document.getElementById("mBirth").style.visibility = "visible";
                    flag = false;
                }
                else {
                    if (d == 0) {
                        document.getElementById("mBirth").value = "Must enter a birth day";
                        document.getElementById("mBirth").style.visibility = "visible";
                        flag = false;
                    }
                    else
                        document.getElementById("mBirth").style.visibility = "hidden";
                }
            }

            var flagRadio = false;
            for (var i = 0; i < gender.length; i++) {
                if (gender[i].checked) flagRadio = true;
            }
            if (!flagRadio) {
                document.getElementById("mGender").value = "Your must select a gender";
                document.getElementById("mGender").style.visibility = "visible";
                flag = false;
            }
            else document.getElementById("mGender").style.visibility = "hidden";


            console.log(flag.toString());
            return flag;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <table border="0">
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">First Name</h3></td>
                <td class="auto-style3"><input type="text" id="FName" name="FName"/></td>
                <td class="auto-style2"><input type="text" id="mFName" name="mFName" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">Last Name</h3></td>
                <td class="auto-style3"><input type="text" id="LName" name="LName" /></td>
                <td class="auto-style2"><input type="text" id="mLName" name="mLName" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">User Name</h3></td>
                <td class="auto-style3"><input type="text" id="userName" name="userName" /></td>
                <td class="auto-style2"><input type="text" id="muserName" name="muserName" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style9"><h3 style ="color:dimgrey;font-family:Roboto">Password</h3></td>
                <td class="auto-style10"><input type="password" id="Passw" name="Passw" maxlength="12" /></td>
                <td class="auto-style11"><input type="text" id="mPassw" name="mPassw" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">Confirm Password</h3></td>
                <td class="auto-style3"><input type="password" id="CheckPass" name="CheckPass" maxlength="12" /></td>
                <td class="auto-style2"><input type="text" id="mCheckPass" name="mCheckPass" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">Email</h3></td>
                <td class="auto-style3"><input type="text" id="Email" name="Email" /></td>
                <td class="auto-style2"><input type="text" id="mEmail" name="mEmail" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">Date of Birth</h3></td>
                <td class="auto-style3">
                    <select id="Byear" name="Byear">
                        <option value="0">Year</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                    </select>
                    <select id="Bmonth" name="Bmonth">
                        <option value="0">Month</option>
                        <option value="1">January</option>
                        <option value="2">Febuary</option>
                        <option value="3">March</option>
                        <option value="4">April</option>
                        <option value="5">May</option>
                        <option value="6">June</option>
                        <option value="7">July</option>
                        <option value="8">August</option>
                        <option value="9">September</option>
                        <option value="10">October</option>
                        <option value="11">November</option>
                        <option value="12">December</option>
                    </select>
                    <select id="Bday" name="Bday">
                        <option value="0">Day</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                </td>
                <td class="auto-style2"><input type="text" id="mBirth" name="mBirth" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"><h3 style ="color:dimgrey;font-family:Roboto">Gender</h3></td>
                <td id = "form"><input type = "radio" name = "gender" value="male"/>Male <input type = "radio" name = "gender" value="female"/>Female</td>
                </td>
                <td class="auto-style2"><input type="text" id="mGender" name="mGender" style="visibility:hidden;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style3"></td>
                <td class="auto-style2"><input type="submit" value="Submit" style="background-color:aliceblue;" /><input type="reset" value="Reset" style="background-color:aliceblue;" /></td>
            </tr>
        </table>
    </center>

</asp:Content>

