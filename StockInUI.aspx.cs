using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Gateway;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{
    public partial class StockIn : Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockInManager aStockInManager = new StockInManager();
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
            itemNameDropDownList.Items.Clear();
            string companyName = companyDropDownList.SelectedIndex.ToString();
            List<Items> aItem = aStockInManager.GetItemNames(companyName);
            if (aItem != null)
            {
                itemNameDropDownList.DataSource = aItem;
                itemNameDropDownList.AppendDataBoundItems = true;
                itemNameDropDownList.Items.Add(new ListItem("--Select--"));
                itemNameDropDownList.DataTextField = "ItemName";
                itemNameDropDownList.DataValueField = "ItemNo";
                itemNameDropDownList.DataBind();
            }
            else
            {
                Literal1.Text = "Item not Found";
            }
        }

        protected void itemNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {                    
            int itemNo = Convert.ToInt32(itemNameDropDownList.SelectedValue);

            reorderLevelTextBox.Text = aStockInManager.GetReOrderLevel(itemNo).ToString();
            availableQuantityTextBox.Text = (aStockInManager.GetAvailableQuantity(itemNo)).ToString();       
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                StockIns aStockIn = new StockIns();
                aStockIn.CompanySl = Convert.ToInt32(companyDropDownList.SelectedValue);
                aStockIn.ItemNo = Convert.ToInt32(itemNameDropDownList.SelectedValue);                
                aStockIn.StockInQuantity = Convert.ToInt32(StockInQuantityTextBox.Text);
                if (companyDropDownList.SelectedIndex == 0)
                {
                    Literal1.Text = "<script>alert('Please select Company!!!');</script>";
                    return;
                }
                if (itemNameDropDownList.SelectedIndex == 0)
                {
                    Literal1.Text = "<script>alert('Please select Item!!!');</script>";
                    return;
                }

                Literal1.Text = aStockInManager.Save(aStockIn);

                companyDropDownList.SelectedIndex = -1;
                itemNameDropDownList.SelectedIndex = -1;
                reorderLevelTextBox.Text = "";
                availableQuantityTextBox.Text = "";
                StockInQuantityTextBox.Text = "";
            }
            catch (Exception ex1)
            {

                Literal1.Text = ex1.Message;
            }
        }
        
    }
}