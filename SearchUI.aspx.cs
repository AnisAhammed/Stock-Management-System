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
    public partial class Searches : Page
    {
        Connection con = new Connection();
        SearchManager aSearchManager=new SearchManager();
        ItemManager aItemManager=new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Company", con.GetConnection());
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.GetClose();
                companyDropDownList.DataSource = dt;
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataValueField = "CompanyName";
                companyDropDownList.DataBind();
            }
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Category", con.GetConnection());
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.GetClose();
                categoryDropDownList.DataSource = dt;
                categoryDropDownList.DataTextField = "CategoryName";
                categoryDropDownList.DataValueField = "CategoryName";
                categoryDropDownList.DataBind();
            }

            List<ItemView> itemList = aItemManager.GetAllItemsView();
            searchGridView.DataSource = itemList;
            searchGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (companyDropDownList.SelectedValue != "--Select--" || categoryDropDownList.SelectedValue != "--Select--")
                {
                    string companyName = companyDropDownList.SelectedValue;
                    string categoryName = categoryDropDownList.SelectedValue;
                    List<ItemView> items = aSearchManager.GetCompanyCategorySearch(categoryName, companyName);
                    if (items != null)
                    {
                        searchGridView.DataSource = items;
                        searchGridView.DataBind();
                    }
                    //else
                    //{
                    //    Literal1.Text = "Product not Found";
                    //}
                }
                else if (companyDropDownList.SelectedValue != "--Select--")
                {
                    string companySl = companyDropDownList.SelectedValue;
                    List<Items> items = aSearchManager.GetCompanySearch(companySl);
                    if (items != null)
                    {
                        searchGridView.DataSource = items;
                        searchGridView.DataBind();
                    }
                    //else
                    //{
                    //    Literal1.Text = "Product not Found";
                    //}
                }
                else if (categoryDropDownList.SelectedValue != "--Select--")
                {
                    string categorySl = companyDropDownList.SelectedValue;
                    List<Items> items = aSearchManager.GetCategorySearch(categorySl);
                    if (items != null)
                    {
                        searchGridView.DataSource = items;
                        searchGridView.DataBind();
                    }
                    //else
                    //{
                    //    Literal1.Text = "Product not Found";
                    //}
                }
                //else
                //{
                //    Literal1.Text = "Product not Found";
                //}
            }
            catch (Exception ex1)
            {
                
                Literal1.Text=ex1.Message;
            }           
        }
    }
}