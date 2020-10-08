<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormManager.aspx.cs" Inherits="Vacation.WebFormManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Submission_Date" HeaderText="Submission Date" dataformatstring="{0:MMMM d, yyyy}" SortExpression="Submission_Date" />
            <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
            <asp:BoundField DataField="Date_From" HeaderText="From" dataformatstring="{0:MMMM d, yyyy}" SortExpression="Date_From" />
            <asp:BoundField DataField="Date_To" HeaderText="To" dataformatstring="{0:MMMM d, yyyy}" SortExpression="Date_To" />
            <asp:BoundField DataField="DepartmentofName" HeaderText="Department " SortExpression="DepartmentofName" />
            <asp:TemplateField HeaderText ="More Info">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VacationDBConnectionString2 %>" SelectCommand="spGrdManager" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <div id="viewVacationID"  runat="server">
    <h4>Vacation</h4>
    <hr />
    <dl class="dl-horizontal">
        <dt>
           Submission Date:
        </dt>
        <dd>
            <asp:Label ID="LblSubmission_Date" runat="server" Text="Label"></asp:Label>
        </dd>

        <dt>
           Employee Name:
        </dt>

        <dd>
           <asp:Label ID="LblEmployee_Name" runat="server" Text="Label"></asp:Label>
        </dd>

        <dt>
           Title:
        </dt>

        <dd>
           <asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Department:
        </dt>

        <dd>
           <asp:Label ID="LblDepartment" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Vacation Date From: 
        </dt>

        <dd>
           <asp:Label ID="LblDate_From" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Vacation Date To:
        </dt>

        <dd>
           <asp:Label ID="LblDate_To" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Returning: 
        </dt>

        <dd>
           <asp:Label ID="LblReturning" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Total Number of Days Requested: 
        </dt>

        <dd>
           <asp:Label ID="LblTotal_Number_of_Days_Requested" runat="server" Text="Label"></asp:Label>
        </dd>
        <dt>
          Notes:
        </dt>

        <dd>
           <asp:Label ID="LblNotes" runat="server" Text="Label"></asp:Label>
        </dd>
    </dl>
       <asp:Button ID="btnbacktogrid" runat="server" Text="Back to list" OnClick="btnbacktogrid_Click" />
</div>

     

</asp:Content>
