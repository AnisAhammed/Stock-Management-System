<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystem.Form.Category" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }

        .auto-style7 {
            text-align: left;
            height: 20px;
            width: 116px;
        }

        .auto-style8 {
            height: 20px;
            width: 383px;
        }
        .auto-style9 {
            text-align: left;
            height: 45px;
            width: 383px;
        }      
        .auto-style10 {
            width: 383px;
        }
        .auto-style11 {
            width: 116px;
            height: 45px;
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
                <h2 style="text-align: center; background-color: #99CCFF;">Category Setup</h2>
                <br />

                <table align="center" class="table">
                    <tr>
                        <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:</td>
                        <td class="auto-style9">
                            <asp:TextBox ID="nameTextBox" runat="server" Width="205px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameTextBox" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="saveButton" runat="server" class="btn btn-primary" Text="Save" Width="90px" OnClick="saveButton_Click" Height="30px" />
                            &nbsp;&nbsp;
                            <asp:Button ID="updateButton" runat="server" class="btn btn-primary" Text="Update" Height="30px" OnClick="updateButton_Click" Width="90px" />
                            <br />
                        </td>
                    </tr>                  
                    <tr>
                        <td class="auto-style7"></td>
                        <td class="auto-style8">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <br />
                        </td>
                    </tr>                                                      
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:GridView ID="categoryGridView" class="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SL" ForeColor="#333333" Width="400px" OnRowDataBound="categoryGridView_RowDataBound" OnSelectedIndexChanged="categoryGridView_SelectedIndexChanged" GridLines="None" HorizontalAlign="Center" ShowHeaderWhenEmpty="True">
                                <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>                             
                                <asp:BoundField DataField="SL" HeaderText="SL" InsertVisible="False" ReadOnly="True" SortExpression="SL" Visible="False"/>
                                <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:CommandField SelectText="Edit" ShowSelectButton="true" InsertVisible="False" ButtonType="Button">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:CommandField>
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
                        </asp:GridView><br />                   
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-sm-3">
                <asp:HiddenField ID="sLHiddenField" runat="server" />
            </div>
        </div>
    </div>
    <hr />
    <br />
</asp:Content>
