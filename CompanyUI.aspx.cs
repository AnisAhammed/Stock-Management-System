using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using StockManagementSystem.BLL;
using StockManagementSystem.Model;

namespace StockManagementSystem.Form
{
    public partial class Company : Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Companys> aCompanies = aCompanyManager.GetAllCompany();
            companyGridView.DataSource = aCompanies;
            companyGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                Companys aCompanys = new Companys();
                aCompanys.CompanyName = nameTextBox.Text;

                Literal1.Text = aCompanyManager.Save(aCompanys);

                nameTextBox.Text = "";

                List<Companys> aCompanies = aCompanyManager.GetAllCompany();
                companyGridView.DataSource = aCompanies;
                companyGridView.DataBind();
            }
            catch (Exception ex1)
            {
                Literal1.Text = ex1.Message;
            }
        }

    }
}