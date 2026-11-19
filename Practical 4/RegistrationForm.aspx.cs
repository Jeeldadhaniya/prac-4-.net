using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical_4
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void calDate_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void txtStudentName_TextChanged(object sender, EventArgs e)
        {
        }

        protected void CuValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rbMale.Checked || rbFemale.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CuValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Paper_Presentation.Checked || Poster_Presentation.Checked || Coding_Mania.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string gender = "";

            if (rbMale.Checked)
            {
                gender = "Male";
            }
            else if (rbFemale.Checked)
            {
                gender = "Female";
            }

            string events = "";

            if (Paper_Presentation.Checked)
            {
                events += "Paper Presentation, ";
            }

            if (Poster_Presentation.Checked)
            {
                events += "Poster Presentation, ";
            }

            if (Coding_Mania.Checked)
            {
                events += "Coding Mania, ";
            }

            if (events.EndsWith(", "))
            {
                events = events.Substring(0, events.Length - 2);
            }

            string selectedDate = "";

            if (calDate.SelectedDate != DateTime.MinValue)
            {
                selectedDate = calDate.SelectedDate.ToString("dd-MM-yyyy");
            }
            else
            {
                selectedDate = "Not Selected";
            }

            lblOutput.Text = "<h2>Student Registration Details</h2>" +
            "<hr/>" +
            "<b>Student Name :</b> " + txtStudentName.Text + "<br/><br/>" +
            "<b>GR No :</b> " + txtGrNo.Text + "<br/><br/>" +
            "<b>Email ID :</b> " + txtEmailId.Text + "<br/><br/>" +
            "<b>Mobile No :</b> " + txtMobileNo.Text + "<br/><br/>" +
            "<b>Gender :</b> " + gender + "<br/><br/>" +
            "<b>Branch :</b> " + DropDownList1.SelectedItem.Text + "<br/><br/>" +
            "<b>Event :</b> " + events + "<br/><br/>" +
            "<b>Date :</b> " + selectedDate;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtStudentName.Text = "";
            txtGrNo.Text = "";
            txtEmailId.Text = "";
            txtMobileNo.Text = "";
            txtAge.Text = "";
            txtPassword.Text = "";
            txtConfirmPass.Text = "";

            rbMale.Checked = false;
            rbFemale.Checked = false;

            DropDownList1.SelectedIndex = 0;

            Paper_Presentation.Checked = false;
            Poster_Presentation.Checked = false;
            Coding_Mania.Checked = false;

            calDate.SelectedDates.Clear();

            lblOutput.Text = "";

            RFValidator.IsValid = true;
            REValidator1.IsValid = true;
            RValidator1.IsValid = true;
            CValidator1.IsValid = true;
            CuValidator1.IsValid = true;
            CuValidator2.IsValid = true;
        }
    }
}