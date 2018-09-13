using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using StockManagementSystem.BLL;
using StockManagementSystem.Gateway;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{

    public partial class Item : Page
    {
        ItemManager aItemManager = new ItemManager();
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Categorys> categoryList = aCategoryManager.GetAllCategory();
                categoryDropDownList.DataSource = categoryList;
                categoryDropDownList.DataTextField = "CategoryName";
                categoryDropDownList.DataValueField = "SL";
                categoryDropDownList.DataBind();


                List<Companys> companyList = aCompanyManager.GetAllCompany();
                companyDropDownList.DataSource = companyList;
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "SL";
                companyDropDownList.DataBind();
            }
            
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                Items aItem = new Items();
                aItem.CategorySl = Convert.ToInt32(categoryDropDownList.SelectedValue);
                aItem.CompanySl = Convert.ToInt32(companyDropDownList.SelectedValue);
                aItem.ItemName = itemNameTextBox.Text;
                aItem.ReorderLevel = Convert.ToInt32(reorderLevelTextBox.Text);
                if (categoryDropDownList.SelectedIndex == 0)
                {
                    Literal1.Text = "<script>alert('Please select Category!!!');</script>";
                    return;
                }
                if (companyDropDownList.SelectedIndex == 0)
                {
                    Literal1.Text = "<script>alert('Please select Companys!!!');</script>";
                    return;
                }
                Literal1.Text = aItemManager.Save(aItem);
                categoryDropDownList.SelectedIndex = -1;
                companyDropDownList.SelectedIndex = -1;
                itemNameTextBox.Text = "";
                reorderLevelTextBox.Text = "0";
            }
            catch (Exception ex1)
            {
                Literal1.Text = ex1.Message;
            }
        }
    }
}