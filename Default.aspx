<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Nescot.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            hi
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="DateOfEnrolment" HeaderText="DateOfEnrolment" SortExpression="DateOfEnrolment" />
                <asp:CheckBoxField DataField="TuitionPaid" HeaderText="TuitionPaid" SortExpression="TuitionPaid" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT Classes.Level, Classes.Name, Enrolments.DateOfEnrolment, Enrolments.TuitionPaid, Students.FirstName, Students.SecondName FROM Classes INNER JOIN Enrolments ON Classes.ClassID = Enrolments.ClassID INNER JOIN Students ON Enrolments.StudentID = Students.StudentID"></asp:SqlDataSource>
    </form>
</body>
</html>
