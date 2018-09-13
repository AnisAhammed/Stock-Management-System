using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{
    [Serializable]
    public partial class StockOut : System.Web.UI.Page
    {
        List<StockOuts> listStock = new List<StockOuts>();

        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockInManager aStockInManager = new StockInManager();
        StockOutManager aStockOutManager = new StockOutManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Companys> companyList = aCompanyManager.GetAllCompany();
                companyDropDownList.DataSource = companyList;
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "SL";
                companyDropDownList.DataBind();
                

                List<Items> itemList = aItemManager.GetAllItems();
                itemNameDropDownList.DataSource = itemList;
                itemNameDropDownList.DataTextField = "ItemName";
                itemNameDropDownList.DataValueField = "ItemNo";
                itemNameDropDownList.DataBind();
            }
            
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string companyName = companyDropDownList.SelectedIndex.ToString();
            List<Items> aItem = aStockOutManager.GetItemNames(companyName);
            if (aItem != null)
            {
                itemNameDropDownList.Items.Clear();
                itemNameDropDownList.DataSource = aItem;
                itemNameDropDownList.AppendDataBoundItems = true;
                itemNameDropDownList.Items.Add(new ListItem("--Select--"));
                itemNameDropDownList.DataTextField = "ItemName";
                itemNameDropDownList.DataValueField = "ItemNo";
                itemNameDropDownList.DataBind();
            }
            else
            {
                Literal1.Text = "Student not Found";
            }
        }

        protected void itemNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int itemNo = Convert.ToInt32(itemNameDropDownList.SelectedValue);

            reorderLevelTextBox.Text = aStockInManager.GetReOrderLevel(itemNo).ToString();
            availableQuantityTextBox.Text = aStockInManager.GetAvailableQuantity(itemNo).ToString();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                StockOuts aStockOuts = new StockOuts();
                aStockOuts.CompanySl = Convert.ToInt32(companyDropDownList.SelectedValue);
                aStockOuts.CompanyName = companyDropDownList.SelectedItem.Text;
                aStockOuts.ItemNo = Convert.ToInt32(itemNameDropDownList.SelectedValue);
                aStockOuts.ItemName = itemNameDropDownList.SelectedItem.Text;
                aStockOuts.ReorderLevel = Convert.ToInt32(reorderLevelTextBox.Text);
                aStockOuts.AvailableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);
                aStockOuts.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
                aStockOuts.Date = DateTime.Now.ToString("MM/dd/yyyy");
                
                if (ViewState["stock"] != null)
                {
                    listStock = (List<StockOuts>)ViewState["stock"];
                }
                listStock.Add(aStockOuts);
                ViewState["stock"] = listStock;

                Literal1.Text = aStockOutManager.Save(aStockOuts);
                companyDropDownList.SelectedIndex = -1;
                itemNameDropDownList.SelectedIndex = -1;
                reorderLevelTextBox.Text = "";
                availableQuantityTextBox.Text = "";
                stockOutQuantityTextBox.Text = "";

                stockOutGridView.DataSource = ViewState["stock"];
                stockOutGridView.DataBind();

            }
            catch (Exception ex1)
            {
                Literal1.Text = ex1.Message;
            }
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            List<StockOuts> listStocks = (List<StockOuts>)ViewState["stock"];
            foreach (StockOuts row in listStocks)
            {
                Literal1.Text = aStockOutManager.Save1(row);

                GetGridviewClear();
                ViewState["stock"] = null;
            }
        }

        private void GetGridviewClear()
        {
            stockOutGridView.DataSource = "";
            stockOutGridView.DataBind();
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<StockOuts> listStocks = (List<StockOuts>)ViewState["stock"];
            foreach (StockOuts row in listStocks)
            {
                Literal1.Text = aStockOutManager.Save2(row);
                GetGridviewClear();
                ViewState["stock"] = null;
            }
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<StockOuts> listStocks = (List<StockOuts>)ViewState["stock"];
            foreach (StockOuts row in listStocks)
            {
                Literal1.Text = aStockOutManager.Save3(row);
                GetGridviewClear();
                ViewState["stock"] = null;
            }
        }

    }
}