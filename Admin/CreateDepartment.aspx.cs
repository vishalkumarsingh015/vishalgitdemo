using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Branch_AddDepartment : System.Web.UI.Page
{
    string id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString.ToString().Length < 1)
            {
                update.Visible = false;
                if (!IsPostBack)
                {
                   
                }
            }
            else
            {
                id = EncrDyrc.Decryp(Request.QueryString["id"].ToString());
                save.Visible = false;
                if (!IsPostBack)
                {
                   
                }
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }

   

 

    protected string GenerateCode()
    {
        string number_value = "";
        try
        {


            SqlDataAdapter ord = new SqlDataAdapter("select max(id)+1 from department", con);
            DataTable dt1 = new DataTable();
            ord.Fill(dt1);

            if (dt1.Rows[0][0].ToString() != "")
            {
                int input_number = Convert.ToInt32(dt1.Rows[0][0].ToString());
                number_value = input_number.ToString("00000");
                number_value = "DEPT" + number_value;
            }
            else
            {
                int input_number = 1;
                number_value = input_number.ToString("00000");
                number_value = "DEPT" + number_value;
            }


        }
        catch (Exception ex)
        {

        }
        return number_value;
    }

    protected void save_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from department where dept_name='" + dept_name.Text + "' and status='Active'");
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops! This Department Name Is Already Exist.');", true);
            dept_name.Text = "";
          
        }
        else
        {
           
            
                string dept_id = GenerateCode();
                int i = sql.ExecuteSql("insert into department (dept_id,dept_name,addedby,addeddate,status) values ('" + dept_id + "','" + dept_name.Text + "','Admin','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Active')");
               
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Department Has Been Added.');", true);
                    dept_name.Text = "";
                    
                }
           
            
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from department where dept_name='" + dept_name.Text + "'  status='Active' and dept_id!=(select dept_id from department where id='" + id + "')");
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops! This Department Name Is Already Exist.');", true);
        }
        else
        {
            int i = sql.ExecuteSql("update department set dept_name='" + dept_name.Text + "', updatedby='Admin', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where id='" + id + "'");
            
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Updated.');window.location.href='ListDepartment.aspx'", true);
            }
        }
    }

 
}