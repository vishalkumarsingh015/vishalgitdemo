using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_ApplyTcList : System.Web.UI.Page
{
    SqlComan sql = new SqlComan();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            getdata();
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }
      
    protected void getdata()
    {
        try
        {
            SqlDataAdapter ord = new SqlDataAdapter("select  * from Apply_tc where  status='Active' and payment='paid' order by id desc", con);
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
            int i = sql.ExecuteSql("update Apply_tc set status='Deactive', updatedby='Admin', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where id='" + e.CommandArgument.ToString() + "'");


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