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

public partial class Admin_Take_Addmission_session : System.Web.UI.Page
{
    string img1, img2, img3;
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
              
                update.Visible = false;
                bindsession();
                get_item();
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }
    

    void bindsession()
    {
        ArrayList list = new ArrayList();
        for (int i = System.DateTime.Now.Year + 1; i >= 2015; i--)
        {
            list.Add((i - 1) + " - " + i);
        }
        ddlsession1.DataSource = list;
        ddlsession1.DataBind();
        ddlsession1.Items.Insert(0, new ListItem("---Select Session---", "0"));
    }
    protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        int i = 0;
        if (e.CommandName.ToString() == "Edit")
        {
           lblid.Text = e.CommandArgument.ToString();
            get_detail();
            save.Visible = false;
            update.Visible = true;
        }
        else
        {
            i = sql.ExecuteSql("update admission_Deprt set status='Deactive' where id='" + e.CommandArgument.ToString() + "'");
           
            if (i > 0)
            {
                get_item();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Got Deleted Successfully');", true);

            }
        }
    }
    void get_detail()
    {
        
        DataTable dt = (DataTable)ViewState["emp"];
        var dr = dt.AsEnumerable().Where(x => x.Field<int>("id") == (int.Parse(lblid.Text)));
        dt = dr.CopyToDataTable<DataRow>();
        if (dt.Rows.Count > 0)
        {
             ddlclasstype.SelectedValue = dt.Rows[0]["addmission_type"].ToString();
             ddlsession1.SelectedValue = dt.Rows[0]["session"].ToString();
            ddlclass.SelectedValue = dt.Rows[0]["classes"].ToString();



        }
    
    }

    void get_item()
    {
        
        DataTable  dt = sql.GetDataTable("select * from admission_Deprt where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }

    protected void save_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from admission_Deprt where addmission_type='" + ddlclasstype.SelectedValue.Trim() + "' and session='"+ ddlsession1.SelectedValue +"' and status='Active'");
        if (dt.Rows.Count > 0)
        {
             
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

        }
        else
        {
        
            int i = 0;
            i = sql.ExecuteSql("insert into admission_Deprt (addmission_type,session,classes,addeddate,addedby,status) values ('" + ddlclasstype.SelectedValue + "','" + ddlsession1.SelectedValue + "','"+ ddlclass.SelectedValue +"','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Admin','Active')");
           
            if (i > 0)
            {
                
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Saved Successfully');", true);

                get_item();
                ddlclasstype.SelectedValue = "0";
                ddlsession1.SelectedValue = "0";

                ddlclass.SelectedValue = "0";
            }
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from admission_Deprt where addmission_type='" + ddlclasstype.SelectedValue.Trim() + "' and session='" + ddlsession1.SelectedValue + "' and status='Active'");
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

        }
        else
        {

            int i = sql.ExecuteSql("update admission_Deprt set addmission_type='" + ddlclasstype.SelectedValue + "', session='" + ddlsession1.SelectedValue + "',classes='" + ddlclass.SelectedValue + "', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "', updatedby='Admin' where id='" + lblid.Text + "'");
           
            if (i > 0)
            {
            
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Updated Successfully');", true);
                ddlclasstype.SelectedValue = "0";
                ddlsession1.SelectedValue = "0";
                ddlclass.SelectedValue = "0";
                get_item();
                save.Visible = true;
                update.Visible = false;
            }
        }
    }

    protected void select_Index(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from addmissionclasses where status='Active' and department='" + ddlclasstype.SelectedValue + "'");
        if (dt.Rows.Count > 0)
        {
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "classes";
            ddlclass.DataValueField = "classes";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, new ListItem("---Select Class---", "0"));
        }
        else
        {
             
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Class Has Been Added Yet.');", true);
        }
    }


}