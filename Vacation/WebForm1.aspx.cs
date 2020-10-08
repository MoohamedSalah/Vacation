using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vacation.model;
using System.Data;
using System.Data.Entity;
using Microsoft.Ajax.Utilities;

namespace Vacation
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private VacationConstring db = new VacationConstring();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                RangeValidatorDateFrom.MinimumValue = DateTime.Now.ToShortDateString();
                RangeValidatorDateFrom.MaximumValue = DateTime.Now.AddYears(20).ToShortDateString();

                RangeValidatorDateTO .MinimumValue = DateTime.Now.ToShortDateString();
                RangeValidatorDateTO.MaximumValue = DateTime.Now.AddYears(20).ToShortDateString();

            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            DateTime Returning = DateTime.Now;

            switch (Convert.ToDateTime(txtDateTO.Text).ToString("dddd"))
            {
                case "Friday":
                    Returning = Convert.ToDateTime(txtDateTO.Text).AddDays(2);
                    break;
                case "Saturday":
                    Returning = Convert.ToDateTime(txtDateTO.Text).AddDays(1);
                    break;
                default:
                    Returning = Convert.ToDateTime(txtDateTO.Text);
                    break;

            };

            Vacations vacations = new Vacations
            {
                Title = txtTitle.Text,
                Employee_Name = txtName.Text,
                Department_id = (ddlDepartment.SelectedValue == "" ? 0 : Convert.ToInt32(ddlDepartment.SelectedValue)),
                Date_From = Convert.ToDateTime(txtDateFrom.Text),
                Date_To = Convert.ToDateTime(txtDateTO.Text),
                Notes = txtNotes.Text,
                Submission_Date = DateTime.Now,
                Returning = Returning

            };
          
            if (Page.IsValid&& Convert.ToDateTime(txtDateFrom.Text) < Convert.ToDateTime(txtDateTO.Text))
            {
                db.Vacation.Add(vacations);
                db.SaveChanges();

                txtDateTO.Text = "";
                txtName.Text = "";
                txtNotes.Text = "";
                txtTitle.Text = "";
                txtDateFrom.Text = "";

                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Your Vacation is Received successfully";
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "date to must be lower than date from, not saved!";
            }


        }
    }
}