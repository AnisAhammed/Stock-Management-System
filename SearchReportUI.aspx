<%@ Page Title="" Language="C#" MasterPageFile="~/Form/FormMasterSite.Master" AutoEventWireup="true" CodeBehind="SearchReportUI.aspx.cs" Inherits="StockManagementSystem.Form.SearchReport1" %>

<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <br />
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8" style="background-color: #ecf0f1;">
                <h2 style="text-align: center; background-color: #99CCFF;">-------Items Report------</h2>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer class="table" ID="ReportViewer1" runat="server" Height="407px" style="text-align: center" Width="540px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                    <LocalReport ReportPath="../Reports\Report1.rdlc" ReportEmbeddedResource="StockManagementSystem.Reports.Report1.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllItemsView" TypeName="StockManagementSystem.Gateway.ItemGateway, StockManagementSystem, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
            </div>
            <div class="col-sm-2">
            </div>
        </div>
    </div><br/><br/><br/>
</asp:Content>
