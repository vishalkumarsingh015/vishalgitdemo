using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Branch_ListEmployee : System.Web.UI.Page
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
            SqlDataAdapter ord = new SqlDataAdapter("select * from employee inner join department on employee.dept_id=department.dept_id inner join Loginmaster on  Loginmaster.user_id=employee.emp_id   where employee.status='Active' and department.status='Active'and Loginmaster.status='Active'", con);
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

    public string chng(object a)
    {
        return CCommonDB.Decrypt(a.ToString());
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName.ToString() == "Edit")
        {
            Response.Redirect("AddDepartment.aspx?id=" + EncrDyrc.Encryp(e.CommandArgument.ToString()));
        }
        else if (e.CommandName.ToString() == "Delete")
        {
            int i = sql.ExecuteSql("update employee set status='Deactive', updatedby='Admin', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where id='" + e.CommandArgument.ToString() + "'");
            i = sql.ExecuteSql("update loginmaster set status='Deactive', modifiedby='Admin', modifieddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where user_id=(select emp_id from employee where id='" + e.CommandArgument.ToString() + "')");
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


    //    protected void Repeater1_OnItemDataBound(object source, RepeaterItemEventArgs e)
    //    {
    //        Label assign_roles = e.Item.FindControl("assign_roles") as Label;
    //        Label expertise_in = e.Item.FindControl("expertise_in") as Label;
    //        Label granted_leave_type = e.Item.FindControl("granted_leave_type") as Label;
    //        Label emp_id = e.Item.FindControl("emp_id") as Label;

    //        DataTable dt = sql.GetDataTable("select * from emp_role inner join default_role on emp_role.role_id=default_role.id where emp_role.emp_id='" + emp_id.Text + "' and emp_role.status='Active' and default_role.status='Active'");
    //        if (dt.Rows.Count > 0)
    //        {
    //            for (int i = 0; i < dt.Rows.Count; i++)
    //            {
    //                if (i == 0)
    //                    assign_roles.Text = dt.Rows[i]["role_name"].ToString();
    //                else
    //                    assign_roles.Text = assign_roles.Text + ", " + dt.Rows[i]["role_name"].ToString();
    //            }
    //        }

    //        DataTable dt1 = sql.GetDataTable("select * from emp_leave inner join leave on emp_leave.leave_id=leave.id where emp_leave.emp_id='" + emp_id.Text + "' and emp_leave.status='Active' and leave.status='Active'");
    //        if (dt1.Rows.Count > 0)
    //        {
    //            for (int i = 0; i < dt1.Rows.Count; i++)
    //            {
    //                if (i == 0)
    //                    granted_leave_type.Text = dt1.Rows[i]["leave_type"].ToString();
    //                else
    //                    granted_leave_type.Text = granted_leave_type.Text + ", " + dt1.Rows[i]["leave_type"].ToString();
    //            }
    //        }

    //        DataTable dt2 = sql.GetDataTable("select * from emp_sub inner join default_subject on emp_sub.sub_id=default_subject.sub_id where emp_sub.emp_id='" + emp_id.Text + "' and emp_sub.status='Active' and default_subject.status='Active'");
    //        if (dt2.Rows.Count > 0)
    //        {
    //            for (int i = 0; i < dt2.Rows.Count; i++)
    //            {
    //                if (i == 0)
    //                    expertise_in.Text = dt2.Rows[i]["sub_name"].ToString();
    //                else
    //                    expertise_in.Text = expertise_in.Text + ", " + dt2.Rows[i]["sub_name"].ToString();
    //            }
    //        }
    //        else
    //        {
    //            expertise_in.Text = "N/A";
    //        }
    //    }
    //}

}