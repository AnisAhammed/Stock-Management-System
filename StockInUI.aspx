<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystem.Form.StockIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 184px;
            text-align: left;
        }
        .auto-style3 {
            width: 284px;
        }
        .auto-style20 {
            width: 184px;
            text-align: left;
            height: 42px;
        }
        .auto-style21 {
            width: 284px;
            height: 42px;
        }
        .auto-style22 {
            width: 184px;
            text-align: left;
            height: 41px;
        }
        .auto-style23 {
            width: 284px;
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <br />
            <div class="col-sm-3">
            </div>
            <div class="col-sm-6" style="background-color: #ecf0f1; height: 365px;">
                <h2 style="text-align: center; background-color: #99CCFF;">Stock In </h2>
                <br />
                <table align="center" class="table">
                    <tr>
                        <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CompanyName:</td>
                        <td class="auto-style21">
                            <asp:DropDownList ID="companyDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;ItemName:&nbsp;</td>
                        <td class="auto-style23">
                            <asp:DropDownList ID="itemNameDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="itemNameDropDownList_SelectedIndexChanged">
                                <asp:ListItem Value="--Select--">--Select--</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reorder level:&nbsp;</td>
                        <td class="auto-style21">
                            <asp:TextBox ID="reorderLevelTextBox" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Available Quantity:</td>
                        <td class="auto-style21">
                            <asp:TextBox ID="availableQuantityTextBox" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stock In Quantity:&nbsp;</td>
                        <td class="auto-style23">
                            <asp:TextBox ID="StockInQuantityTextBox" runat="server" Width="180px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StockInQuantityTextBox" ErrorMessage="Enter StockInQuantity" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="saveButton" runat="server" class="btn btn-primary" Text="Save" Width="97px" OnClick="saveButton_Click" Font-Size="15px" Height="30px" />
                            &nbsp;<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style3">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="col-sm-3">
            </div>
        </div>
    </div>
    <hr />
    <br />
</asp:Content>
