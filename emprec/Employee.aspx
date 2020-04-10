<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="emprec.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title>EMP RECORDS</title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    
</head>
    <body>
    <form id="form1" runat="server">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"/>--%>
    <div>
            
        <table style="width:100%;">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                </td>
                <td class="auto-style2">
                    <input type="text" id="txtFullName"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                </td>
                <td class="auto-style2">
                    <input type="text" id="txtGender"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="Salary"></asp:Label>
                </td>
                <td class="auto-style2">
                    <input type="text" id="txtSalary"/>
                </td>
                
            </tr>
            <tr> 
                <td class="auto-style4"></td>
                <td class="auto-style5">
                    <!--button-->
                   <input type="button" id="btnAddEmployee" value="Submit"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script type="text/javascript" language="javascript">
        <%--var pageURL = '<%=ResolveUrl("~/Employee.aspx")%>'--%>
        $(document).ready(function () {
            var methodUrl = "Employee.aspx/InsertEmployeeDetails";
        $('#btnAddEmployee').click(function (){
            var employeeName = $('#txtFullName').val();
            var employeeGender = $('#txtGender').val();
            var employeeSalary = $('#txtSalary').val(); 

            if (employeeName == "")
            {
                alert('Please Fill Category Name !!!');
                return false;
            }
            if (employeeGender == "")
            {
                alert('Please Fill Category Gender !!!');
                return false;
            }

            if (employeeSalary == "")
            {
                alert('Please Fill Category Salary !!!');
                return false;
            }

            var data = { name: employeeName, gender: employeeGender, salary: employeeSalary };
            var stringData = JSON.stringify(data);
            $.ajax({
                type: "POST",
                url: methodUrl,
                data: stringData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSucces,
                error: OnError
            });

            function OnSucces(response) {    
                if (response.d == "1") {   
                    alert(response.d); 
                    alert('Category Added Successfully !!!');    
                    //reset();    
                }    
                else {    
                    alert(response.d);   
                    alert('Category Not Added !!!');  
                }    
            }    
            function OnError(response) {    
                // alert('Error while Saving !!!');    
                alert(response.d);    

            }
        });
    });
</script>
</body>

</html>
