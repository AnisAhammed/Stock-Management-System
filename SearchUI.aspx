<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="SearchUI.aspx.cs" Inherits="StockManagementSystem.Form.Searches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style3 {
            width: 172px;
            text-align: left;
        }

        .auto-style4 {
            width: 172px;
            text-align: left;
            height: 47px;
        }

        .auto-style5 {
            height: 47px;
            width: 249px;
        }

        .auto-style6 {
            width: 172px;
            text-align: left;
            height: 48px;
        }

        .auto-style7 {
            height: 48px;
            width: 249px;
        }

        .auto-style8 {
            width: 249px;
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
                <h2 style="text-align: center; background-color: #99CCFF;">Search</h2>

                <table align="center" class="table">
                    <tr>
                        <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CompanyName:</td>
                        <td class="auto-style7">
                            <asp:DropDownList ID="companyDropDownList" runat="server" AppendDataBoundItems="True" Width="180px">
                                <asp:ListItem Value="--Select--">--Select--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CategoryName:</td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="categoryDropDownList" runat="server" AppendDataBoundItems="True" Width="180px">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                        <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="searchButton" runat="server" class="btn btn-primary" Text="Search" Width="100px" OnClick="searchButton_Click" Font-Size="15px" Height="30px" />
                            &nbsp;<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:GridView ID="searchGridView" class="table" runat="server" Width="565px" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ItemNo" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ItemName" HeaderText="Item" SortExpression="ItemName" />
                                    <asp:BoundField DataField="CompanyName" HeaderText="Company" SortExpression="CompanyName" />
                                    <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                                    <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
                                    <asp:BoundField DataField="StockInQuantity" HeaderText="Available Quantity" SortExpression="StockInQuantity" />
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
                            </asp:GridView><br /><br />
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
