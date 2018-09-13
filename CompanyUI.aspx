<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagementSystem.Form.Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 48px;
            width: 348px;
        }
        .auto-style2 {
            height: 48px;
            width: 102px;
        }
        .auto-style3 {
        }
        .auto-style6 {
            width: 102px;
            height: 9px;
        }
        .auto-style7 {
            width: 348px;
            height: 9px;
        }
        .auto-style8 {
            height: 39px;
            width: 102px;
        }
        .auto-style9 {
            height: 39px;
            width: 348px;
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
                <h2 style="text-align: center; background-color: #99CCFF;">Company Setup</h2>
                <br />
                <table align="center" class="table">
                    <tr>
                        <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="nameTextBox" runat="server" Width="205px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameTextBox" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8"></td>
                        <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="saveButton" runat="server" class="btn btn-primary" Text="Save" Width="99px" OnClick="saveButton_Click" Height="30px" />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6"></td>
                        <td class="auto-style7"><asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">
                <asp:GridView class="table" ID="companyGridView" runat="server" Width="373px" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="Name" SortExpression="CompanysName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
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
                </asp:GridView><br/>
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
