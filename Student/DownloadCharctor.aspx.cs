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

public partial class Admin_DownloadCharctor : System.Web.UI.Page
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
          
            DataTable dt = sql.GetDataTable(@"select * from Apply_Charctor  where  Student_id='" + Request.Cookies["user_id"].Value + "' and Activity='Genreted'   ");

            if (dt.Rows.Count > 0)
            {
                txtreg_no.Text = dt.Rows[0]["Reg_No"].ToString();
                lblname.Text = dt.Rows[0]["Student_Name"].ToString();
                lblfather.Text = dt.Rows[0]["father_name"].ToString();
                txtslno.Text = dt.Rows[0]["Tc_id"].ToString();
                lblmother.Text = dt.Rows[0]["mother_name"].ToString();
                lblstream.Text = dt.Rows[0]["Stream"].ToString();
                lblhonours.Text = dt.Rows[0]["Honours"].ToString();
                lblfrom.Text = dt.Rows[0]["Session_from"].ToString();
                lblto.Text = dt.Rows[0]["Session_to"].ToString();
                roll_no.Text = dt.Rows[0]["Roll_no"].ToString();
                lbldivision.Text = dt.Rows[0]["Division"].ToString();
                Label2.Text = dt.Rows[0]["Updateddate"].ToString();
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