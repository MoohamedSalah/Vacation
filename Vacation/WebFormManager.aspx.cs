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
    public partial class WebFormManager : System.Web.UI.Page
    {
        private VacationConstring db = new VacationConstring();
        protected void Page_Load(object sender, EventArgs e)
        {
           viewVacationID.Visible = false ;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
           

            GridView1.Visible = false;
            viewVacationID.Visible = true;

            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Vacations vacation = db.Vacation.Find(ID);


            LblSubmission_Date.Text = vacation.Submission_Date.ToString("dddd, dd MMMM yyyy");
            LblEmployee_Name.Text = vacation.Employee_Name;
            LblTitle.Text = vacation.Title;
            LblDepartment.Text = vacation.Department.Name;
            LblDate_From.Text = vacation.Date_From.ToString("dddd, dd MMMM yyyy");
            LblDate_To.Text = vacation.Date_To.ToString("dddd, dd MMMM yyyy");
            LblReturning.Text = vacation.Returning.ToString("dddd, dd MMMM yyyy");
            LblNotes.Text = vacation.Notes;
            LblTotal_Number_of_Days_Requested.Text = (vacation.Date_To - vacation.Date_From ).TotalDays.ToString();


        }

        protected void btnbacktogrid_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true ;
            viewVacationID.Visible = false ;
        }
    }
}