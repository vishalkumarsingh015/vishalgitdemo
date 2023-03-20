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
           // get_branch_detail();
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


                    if (Request.Cookies["wrapper"].Value != "" && Request.Cookies["loginType"].Value == "SuperAdmin")
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
    //void get_branch_detail()
    //{
    //    DataTable dt = sql.GetDataTable("select b_name, b_photo from branch where status='Active' and b_id='" + Request.Cookies["user_id"].Value + "'");
    //    if (dt.Rows.Count > 0)
    //    {
    //        b_name.Text = dt.Rows[0]["b_name"].ToString();
    //        b_photo.ImageUrl = "../img/" + dt.Rows[0]["b_photo"].ToString();
    //    }
    //}
    //void get_notification()
    //{
    //    DataTable dt = sql.GetDataTable("select top 4 msg.read_status,school.s_photo,school.s_name,msg.msg_type,msg.ID,LEFT(right(convert(varchar,msg.addeddate,100),7),5)+ ' ' + right(right(convert(varchar,msg.addeddate,100),7),2) as msg_time from msg inner join school on msg.sender=school.s_id  where msg.status='Active' and msg.recipient='" + Request.Cookies["user_id"].Value + "' and msg.recipient_type='Branch' order by msg.id desc");
    //    if (dt.Rows.Count > 0)
    //    {
    //        no_new.Visible = false;
    //        Repeater1.DataSource = dt;
    //        Repeater1.DataBind();
    //    }
    //    else
    //    {
    //        see_all.Visible = false;
    //        Repeater1.DataSource = dt;
    //        Repeater1.DataBind();
    //    }

    //}
    protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        int i = sql.ExecuteSql("update msg set read_status='Read', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "', updatedby='" + Request.Cookies["user_id"].Value + "' where id='" + e.CommandArgument.ToString() + "' and read_status='Unread'");
        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + d + "');", true);
        msg_id.Text = e.CommandArgument.ToString();
        DataTable dt = sql.GetDataTable("select convert(varchar,convert(datetime,msg.addeddate,105),106) as dob_format,LEFT(right(convert(varchar,msg.addeddate,100),7),5)+ ' ' + right(right(convert(varchar,msg.addeddate,100),7),2) as msg_time,* from msg inner join school on msg.sender=school.s_id where msg.id='" + msg_id.Text + "'");
        if (dt.Rows.Count > 0)
        {
            sender_name.Text = dt.Rows[0]["s_name"].ToString();
            msg_type.Text = dt.Rows[0]["msg_type"].ToString();
            msg_desc.Text = dt.Rows[0]["msg_desc"].ToString();
            msg_date_time.Text = dt.Rows[0]["dob_format"].ToString() + " " + dt.Rows[0]["msg_time"].ToString();
            if (dt.Rows[0]["msg_file"].ToString() != "" && dt.Rows[0]["msg_file"].ToString() != null)
            {
                attach_div.Visible = true;
                msg_file.Text = dt.Rows[0]["msg_file"].ToString();
                attach_file.HRef = "../img/" + dt.Rows[0]["msg_file"].ToString();
            }
            else
            {
                attach_div.Visible = false;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something Went Wrong!');", true);
        }
        //get_notification();
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "attend_details_func(" + ViewState["attend_per"] + ")", true);
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label read_status = e.Item.FindControl("read_status") as Label;
        HtmlGenericControl msg_li = e.Item.FindControl("msg_li") as HtmlGenericControl;
        if (read_status.Text == "Unread")
            msg_li.Attributes["class"] = "notification-unread";
        else
            msg_li.Attributes["class"] = "";
    }
    //search for student
   
 
    void bindfeetype(string session, string class_id, ref Repeater rep)
    {
        DataTable dt = sql.GetDataTable("select distinct fee_structure.fee_head_id,fee_head.name,fee_structure.frequency from fee_structure inner join fee_head on fee_structure.fee_head_id=fee_head.id where fee_structure.status='Active' and class_id='" + class_id + "' and fee_structure.b_id='" + Request.Cookies["user_id"].Value + "' and fee_structure.session='" + session + "'");
        if (dt.Rows.Count > 0)
        {
            // div.Visible = true;
            rep.DataSource = dt;
            rep.DataBind();
        }
        else
        {
            //  div.Visible = false;
            rep.DataSource = dt;
            rep.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You Need To Define Fee Type For This Class/Session Firstly.');", true);
        }
    }
    
   
  
   
    public string SaveFile(FileUpload file)
    {
        string fileName = "";
        // Specify the path to save the uploaded file to.
        String savePath = Server.MapPath("../img/");


        // Get the name of the file to upload.
        fileName = file.FileName;
        byte[] fileSize = file.FileBytes;
        string fileType = file.PostedFile.ContentType;

        // Create the path and file name to check for duplicates.
        string pathToCheck = savePath + fileName;

        // Create a temporary file name to use for checking duplicates.
        string tempfileName = "";

        // Check to see if a file already exists with the
        // same name as the file to upload.        
        try
        {
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;
                // gFileName = fileName;  //useit to save in database
                // Notify the user that the file name was changed.
                /*UploadStatusLabel.Text = "A file with the same name already exists." +
                    "<br />Your file was saved as " + fileName;*/
            }
            else
            {
                // Notify the user that the file was saved successfully.
                /* UploadStatusLabel.Text = "Your file was uploaded successfully.";*/
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.

            file.SaveAs(savePath);
        }
        catch (Exception e)
        {
            string errmsg = e.Message;
        }
        return fileName;
    }
  
}
