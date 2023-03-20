 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class SuperAdmin_MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        try
        {
           get_branch_detail();
            get_emp_details();
         // get_notification();
            if (!IsPostBack)
            {
                
                try
                {

                    if (Request.Cookies["checkbox11"].Value == "false")
                    {

                        if (HttpContext.Current != null)
                        {
                            int cookieCount = HttpContext.Current.Request.Cookies.Count;
                            for (var i = 0; i < cookieCount; i++)
                            {
                                var cookie = HttpContext.Current.Request.Cookies[i];
                                if (cookie != null)
                                {
                                    //var cookieName = cookie.Name;

                                    cookie.Expires = DateTime.Now.AddHours(1);
                                    HttpContext.Current.Response.Cookies.Add(cookie);

                                }
                            }
                        }

                    }


                    if (Request.Cookies["wrapper"].Value != "" && Request.Cookies["loginType"].Value == "Student")
                    {



                    }
                    else
                    {
                        Response.Redirect("../Login_Master.aspx");
                    }
                }
                catch (Exception gh)
                {
                    Response.Redirect("../Login_Master.aspx");

                }
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }
    protected void logout_click(object sender, EventArgs e)
    {
        ExpireAllCookies();
        Response.Redirect("../Login_Master.aspx");
    }
    private void ExpireAllCookies()
    {
        if (HttpContext.Current != null)
        {
            int cookieCount = HttpContext.Current.Request.Cookies.Count;
            for (var i = 0; i < cookieCount; i++)
            {
                var cookie = HttpContext.Current.Request.Cookies[i];
                if (cookie != null)
                {
                    var cookieName = cookie.Name;
                    var expiredCookie = new HttpCookie(cookieName) { Expires = DateTime.Now.AddDays(-1) };
                    HttpContext.Current.Response.Cookies.Add(expiredCookie); // overwrite it
                }
            }

            // clear cookies server side
            HttpContext.Current.Request.Cookies.Clear();
        }
    }
    void get_branch_detail()
    {
        DataTable dt = sql.GetDataTable("select * from Reg_Student_tc_char where status='Active' and Student_id='" + Request.Cookies["user_id"].Value + "'");
        if (dt.Rows.Count > 0)
        {
            Name.Text = dt.Rows[0]["Full_name"].ToString();
            deprt_d.Text = dt.Rows[0]["Stream"].ToString();
            // b_photo.ImageUrl = "../img/" + dt.Rows[0]["b_photo"].ToString();
        }
    }

    void get_emp_details()
    {
        DataTable dt = sql.GetDataTable("select * from Reg_Student_tc_char  where status='Active' and  student_id='" + Request.Cookies["user_id"].Value + "'");
        if (dt.Rows.Count > 0)
        {
            Name1.Text = dt.Rows[0]["Full_name"].ToString();
            deprt_d1.Text = dt.Rows[0]["Stream"].ToString();
            // b_photo.ImageUrl = "../img/" + dt.Rows[0]["b_photo"].ToString();
        }
    }

 
   
  
   
 
}
