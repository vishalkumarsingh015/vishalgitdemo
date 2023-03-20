using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.IO;
using System.Collections.Specialized;
using System.Text;

public partial class Student_DownloadTc_recipet : System.Web.UI.Page
{
    string img1, img2, img3;
    SqlComan sql = new SqlComan();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            getlogin();

        }
    }

    protected void save_Click(object sender, EventArgs e)
    {





        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thank For Download');window.location.href='TcRecipet.aspx?id=" +  txtregno.Text + "';", true);




    }

    protected void getlogin()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = sql.GetDataTable("select * from Reg_Student_tc_char where student_id='" + Request.Cookies["user_id"].Value + "'  ");
            if (dt.Rows.Count > 0)
            {
                txtregno.Text = dt.Rows[0]["Registration_no"].ToString();
                
                int rate = 0;
                //if (b == "I.A")
                //{
                //    rate = 325;
                //}
                //if (b == "I.SC")
                //{
                //    rate = 325;
                //}
                //if (b == "B.A")
                //{
                //    rate = 325;
                //}
                //if (b == "B.SC")
                //{
                //    rate = 325;
                //}
                //if (b == "M.SC")
                //{
                //    rate = 325;
                //}
                //if (b == "M.A")
                //{
                //    rate = 325;
                //}
                //if (b == "BCA")
                //{
                //    rate = 325;

                //}
                //if (b == "BBA")
                //{
                //    rate = 325;

                //}
                //if (b == "Bio-Tech")
                //{
                //    rate = 325;

                //}

                //else
                //{
                //    rate = '0';
                //}


            }


        }
        catch (Exception ex)
        {

            //  Response.Redirect("default.aspx");
        }

    }

}