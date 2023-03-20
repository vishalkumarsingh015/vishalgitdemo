using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

public partial class Admin_Notice : System.Web.UI.Page
{ 
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

               
         
                get_item();
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }


  
    protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        int i = 0;
        if (e.CommandName.ToString() == "Edit")
        {
            lblid.Text = e.CommandArgument.ToString();
            save.Visible = false;
             
        }
        else
        {
            i = sql.ExecuteSql("update Top_News set status='Deactive' where id='" + e.CommandArgument.ToString() + "'");

            if (i > 0)
            {
                get_item();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Got Deleted Successfully');", true);

            }
        }
    }
    //void get_detail()
    //{

    //    DataTable dt = (DataTable)ViewState["emp"];
    //    var dr = dt.AsEnumerable().Where(x => x.Field<int>("id") == (int.Parse(lblid.Text)));
    //    dt = dr.CopyToDataTable<DataRow>();
    //    if (dt.Rows.Count > 0)
    //    {
    //        ddlclasstype.SelectedValue = dt.Rows[0]["addmission_type"].ToString();
    //        ddlsession1.SelectedValue = dt.Rows[0]["session"].ToString();
    //        ddlclass.SelectedValue = dt.Rows[0]["classes"].ToString();



    //    }

    //}

    void get_item()
    {

        DataTable dt = sql.GetDataTable("select * from Top_News where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }

    protected void save_Click(object sender, EventArgs e)
    {


        int i = 0;
        i = sql.ExecuteSql("insert into Top_News (Notice_Date,Notice_details,addeddate,addedby,status) values ('" + txtnotice_date.Text + "','" + txtnotice.Text + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Admin','Active')");

        if (i > 0)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Saved Successfully');", true);

            get_item();

            txtnotice.Text = "";
            txtnotice_date.Text = "";
         
        }

    }
    //protected void update_Click(object sender, EventArgs e)
    //{
    //    DataTable dt = sql.GetDataTable("select * from admission_Deprt where addmission_type='" + ddlclasstype.SelectedValue.Trim() + "' and session='" + ddlsession1.SelectedValue + "' and status='Active'");
    //    if (dt.Rows.Count > 0)
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

    //    }
    //    else
    //    {

    //        int i = sql.ExecuteSql("update admission_Deprt set addmission_type='" + ddlclasstype.SelectedValue + "', session='" + ddlsession1.SelectedValue + "',classes='" + ddlclass.SelectedValue + "', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "', updatedby='Admin' where id='" + lblid.Text + "'");

    //        if (i > 0)
    //        {

    //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Updated Successfully');", true);
    //            ddlclasstype.SelectedValue = "0";
    //            ddlsession1.SelectedValue = "0";
    //            ddlclass.SelectedValue = "0";
    //            get_item();
    //            save.Visible = true;
    //            update.Visible = false;
    //        }
    //    }
    //}

    
}