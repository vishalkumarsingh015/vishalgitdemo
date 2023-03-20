using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

public partial class Student_Download_tc : System.Web.UI.Page
{
    string id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getdata();
        }
    }

    SqlComan sql = new SqlComan();

    protected void getdata()
    {
        try
        {
             // String  refr = Request.QueryString["id"].ToString();
            DataTable dt = sql.GetDataTable(@"select * from Apply_tc  where  Student_id='" + Request.Cookies["user_id"].Value + "' and Activity='Genreted'  ");

            if (dt.Rows.Count > 0)
            {
                txtreg_no.Text = dt.Rows[0]["Reg_No"].ToString();
                lblname.Text = dt.Rows[0]["Student_Name"].ToString();
                lblfather.Text = dt.Rows[0]["father_name"].ToString();
                txtslno.Text = dt.Rows[0]["Tc_id"].ToString();
                lblmother.Text = dt.Rows[0]["mother_name"].ToString();
                lblaadhar.Text = dt.Rows[0]["aadhar"].ToString();
                lbldob.Text = dt.Rows[0]["Dob"].ToString();
                lblAddress.Text = dt.Rows[0]["address"].ToString();
                lblstream.Text = dt.Rows[0]["Stream"].ToString();
                lblhonours.Text = dt.Rows[0]["Honours"].ToString();
                lblfrom.Text = dt.Rows[0]["Session_from"].ToString();
                lblto.Text = dt.Rows[0]["Session_to"].ToString();
                lblroll_no.Text = dt.Rows[0]["Roll_no"].ToString();
                lbldateofleave.Text = dt.Rows[0]["Date_of_leave_college"].ToString();
                lbldivision.Text = dt.Rows[0]["Division"].ToString();
                lblconduct.Text = dt.Rows[0]["Condition"].ToString();
                Label1.Text = dt.Rows[0]["Updateddate"].ToString();
                lblpassyear.Text = dt.Rows[0]["Passing_year"].ToString();
                Image1.ImageUrl = "../img/" + dt.Rows[0]["photo"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
        }

    }
}