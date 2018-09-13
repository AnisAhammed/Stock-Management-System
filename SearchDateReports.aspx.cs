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
    public partial class SearchDateReports : System.Web.UI.Page
    {
        Connection con = new Connection();

        SearchDateManager aSearchDateManager = new SearchDateManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<SearchDates> searchList = aSearchDateManager.GetAllSales();

                //create datasource
                ReportDataSource rdc = new ReportDataSource("DataSet1", searchList);

                //report viewer from tools
                ReportViewer2.LocalReport.DataSources.Clear();
                ReportViewer2.LocalReport.DataSources.Add(rdc);
                ReportViewer2.LocalReport.ReportPath = Server.MapPath("../Reports/") + "Report2.rdlc";
                ReportViewer2.SizeToReportContent = true;
            }
        }
    }
}