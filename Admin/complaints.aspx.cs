using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

public partial class Admin_complaints : System.Web.UI.Page
{

    SqlComan sql = new SqlComan();
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
        DataTable dt = sql.GetDataTable("select * from complaint");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();

    }

    public string chng(object a)
    {
        return CCommonDB.Decrypt(a.ToString());
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName.ToString() == "Edit")
        {
            //Response.Redirect("AddDepartment.aspx?id=" + EncrDyrc.Encryp(e.CommandArgument.ToString()));
        }
        else if (e.CommandName.ToString() == "Delete")
        {
            int i = sql.ExecuteSql("update complaint set status='Resolve', addedby='Admin', addeddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where ID='" + e.CommandArgument.ToString() + "'");
            //i = sql.ExecuteSql("update loginmaster set status='Deactive', modifiedby='Admin', modifieddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where student_id=(select student_id from complaint where id='" + e.CommandArgument.ToString() + "')");
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Resolve Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something Went Wrong!');", true);
            }
            getdata();
        }
    }

}