using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Nescot
{
    public partial class Student1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdSelectedStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            PhoenixEntities db = new PhoenixEntities();
            var students = db.Students.Find(grdSelectedStudent.SelectedValue);
            txtStudentName.Text = students.FirstName;
            txtStudentSecondName.Text = students.SecondName;

            DateTime dt = ((DateTime)students.DOB);
            
            string dateString = String.Format("{0:yyyy/MM/dd}", dt);
            txtDate.Text = dateString;
            
            Calendar1.VisibleDate = dt;
            Calendar1.SelectedDate = dt;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dt = Calendar1.SelectedDate;

            string dateString = String.Format("{0:yyyy/MM/dd}", dt);
            txtDate.Text = dateString;

        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            PhoenixEntities db = new PhoenixEntities();
            var students = db.Students.Find(grdSelectedStudent.SelectedValue);
            students.FirstName = txtStudentName.Text;
            students.SecondName = txtStudentSecondName.Text;

            DateTime dt = Calendar1.SelectedDate;

            string dateString = String.Format("{0:yyyy/MM/dd}", dt);
            txtDate.Text = dateString;

            students.DOB = DateTime.Parse(txtDate.Text);

            db.SaveChanges();
            grdSelectedStudent.DataBind();
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            PhoenixEntities db = new PhoenixEntities();
            var students = new Student();
            students.FirstName = txtStudentName.Text;
            students.SecondName = txtStudentSecondName.Text;

            DateTime dt = Calendar1.SelectedDate;

            string dateString = String.Format("{0:yyyy/MM/dd}", dt);
            txtDate.Text = dateString;

            students.DOB = DateTime.Parse(txtDate.Text);

            db.Students.Add(students);

            db.SaveChanges();
            grdSelectedStudent.DataBind();
        }

        protected void btnDeleteStudent_Click(object sender, EventArgs e)
        {
            PhoenixEntities db = new PhoenixEntities();
            var students = db.Students.Find(grdSelectedStudent.SelectedValue);
            db.Entry(students).State = System.Data.EntityState.Deleted;
            //db.Entry(students).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            grdSelectedStudent.DataBind();
        }
    }
}