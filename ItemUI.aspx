<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystem.Form.Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            width: 170px;
            height: 35px;
            text-align: left;
        }
        .auto-style3 {
        width: 369px;
    }
    .auto-style4 {
        width: 369px;
        height: 35px;
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
            <div class="col-sm-6" style="background-color: #ecf0f1;">
                <h2 style="text-align: center; background-color: #99CCFF;">Item Setup</h2>
                <br />

                <table align="center" class="table">
                    <tr>
                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category:</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="categoryDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" Height="22px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList>
                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Company:&nbsp;</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="companyDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" Height="22px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Item Name:&nbsp;</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="itemNameTextBox" runat="server" Width="180px" Height="22px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="itemNameTextBox" ErrorMessage="Please enter Item name" ForeColor="Red" Font-Size="10pt"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reorder level:&nbsp;</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="reorderLevelTextBox" runat="server" Width="180px" Height="22px">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="saveButton" runat="server" class="btn btn-primary" Text="Save" Width="98px" OnClick="saveButton_Click" Height="30px" />
                            &nbsp;<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3"><asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
                <br/>
            </div>
            <div class="col-sm-3">
            </div>
        </div>
    </div>
    <hr />
    <br />
</asp:Content>
