using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_Charctor_fromUpdate : System.Web.UI.Page
{
    string refr;

    SqlComan sql = new SqlComan();

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getlogin();

        }

    }

    protected void getlogin()
    {
        refr = Request.QueryString["id"].ToString();
        DataTable dt = new DataTable();
        dt = sql.GetDataTable("select * from Apply_Charctor where student_id='" + refr + "'");
        if (dt.Rows.Count > 0)
        {
            txtregno.Text = dt.Rows[0]["Reg_no"].ToString();
            txtstudent_num.Text = dt.Rows[0]["Student_name"].ToString();
            txtfathername.Text = dt.Rows[0]["Father_name"].ToString();
            txtmother.Text = dt.Rows[0]["mother_name"].ToString();
            mobile.Text = dt.Rows[0]["mobile"].ToString();
            txtstream.Text = dt.Rows[0]["Stream"].ToString();
            txtsub.Text = dt.Rows[0]["Honours"].ToString();
            txtnotice_date.Text = dt.Rows[0]["DOB"].ToString();
            txtrollno.Text = dt.Rows[0]["Roll_no"].ToString();
            txtsessionfrom.Text = dt.Rows[0]["Session_from"].ToString();
            txtsessionto.Text = dt.Rows[0]["Session_to"].ToString();
            txtPas_year.Text = dt.Rows[0]["Passing_year"].ToString();
            txtdivision.Text = dt.Rows[0]["division"].ToString();
            txtaddress.Text = dt.Rows[0]["address"].ToString();



        }
    }

    protected string GenerateCode()
    {
        string number_value = "";
        DataTable dt1 = sql.GetDataTable("select max(id)+1 from Apply_Charctor");

        if (dt1.Rows[0][0].ToString() != "")
        {
            int input_number = Convert.ToInt32(dt1.Rows[0][0].ToString());
            number_value = input_number.ToString("000");
            number_value = "ANS" + number_value;
        }
        else
        {
            int input_number = 1;
            number_value = input_number.ToString("000");
            number_value = "ANS" + number_value;
        }
        return number_value;
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string rfr = Request.QueryString["id"].ToString();
        string Tc_id = GenerateCode();
        int i = sql.ExecuteSql("update Apply_Charctor set Activity='Genreted',Reg_no='" + txtregno.Text + "',Student_name='" + txtstudent_num.Text + "', Father_name='" + txtfathername.Text + "',mother_name='" + txtmother.Text + "',mobile='" + mobile.Text + "', Stream='" + txtstream.Text + "',Honours='" + txtsub.Text + "', Roll_no='" + txtrollno.Text + "',Session_from='" + txtsessionfrom.Text + "', Session_to='" + txtsessionto.Text + "',Passing_year='" + txtPas_year.Text + "',division='" + txtdivision.Text + "', Address='" + txtaddress.Text + "', Date_of_leave_college='" + txtleavingdate.Text + "',Dob='" + txtnotice_date.Text + "',Condition='" + txtbehaviour.Text + "', updateddate='" + System.DateTime.Now.ToString("dd/MM/yyyy") + "',Tc_id='" + Tc_id + "' where Student_id='" + rfr + "'");
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record update ');window.location.href='DownloadCharctor.aspx?id=" + rfr + "';", true);
            // txtreg.Text = "";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Is Not update ');", true);
        }
    }
}