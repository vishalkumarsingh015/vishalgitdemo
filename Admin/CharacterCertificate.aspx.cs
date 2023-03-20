using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Text.RegularExpressions;
using System.Globalization;

public partial class Branch_CharacterCertificate : System.Web.UI.Page
{
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                tc_div.Visible = false;
                bindsession();
                bindclass();
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
        ddlsession.DataSource = list;
        ddlsession.DataBind();
        ddlsession.Items.Insert(0, new ListItem("---Select Session---", "0"));
    }
    void bindclass()
    {
        DataTable dt = sql.GetDataTable("select * from class where status='Active' and b_id='" + Request.Cookies["user_id"].Value + "'");
        ddlclass.DataSource = dt;
        ddlclass.DataTextField = "class_name";
        ddlclass.DataValueField = "class_id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, new ListItem("---Select Class---", "0"));
    }
    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsection();
        bindstudent();
    }
    void bindsection()
    {
        DataTable dt = sql.GetDataTable("select * from section where class_id='" + ddlclass.SelectedValue + "' and b_id='" + Request.Cookies["user_id"].Value + "' and status='Active'");
        ddlsection.DataSource = dt;
        ddlsection.DataTextField = "section_name";
        ddlsection.DataValueField = "section_id";
        ddlsection.DataBind();
        ddlsection.Items.Insert(0, new ListItem("---Select Section---", "0"));
    }
    protected void ddlsection_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindstudent();
    }
    void bindstudent()
    {
        DataTable dt = sql.GetDataTable("select current_status.admis_id,student_data.sname from current_status inner join student_data on current_status.stu_id=student_data.stu_id where current_status.class_id='" + ddlclass.SelectedValue + "' and current_status.section_id='" + ddlsection.SelectedValue + "' and current_status.session='" + ddlsession.SelectedValue + "' and current_status.b_id='" + Request.Cookies["user_id"].Value + "' and current_status.status='Active'");
        ddlstu.DataSource = dt;
        ddlstu.DataTextField = "sname";
        ddlstu.DataValueField = "admis_id";
        ddlstu.DataBind();
        ddlstu.Items.Insert(0, new ListItem("---Select Student---", "0"));
    }
    protected string GenerateCode()
    {
        string number_value = "";
        try
        {
            DataTable dt1 = sql.GetDataTable("select max(id)+1 from char_certi");
            if (dt1.Rows[0][0].ToString() != "")
            {
                int input_number = Convert.ToInt32(dt1.Rows[0][0].ToString());
                number_value = input_number.ToString("00000");
                number_value = "CHCR" + number_value;
            }
            else
            {
                int input_number = 1;
                number_value = input_number.ToString("00000");
                number_value = "CHCR" + number_value;
            }
        }
        catch (Exception ex)
        {

        }
        return number_value;
    }
    protected void search_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select branch.b_name,branch.b_add,branch.b_contact,branch.b_email,admission.doa,student_data.residential_add,student_data.caste,student_data.sname,student_data.fname,student_data.mname,class.class_name + ' & ' + section.section_name as class_section,student_data.dob,current_status.session,current_status.admis_id from current_status inner join admission on current_status.admis_id=admission.admis_id inner join student_data on current_status.stu_id=student_data.stu_id inner join class on current_status.class_id=class.class_id inner join section on current_status.section_id=section.section_id inner join branch on current_status.b_id=branch.b_id where current_status.status='Active' and current_status.admis_id='" + ddlstu.SelectedValue + "'");
        int i = 0;
        string tc_id = GenerateCode();
        i = sql.ExecuteSql("insert into char_certi (b_id,admis_id,certi_id,session,class_id,section_id,dog,addedby,addeddate,status) values ('" + Request.Cookies["user_id"].Value + "','" + ddlstu.SelectedValue + "','" + tc_id + "','" + ddlsession.SelectedValue + "','" + ddlclass.SelectedValue + "','" + ddlsection.SelectedValue + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString("dd-MM-yyyy") + "','" + Request.Cookies["user_id"].Value + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Active')");

        if (i > 0)
        {
            tc_div.Visible = true;
            if (dt.Rows.Count > 0)
            {
                //school branch details
                b_name.Text = dt.Rows[0]["b_name"].ToString();
                b_contact.Text = dt.Rows[0]["b_contact"].ToString();
                b_add.Text = dt.Rows[0]["b_add"].ToString();
                b_email.Text = dt.Rows[0]["b_email"].ToString();

                //student details
                print_dt.Text = System.DateTime.UtcNow.AddMinutes(330).ToString("dd-MM-yyyy");
                sname.Text = dt.Rows[0]["sname"].ToString();
                sname1.Text = dt.Rows[0]["sname"].ToString();
                fname.Text = dt.Rows[0]["fname"].ToString();
                mname.Text = dt.Rows[0]["mname"].ToString();
                residential_add.Text = dt.Rows[0]["residential_add"].ToString();
                DateTime doa = DateTime.ParseExact(dt.Rows[0]["doa"].ToString(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime curr_date = System.DateTime.UtcNow.AddMinutes(330);
                yrs.Text = ((curr_date.Year - doa.Year) + 1).ToString();
            }
        }
    }
}