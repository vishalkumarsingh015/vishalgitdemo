using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_Charctor_List : System.Web.UI.Page
{
    SqlComan sql = new SqlComan();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                getemp();
                getdata();

            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }
    protected void getdata()
    {
        if (Label1.Text == "I.A.")
        {
            SqlDataAdapter ord = new SqlDataAdapter("select  * from Apply_Charctor where  status='Active' and Payment_status='paid' and Stream='I.A' order by id desc", con);
            DataTable dt = new DataTable();
            ord.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Data Available');", true);

            }

        }
        else if (Label1.Text == "I.SC.&P.G")
        {
            SqlDataAdapter ord = new SqlDataAdapter("select  * from Apply_Charctor where  status='Active' and Payment_status='paid' and (stream='I.SC' or Stream='M.A' or Stream='M.SC') order by id desc", con);
            DataTable dt = new DataTable();
            ord.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Data Available');", true);

            }

        }

        else if (Label1.Text == "B.SC")
        {


            SqlDataAdapter ord = new SqlDataAdapter("select  * from Apply_Charctor where  status='Active' and Payment_status='paid' and stream='B.SC'  order by id desc", con);
            DataTable dt = new DataTable();
            ord.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Data Available');", true);



            }


        }

        else if (Label1.Text == "B.A.&Vocational")
        {


            SqlDataAdapter ord = new SqlDataAdapter("select  * from Apply_Charctor where  status='Active' and Payment_status='paid' and( stream='Bio-Tech' or stream='BBA' or stream='BCA' or stream='B.A') order by id desc", con);
            DataTable dt = new DataTable();
            ord.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Data Available');", true);



            }


        }
    }
    protected void getemp()
    {
        try
        {
            SqlDataAdapter ord = new SqlDataAdapter("select * from employee inner join  department on employee.dept_id=department.dept_id where  employee.status='Active'  and department.status='Active' and emp_id='" + Request.Cookies["user_id"].Value + "'", con);
            DataTable dt = new DataTable();
            ord.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Label1.Text = dt.Rows[0]["dept_name"].ToString();

            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Data Available');", true);

            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
        }

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName.ToString() == "Edit")
        {
            Response.Redirect("CreateDepartment.aspx?id=" + EncrDyrc.Encryp(e.CommandArgument.ToString()));
        }
        else if (e.CommandName.ToString() == "Delete")
        {
            int i = sql.ExecuteSql("update Apply_Charctor set status='Deactive', updatedby='Admin', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where id='" + e.CommandArgument.ToString() + "'");


            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Deleted Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something Went Wrong!');", true);
            }
            getdata();
        }
    }

}