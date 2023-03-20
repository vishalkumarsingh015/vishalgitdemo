using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

public partial class Admin_Notice : System.Web.UI.Page
{
    string img1;
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

               
         
                get_item();
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }


  
    protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        int i = 0;
        if (e.CommandName.ToString() == "Edit")
        {
            lblid.Text = e.CommandArgument.ToString();
            save.Visible = false;
             
        }
        else
        {
            i = sql.ExecuteSql("update Notice set status='Deactive' where id='" + e.CommandArgument.ToString() + "'");

            if (i > 0)
            {
                get_item();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Got Deleted Successfully');", true);

            }
        }
    }
    //void get_detail()
    //{

    //    DataTable dt = (DataTable)ViewState["emp"];
    //    var dr = dt.AsEnumerable().Where(x => x.Field<int>("id") == (int.Parse(lblid.Text)));
    //    dt = dr.CopyToDataTable<DataRow>();
    //    if (dt.Rows.Count > 0)
    //    {
    //        ddlclasstype.SelectedValue = dt.Rows[0]["addmission_type"].ToString();
    //        ddlsession1.SelectedValue = dt.Rows[0]["session"].ToString();
    //        ddlclass.SelectedValue = dt.Rows[0]["classes"].ToString();



    //    }

    //}

    void get_item()
    {

        DataTable dt = sql.GetDataTable("select * from notice where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }

    protected void save_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from Notice where Notice_title='" + txtnotice_title.Text + "' and Status='Active'");
        if (dt.Rows.Count > 0)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

        }
        else
        {
            if (FileUpload1.HasFile)
               img1 = SaveFile(FileUpload1);
            int i = 0;
            i = sql.ExecuteSql("insert into Notice (Notice_title,Notice_Date,Notice_details,addeddate,addedby,status,Notification) values ('" + txtnotice_title.Text + "','" + txtnotice_date.Text + "','" + txtnotice.Text + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Admin','Active','" + img1 + "')");

            if (i > 0)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Saved Successfully');", true);

                get_item();

                txtnotice.Text = "";
                txtnotice_date.Text = "";
                txtnotice_title.Text = "";
            }
        }
    }
    //protected void update_Click(object sender, EventArgs e)
    //{
    //    DataTable dt = sql.GetDataTable("select * from admission_Deprt where addmission_type='" + ddlclasstype.SelectedValue.Trim() + "' and session='" + ddlsession1.SelectedValue + "' and status='Active'");
    //    if (dt.Rows.Count > 0)
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

    //    }
    //    else
    //    {

    //        int i = sql.ExecuteSql("update admission_Deprt set addmission_type='" + ddlclasstype.SelectedValue + "', session='" + ddlsession1.SelectedValue + "',classes='" + ddlclass.SelectedValue + "', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "', updatedby='Admin' where id='" + lblid.Text + "'");

    //        if (i > 0)
    //        {

    //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Updated Successfully');", true);
    //            ddlclasstype.SelectedValue = "0";
    //            ddlsession1.SelectedValue = "0";
    //            ddlclass.SelectedValue = "0";
    //            get_item();
    //            save.Visible = true;
    //            update.Visible = false;
    //        }
    //    }
    //}

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