<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="SearchDateUI.aspx.cs" Inherits="StockManagementSystem.Form.SearchDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   
    <link href="../MyStyle.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.4.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

<script src="../Scripts/jquery-1.12.4.js"></script>
<script src="../Scripts/jquery-ui-1.12.1.js"></script>

 
    <script>
        $(function () {
            var dateFormat = "mm/dd/yy",
              from = $("#ContentPlaceHolder1_fromDateTextBox")
                .datepicker({
                    maxDate: "0",
                    defaultDate: "+0w",
                    changeMonth: true,
                    numberOfMonths: 1
                })
                .on("change", function () {
                    to.datepicker("option", "minDate", getDate(this));
                }),
              to = $("#ContentPlaceHolder1_toDateTextBox").datepicker({
                  defaultDate: "+0w",
                  changeMonth: true,
                  numberOfMonths: 1
              })
              .on("change", function () {
                  from.datepicker("option", "maxDate", getDate(this));
              });

            function getDate(element) {
                var date;
                try {
                    date = $.datepicker.parseDate(dateFormat, element.value);
                } catch (error) {
                    date = null;
                }

                return date;
            }
        });
  </script>
    

    <script>
        $(function () {
            $("#ContentPlaceHolder1_fromDateTextBox").datepicker();
        });
    </script>
    <script>
        $(function () {
            $("#ContentPlaceHolder1_toDateTextBox").datepicker();
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style3 {
            width: 116px;
            text-align: left;
            height: 50px;
        }

        .auto-style6 {
            width: 116px;
            text-align: left;
            height: 33px;
        }

        .auto-style7 {
            height: 33px;
        }

        .auto-style8 {
            height: 50px;
        }

        .auto-style9 {
            width: 116px;
            text-align: left;
            height: 27px;
        }

        .auto-style10 {
            height: 27px;
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
            <div class="col-sm-6" style="background-color: #ecf0f1; height: 417px;">
                <h2 style="text-align: center; background-color: #99CCFF;">Search By Date</h2>
                <br />
                <table align="center" class="table">
                    <tr>
                        <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Date:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="fromDateTextBox" runat="server" Width="180px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Date:&nbsp;</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="toDateTextBox" runat="server" Width="180px"></asp:TextBox>
                            &nbsp;
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9"></td>
                        <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:Button ID="searchButton" runat="server" class="btn btn-primary" Text="Search" Width="100px" Height="30px" OnClick="searchButton_Click" />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style10"><asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:GridView ID="searchDateGridView" class="table" runat="server" Width="362px" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                    <asp:BoundField DataField="SalesQuantity" HeaderText="Sales Quantity" SortExpression="SalesQuantity" />
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
