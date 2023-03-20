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

public partial class Admin_Master_Student : System.Web.UI.Page
{
    string img1, img2, img3;
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                update.Visible = false;
                bindsession();
                get_item();
                
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }

    void bindsession()
    {
        ArrayList list = new ArrayList();
        for (int i = System.DateTime.Now.Year + 1; i >= 2015; i--)
        {
            list.Add((i - 1) + " - " + i);
        }
        ddlsession1.DataSource = list;
        ddlsession1.DataBind();
        ddlsession1.Items.Insert(0, new ListItem("---Select Session---", "0"));
    }
    void bindclasss()
    {
        DataTable dt = sql.GetDataTable("select * from addmissionclasses where status='Active' and department='" + ddlclasstype.SelectedValue + "'");
        if (dt.Rows.Count > 0)
        {
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "classes";
            ddlclass.DataValueField = "classes";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, new ListItem("---Select Class---", "0"));
        }
        else
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Class Has Been Added Yet.');", true);
        }
    }

    protected void select_Index(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "chng_tab2", "chng_tab2();", true);
        bindclasss();
    }

    protected void save_Click(object sender, EventArgs e)
    {

        DataTable dt = sql.GetDataTable("select * from dbo.Student_Master where reg_no='" + txtreg_no.Text.Trim() + "'  and status='Active'");
        if (dt.Rows.Count > 0)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);

        }
        else
        {
            if (FileUpload1.HasFile)
                img1 = SaveFile(FileUpload1);
            int i = 0;
            i = sql.ExecuteSql("insert into dbo.Student_Master (Name, Reg_no, [Father's Name], Gender, Stream, DOB, Mobile, Roll_no, email, Session,caste,Depart,photo,classes,aadhar, addedby, addeddate, status) values ('" + txtname.Text + "','" + txtreg_no.Text.Trim() + "','" + txtfather.Text + "','" + ddlgender.SelectedValue + "','" + ddlstream.SelectedValue + "','" + dobir.Text + "','" + mobile1.Text + "','" + txtroll_no.Text + "','" + email1.Text + "','" + ddlsession1.SelectedValue + "','" + ddlcaste.SelectedValue + "','" + ddlclasstype.SelectedValue + "','" + img1 + "','" + ddlclass.SelectedValue + "','" + aadhar_no1.Text + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Admin','Active')");

            if (i > 0)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Details Got Saved Successfully');", true);
                get_item();
                txtfather.Text = "";
                txtreg_no.Text = "";
                txtroll_no.Text = "";
                email1.Text = "";
                mobile1.Text = "";
                dobir.Text = "";
                txtname.Text = "";
                ddlgender.SelectedValue = "0";
                ddlclass.SelectedValue = "0";
                ddlcaste.SelectedValue = "0";
                ddlclasstype.SelectedValue = "0";
                ddlsession1.SelectedValue = "0";
                ddlclass.SelectedValue = "0";
                
            }
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        DataTable dt = sql.GetDataTable("select * from dbo.Student_Master where reg_no='" + txtreg_no.Text.Trim() + "'  and status='Active'");
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This Data  Already Exist!');", true);
        }
        else
        {
         
            if (FileUpload1.HasFile)
            {
                img1 = SaveFile(FileUpload1);
                sql.ExecuteSql("update Student_Master set photo='" + img1 + "' where id='" + lblid.Text + "'");
            }


            int i = sql.ExecuteSql("update Student_Master set aadhar='"+ aadhar_no1.Text +"',Name='" + txtname.Text + "', Reg_no='" + txtreg_no.Text + "', [Father's Name]='" + txtfather.Text + "', Gender='" + ddlgender.SelectedValue + "', Stream='" + ddlstream.SelectedValue + "', DOB='" + dobir.Text + "',Mobile='" + mobile1.Text + "',email='" + email1.Text + "',Session='" + ddlsession1.SelectedValue + "',caste='" + ddlcaste.SelectedValue + "',depart='" + ddlclasstype.SelectedValue + "',classes='" + ddlclass.SelectedValue + "', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "', updatedby='Admin' where id='" + lblid.Text + "'");
             
             
            if (i > 0)
            {

                get_item();
                save.Visible = true;
                update.Visible = false;
                txtfather.Text = "";
                txtreg_no.Text = "";
                txtroll_no.Text = "";
                email1.Text = "";
                mobile1.Text = "";
                dobir.Text = "";
                txtname.Text = "";
                ddlgender.SelectedValue = "0";
                ddlclass.SelectedValue = "0";
                ddlcaste.SelectedValue = "0";
                ddlclasstype.SelectedValue = "0";
                ddlsession1.SelectedValue = "0";
                ddlclass.SelectedValue = "0";
            }
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

    void get_detail()
    {

        DataTable dt = (DataTable)ViewState["emp"];
        var dr = dt.AsEnumerable().Where(x => x.Field<int>("id") == (int.Parse(lblid.Text)));
        dt = dr.CopyToDataTable<DataRow>();
        if (dt.Rows.Count > 0)
        {
            
             ddlclasstype.SelectedValue = dt.Rows[0]["Depart"].ToString();
            bindclasss();
            ddlsession1.SelectedValue = dt.Rows[0]["session"].ToString();
             ddlclass.SelectedValue = dt.Rows[0]["classes"].ToString();
             txtname.Text = dt.Rows[0]["Name"].ToString();
             txtreg_no.Text = dt.Rows[0]["Reg_no"].ToString();
             txtfather.Text = dt.Rows[0]["Father's Name"].ToString();
             aadhar_no1.Text = dt.Rows[0]["aadhar"].ToString();
             ddlgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
             ddlstream.SelectedValue = dt.Rows[0]["Stream"].ToString();
             ddlcaste.SelectedValue = dt.Rows[0]["caste"].ToString();
             dobir.Text = dt.Rows[0]["DOB"].ToString();
             mobile1.Text = dt.Rows[0]["Mobile"].ToString();
             txtroll_no.Text = dt.Rows[0]["Roll_no"].ToString();
             email1.Text = dt.Rows[0]["email"].ToString();
             Imgprv11.ImageUrl = "../img/" + dt.Rows[0]["photo"].ToString();

        }

    }

    void get_item()
    {

        DataTable dt = sql.GetDataTable("select [Father's Name] as father, *  from Student_Master where status='Active'");
        ViewState["emp"] = dt;
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        
        int i = 0;
        if (e.CommandName.ToString() == "Edit")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "chng_tab2", "chng_tab2();", true);
            lblid.Text = e.CommandArgument.ToString();
            get_detail();
            save.Visible = false;
            update.Visible = true;
        }
        else
        {
            i = sql.ExecuteSql("update admission_Deprt set status='Deactive' where id='" + e.CommandArgument.ToString() + "'");

            if (i > 0)
            {
                get_item();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Got Deleted Successfully');", true);

            }
        }
    }

}