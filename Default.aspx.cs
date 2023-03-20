using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Net.Security;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();
    SqlComan cls = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {


        //get_news();
        get_notice();


    }
    void get_notice()
    {

        DataTable dt = sql.GetDataTable("select DATENAME(DAY,CONVERT(datetime,Notice_date,105))as day,SUBSTRING(DATENAME(MONTH,CONVERT(datetime,Notice_date,105)), 1, 3)as montth,DATENAME(YEAR,CONVERT(datetime,Notice_date,105))as year,* from notice where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
}