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

public partial class Admin_AddGallery : System.Web.UI.Page
{
    string img1, img2, img3;
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            get_item();
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
            img1 = SaveFile(FileUpload1);
        int i = 0;
        i = sql.ExecuteSql("insert into gallery (title,Image,addeddate, addedby , status) values ('" + txtnotice_title.Text + "','" + img1 + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Admin','Active')");

        if (i > 0)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Saved Successfully');", true);



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


    void get_item()
    {

        DataTable dt = sql.GetDataTable("select * from Gallery where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
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
            i = sql.ExecuteSql("update Gallery set status='Deactive' where id='" + e.CommandArgument.ToString() + "'");

            if (i > 0)
            {
                get_item();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Got Deleted Successfully');", true);

            }
        }
    }

}