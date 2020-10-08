<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Vacation.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <table class="form-group" id="table1" runat="server">
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Employee Name: </label>
            </td>
            <td style="width: 506px">
                <asp:TextBox ID="txtName" runat="server" Class="form-control "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server"
                    ErrorMessage="Employee Name is required" ForeColor="Red"
                    ControlToValidate="txtName" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Title: </label>
            </td>
            <td style="width: 506px">
                <asp:TextBox ID="txtTitle" runat="server" Class="form-control">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server"
                    ErrorMessage="Title is required" ForeColor="Red"
                    ControlToValidate="txtTitle" Display="Dynamic ">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Department </label>
            </td>
            <td style="width: 506px">
                <asp:DropDownList ID="ddlDepartment" runat="server"
                    DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" Class="form-control">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VacationDBConnectionString2 %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepartment" runat="server"
                    ErrorMessage="Department is required" ForeColor="Red" InitialValue="-1"
                    ControlToValidate="ddlDepartment" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Vacation Date From: </label>
            </td>
            <td style="width: 506px">
                <asp:TextBox ID="txtDateFrom" runat="server" Class="form-control " Type="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateFrom" runat="server"
                    ErrorMessage="Vacation Date From is required" ForeColor="Red"
                    ControlToValidate="txtDateFrom" Display="Dynamic ">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidatorDateFrom"
                    runat="server" BackColor="White" BorderColor="Red"
                    Display="Dynamic" ErrorMessage="must be after today" ForeColor="Red"
                    Type="Date" ControlToValidate="txtDateFrom"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Vacation Date TO: </label>
            </td>
            <td style="width: 506px">
                <asp:TextBox ID="txtDateTO" runat="server" Class="form-control" Type="date">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateTO" runat="server"
                    ErrorMessage="Vacation Date TO is required" ForeColor="Red"
                    ControlToValidate="txtDateTO" Display="Dynamic ">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidatorDateTO" runat="server" Display="Dynamic"
                    ForeColor="Red" Type="Date"
                    ErrorMessage="must be after today" ControlToValidate="txtDateTO"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="col-md-6" style="width: 224px">
                <label class="control-label col-md-12 ">Notes: </label>
            </td>
            <td style="width: 506px">

                <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Class="form-control "></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" Class="btn btn-primary" OnClick="btnSubmit_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblStatus" runat="server" Font-Bold="true">
                </asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

