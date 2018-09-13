using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using StockManagementSystem.BLL;
using StockManagementSystem.Gateway;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{
    public partial class SearchReport1 : System.Web.UI.Page
    {
        Connection con = new Connection();
        SearchManager aSearchManager = new SearchManager();
        ItemManager aItemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ItemView> searchList = aItemManager.GetAllItemsView();

                //create datasource
                ReportDataSource rdc = new ReportDataSource("DataSet1", searchList);

                //report viewer from tools
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rdc);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("../Reports/") + "Report1.rdlc";
                ReportViewer1.SizeToReportContent = true;
            }
        }
    }
}