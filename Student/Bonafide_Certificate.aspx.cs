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

public partial class Student_Bonafide_Certificate : System.Web.UI.Page
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
            String refr = Request.QueryString["id"].ToString();
            DataTable dt = sql.GetDataTable(@"select * from Apply_Bonafide  where  Student_id='" + refr + "' and Activity='Genreted'   ");

            if (dt.Rows.Count > 0)
            {

                txtname.Text = dt.Rows[0]["Student_Name"].ToString();
                txtfathername.Text = dt.Rows[0]["father_name"].ToString();

                txtclass.Text = dt.Rows[0]["Stream"].ToString();
              Label10.Text = dt.Rows[0]["Honours"].ToString();
                txtsessionform.Text = dt.Rows[0]["Session_from"].ToString();
                txtsessionto.Text = dt.Rows[0]["Session_to"].ToString();
                txtroll.Text = dt.Rows[0]["Roll_no"].ToString();
                Label3.Text = dt.Rows[0]["Updateddate"].ToString();

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