﻿using System;
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


public partial class Student_DownloadBonafide_fee : System.Web.UI.Page
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
            DataTable dt = sql.GetDataTable(@"select * from Apply_Bonafide_fee  where  Student_id='" + Request.Cookies["user_id"].Value + "' and Activity='Genreted'  ");

            if (dt.Rows.Count > 0)
            {
                txtname.Text = dt.Rows[0]["Student_Name"].ToString();
                txtfathername.Text = dt.Rows[0]["father_name"].ToString();

                txtclass.Text = dt.Rows[0]["Stream"].ToString();
                txtsubject.Text = dt.Rows[0]["Honours"].ToString();
                txtsessionform.Text = dt.Rows[0]["Session_from"].ToString();
                txtsessionto.Text = dt.Rows[0]["Session_to"].ToString();
                txtroll.Text = dt.Rows[0]["Roll_no"].ToString();

                if (dt.Rows[0]["Stream"].ToString() == "I.SC")
                {
                    txtiafee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtiafee.Text = "";
                   



                }
                if (dt.Rows[0]["Stream"].ToString() == "M.A")
                {
                    txtiafee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtmafee.Text = "";
                



                }
                if (dt.Rows[0]["Stream"].ToString() == "B.A")
                {
                    txtbafee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtbafee.Text = "";
                   



                }
                if (dt.Rows[0]["Stream"].ToString() == "B.SC")
                {
                    txtbscfee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtbscfee.Text = "";
                   

                }
                if (dt.Rows[0]["Stream"].ToString() == "I.A")
                {
                    txtiafee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtiafee.Text = "";
                   



                }
                if (dt.Rows[0]["Stream"].ToString() == "M.SC")
                {
                    txtmscfee.Text = dt.Rows[0]["Admissionfee"].ToString();
                    lblgrandfee.Text = dt.Rows[0]["Admissionfee"].ToString();

                }
                else
                {
                    txtmscfee.Text = "";
                 



                }






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