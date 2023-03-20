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

public partial class Contact : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();
    SqlComan cls = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //string complain_id = GenerateCode();
        int i = sql.ExecuteSql("insert into [contact]( Name, email,phone, subject, message,status) values ('" + Textfullname.Text + "','" + textEmail.Text + "','" + Textphone.Text + "','" + textsub.Text + "','" + txtmessage.Text + "', 'Active') ");
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Contact Saved successfully !');", true);
            Textfullname.Text = "";
            textEmail.Text = "";
            Textphone.Text = "";
            textsub.Text = "";
            txtmessage.Text = "";


        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Contact is not Saved successfully ! ');", true);
        }
    }
}