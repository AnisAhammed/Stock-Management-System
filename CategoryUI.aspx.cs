using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{
    public partial class Category : Page
    {
        CategoryManager aCategoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCategories();
            updateButton.Enabled = false;
        }

        private void GetCategories()
        {
            List<Categorys> aCategoryses = aCategoryManager.GetAllCategory();
            categoryGridView.DataSource = aCategoryses;
            categoryGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                Categorys aCategory = new Categorys();
                aCategory.CategoryName = nameTextBox.Text;

                Literal1.Text = aCategoryManager.Save(aCategory);
                nameTextBox.Text = "";

                GetCategories();
            }
            catch (Exception ex1)
            {
                Literal1.Text = ex1.Message;
            }
        }
        

        protected void categoryGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("ondblclick", "__doPostBack('categoryGridView','Select$" + e.Row.RowIndex + "');");
            }
        }
        protected void categoryGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sL = categoryGridView.SelectedDataKey.Value.ToString();
            string departmentName = categoryGridView.SelectedRow.Cells[2].Text;
            nameTextBox.Text = departmentName;
            sLHiddenField.Value = sL;
            saveButton.Enabled = false;
            updateButton.Enabled = true;
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            Categorys aCategorys = new Categorys();
            aCategorys.Sl = Convert.ToInt32(sLHiddenField.Value);
            aCategorys.CategoryName = nameTextBox.Text;

            string message = aCategoryManager.UpdateCategory(aCategorys);
            Literal1.Text = message;
            nameTextBox.Text = "";
            saveButton.Enabled = true;

            GetCategories();
        }

    }
}