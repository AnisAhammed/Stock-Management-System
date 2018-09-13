<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystem.Form.StockOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style4 {
            width: 146px;
            text-align: right;
            height: 39px;
        }

        .auto-style5 {
            height: 39px;
            width: 218px;
        }

        .auto-style6 {
            width: 146px;
            text-align: right;
            height: 38px;
        }

        .auto-style7 {
            height: 38px;
            width: 218px;
        }

        .auto-style8 {
            width: 146px;
            text-align: right;
            height: 40px;
        }

        .auto-style9 {
            height: 40px;
            width: 218px;
        }

        .auto-style10 {
            text-align: left;
            height: 44px;
        }

        .auto-style11 {
            height: 44px;
            width: 218px;
            text-align: left;
        }
        .auto-style12 {
            width: 57px;
            text-align: left;
            height: 39px;
        }
        .auto-style13 {
            width: 57px;
            text-align: left;
            height: 38px;
        }
        .auto-style14 {
            width: 57px;
            text-align: left;
            height: 40px;
        }
        .auto-style15 {
            text-align: left;
            height: 44px;
            width: 57px;
        }
        .auto-style16 {
            text-align: left;
            width: 57px;
        }
        .auto-style17 {
            text-align: left;
            height: 44px;
            width: 146px;
        }
        .auto-style18 {
            height: 39px;
            width: 52px;
        }
        .auto-style19 {
            height: 38px;
            width: 52px;
        }
        .auto-style20 {
            height: 40px;
            width: 52px;
        }
        .auto-style21 {
            height: 44px;
            width: 52px;
        }
        .auto-style22 {
            text-align: left;
            width: 52px;
        }
        .auto-style24 {
            text-align: left;
            height: 20px;
            width: 146px;
        }
        .auto-style25 {
            height: 20px;
            width: 218px;
            text-align: left;
        }
        .auto-style26 {
            width: 57px;
            text-align: left;
            height: 20px;
        }
        .auto-style27 {
            height: 20px;
            width: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container">
        <div class="row">
            <br />
            <div class="col-sm-3">
            </div>
            <div class="col-sm-6" style="background-color: #ecf0f1;">
                <h2 style="text-align: center; background-color: #99CCFF;">Stock Out</h2>

                <table align="center" class="table">
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style4">CompanyName:&nbsp;&nbsp; </td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="companyDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style18">
                            &nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                        <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ItemName:&nbsp; &nbsp;</td>
                        <td class="auto-style7">
                            <asp:DropDownList ID="itemNameDropDownList" runat="server" AppendDataBoundItems="True" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="itemNameDropDownList_SelectedIndexChanged">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            &nbsp;</td>
                        <td class="auto-style19">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reorder level:&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td class="auto-style9">
                            <asp:TextBox ID="reorderLevelTextBox" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style20">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style8">&nbsp;&nbsp;Available Quantity:&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td class="auto-style9">
                            <asp:TextBox ID="availableQuantityTextBox" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style20">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                        <td class="auto-style6">&nbsp;Stock Out Quantity:&nbsp; &nbsp;</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="stockOutQuantityTextBox" runat="server" Width="180px"></asp:TextBox><br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="availableQuantityTextBox" ControlToValidate="stockOutQuantityTextBox" ErrorMessage="Item Not Available" Font-Size="12px" ForeColor="Red" Operator="LessThanEqual"></asp:CompareValidator>                      
                            &nbsp;</td>
                        <td class="auto-style19">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style15">
                            &nbsp;</td>
                        <td class="auto-style17">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                        <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="saveButton" class="btn btn-primary" runat="server" Text="Add" Width="100px" OnClick="saveButton_Click" Font-Bold="True" Font-Size="15px" Height="30px" />
                            &nbsp;<br />
                        </td>
                        <td class="auto-style21">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10" colspan="4">
                            <asp:GridView ID="stockOutGridView" class="table" runat="server" Width="523px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company" SortExpression="CompanyName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item" SortExpression="ItemName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity" SortExpression="StockOutQuantity">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StockOutQuantity") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("StockOutQuantity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="text-left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="sellButton" runat="server" class="btn btn-primary" Text="Sell" Width="100px" OnClick="sellButton_Click" Font-Bold="True" Font-Size="15px" Height="30px" />
                            &nbsp;&nbsp;
                            &nbsp;<asp:Button ID="damageButton" runat="server" class="btn btn-primary" Text="Damage" Width="100px" OnClick="damageButton_Click" Font-Bold="True" Font-Size="15px" Height="30px" />
                            &nbsp;&nbsp;
                            &nbsp;<asp:Button ID="lostButton" runat="server" class="btn btn-primary" Text="Lost" Width="100px" OnClick="lostButton_Click" Font-Bold="True" Font-Size="15px" Height="30px" />
                            <br />
                            <br />
                        </td>
                        <td class="auto-style22">&nbsp;</td>
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
