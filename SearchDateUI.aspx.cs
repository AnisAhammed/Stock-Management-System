using System;
using System.Collections.Generic;
using System.Web.UI;
using StockManagementSystem.BLL;

namespace StockManagementSystem.Form
{
    public partial class SearchDate : Page
    {
        SearchDateManager aSearchDateManager=new SearchDateManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Model.SearchDates> dateList = aSearchDateManager.GetAllSales();
            searchDateGridView.DataSource = dateList;
            searchDateGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            try
            {
                string fromDate = fromDateTextBox.Text;
                string toDate = toDateTextBox.Text;
                List<Model.SearchDates> resultLists = aSearchDateManager.GetSalesReport(fromDate, toDate);
                if (resultLists != null)
                {
                    searchDateGridView.DataSource = resultLists;
                    searchDateGridView.DataBind();
                }
                else
                {
                    Literal1.Text = "Item not Found";
                }
            }
            catch (Exception ex1)
            {

                Literal1.Text = ex1.Message;
            }
        }
    }
}