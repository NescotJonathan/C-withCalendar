<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagementReports.aspx.cs" Inherits="Nescot.ManagementReports" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ClassID,EnrolmentID,Expr2" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="ClassID" HeaderText="ClassID" InsertVisible="False" ReadOnly="True" SortExpression="ClassID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="EnrolmentID" HeaderText="EnrolmentID" InsertVisible="False" ReadOnly="True" SortExpression="EnrolmentID" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                <asp:BoundField DataField="DateOfEnrolment" HeaderText="DateOfEnrolment" SortExpression="DateOfEnrolment" />
                <asp:CheckBoxField DataField="TuitionPaid" HeaderText="TuitionPaid" SortExpression="TuitionPaid" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" InsertVisible="False" ReadOnly="True" SortExpression="Expr2" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Class.ClassID, Class.Name, Class.Level, Enrolment.EnrolmentID, Enrolment.StudentID, Enrolment.ClassID AS Expr1, Enrolment.DateOfEnrolment, Enrolment.TuitionPaid, Student.StudentID AS Expr2, Student.FirstName, Student.SecondName, Student.DOB FROM Class INNER JOIN Enrolment ON Class.ClassID = Enrolment.ClassID INNER JOIN Student ON Enrolment.StudentID = Student.StudentID"></asp:SqlDataSource>
    </form>
</body>
</html>
