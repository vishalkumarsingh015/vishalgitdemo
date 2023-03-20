using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Branch_AddEmployee : System.Web.UI.Page
{
    string id, img1, img2;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString.ToString().Length < 1)
            {
                update.Visible = false;
                if (!IsPostBack)
                {
                    binddept();


                }
            }
            else
            {
                id = EncrDyrc.Decryp(Request.QueryString["id"].ToString());
                save.Visible = false;
               
                if (!IsPostBack)
                {
                  
                    get_emp_info();
                   
                    get_emp_login();
                }
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("../Login_Master.aspx");
        }
    }
    public void get_emp_info()
    {
        DataTable dt = sql.GetDataTable("select * from employee where id='" + id + "' and status='Active'");
        if (dt.Rows.Count > 0)
        {
            emp_name.Text = dt.Rows[0]["emp_name"].ToString();
            aadhar.Text = dt.Rows[0]["aadhar"].ToString();
       
            mobile.Text = dt.Rows[0]["mobile"].ToString();
            email.Text = dt.Rows[0]["email"].ToString();
            ddlgender.SelectedValue = dt.Rows[0]["gender"].ToString();
          

            ddldept.SelectedValue = dt.Rows[0]["dept_id"].ToString();
            ddldept.Enabled = false;
            Image1.ImageUrl = "../img/" + dt.Rows[0]["photo"].ToString();
            Image2.ImageUrl = "../img/" + dt.Rows[0]["photo_id"].ToString();
        }
    }

    public void binddept()
    {
        DataTable dt = sql.GetDataTable("select * from department where status='Active'");
        if (dt.Rows.Count > 0)
        {
            ddldept.DataSource = dt;
            ddldept.DataTextField = "dept_name";
            ddldept.DataValueField = "dept_id";
            ddldept.DataBind();
            ddldept.Items.Insert(0, new ListItem("---Select Department---", "0"));
        }
    }
    public void get_emp_login()
    {
        DataTable dt = sql.GetDataTable("select * from loginmaster where user_id=(select emp_id from employee where id='" + id + "') and status='Active'");
        if (dt.Rows.Count > 0)
        {
            uname.Text = CCommonDB.Decrypt(dt.Rows[0]["username"].ToString());
            pwd.Text = CCommonDB.Decrypt(dt.Rows[0]["password"].ToString());
            cnpwd.Text = CCommonDB.Decrypt(dt.Rows[0]["password"].ToString());
        }
    }
    protected string GenerateCode()
    {
        string number_value = "";
        try
        {
            SqlDataAdapter ord = new SqlDataAdapter("select max(id)+1 from employee", con);
            DataTable dt1 = new DataTable();
            ord.Fill(dt1);

            if (dt1.Rows[0][0].ToString() != "")
            {
                int input_number = Convert.ToInt32(dt1.Rows[0][0].ToString());
                number_value = input_number.ToString("00000");
                number_value = "EMP" + number_value;
            }
            else
            {
                int input_number = 1;
                number_value = input_number.ToString("00000");
                number_value = "EMP" + number_value;
            }
        }
        catch (Exception ex)
        {

        }
        return number_value;
    }

    protected void save_Click(object sender, EventArgs e)
    {
      
            DataTable dt = sql.GetDataTable("select * from loginmaster where username='" + CCommonDB.Encrypt(uname.Text) + "' and status='Active'");
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops! This Email/Username Already Exist.');", true);
            }
            else
            {
                UploadFile();
                string emp_id = GenerateCode();
                int i = sql.ExecuteSql("insert into employee (emp_id,emp_name,aadhar,email,mobile,gender,dept_id,photo,photo_id,addedby,addeddate,status) values ('" + emp_id + "','" + emp_name.Text + "','" + aadhar.Text + "','" + email.Text + "','" + mobile.Text + "','" + ddlgender.SelectedItem.Text + "','"+ ddldept.SelectedValue +"','" + img1 + "','" + img2 + "','Admin','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Active')");
                if (i > 0)
                {
                    i = sql.ExecuteSql("insert into [LoginMaster] (username,password,type,createdby,createddate,user_id,status)values('" + CCommonDB.Encrypt(uname.Text.Trim()) + "','" + CCommonDB.Encrypt(pwd.Text.Trim()) + "','Employee','Admin','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','" + emp_id + "','Active ')");
                }
             
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Employee Has Been Added.');", true);

                    emp_name.Text = "";
                    aadhar.Text = "";
                   
                    mobile.Text = "";
                    email.Text = "";
                    ddlgender.SelectedValue = "0";
                    ddldept.SelectedValue = "0";
                    pwd.Text = "";
                    cnpwd.Text = "";
                    Image1.ImageUrl = "../img/default.png";
                    Image2.ImageUrl = "../img/default.png";
                }
            }
       
        
    }

    protected void update_Click(object sender, EventArgs e)
    {
            DataTable dt = sql.GetDataTable("select * from loginmaster where username='" + CCommonDB.Encrypt(uname.Text) + "' and user_id!=(select emp_id from employee where id='" + id + "') and status='Active'");
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops! This Email/Username Already Exist.');", true);
            }
            else
            {
                int i = 0;
                if (i > 0)
                {
                    i = update_emp_login();
                }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Redord Updated Successfully.');window.location.href='ListEmployee.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something Went Wrong!');", true);
                }
            }
       
    }

    public int update_emp_info()
    {
        int i = 0;
        i = sql.ExecuteSql("update employee set emp_name='" + emp_name.Text + "', aadhar='" + aadhar.Text + "',  email='" + email.Text + "', mobile='" + mobile.Text + "', gender='" + ddlgender.SelectedItem.Text + "', dept_id='" + ddldept.SelectedValue + "',  updatedby='Admin', updateddate='" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "' where id='" + id + "'");
        if (FileUpload3.HasFile)
        {
            img1 = SaveFile(FileUpload3);
            i = sql.ExecuteSql("update employee set photo='" + img1 + "' where id='" + id + "'");
        }
        if (FileUpload4.HasFile)
        {
            img2 = SaveFile(FileUpload4);
            i = sql.ExecuteSql("update employee set photo_id='" + img2 + "' where id='" + id + "'");
        }
        return i;
    }

   

    public int update_emp_login()
    {
        int i = 0;
        i = sql.ExecuteSql("update loginmaster set username='" + CCommonDB.Encrypt(uname.Text) + "', password='" + CCommonDB.Encrypt(pwd.Text) + "' where user_id=(select emp_id from employee where id='" + id + "')");
        return i;
    }

    public void UploadFile()
    {
        string filename1, filename2, filename3, filename4 = "";
        // Before attempting to save the file, verify
        // that the FileUpload control contains a file.

        //filename3
        if (FileUpload3.HasFile)
        {
            // Call a helper method routine to save the file.
            filename3 = SaveFile(FileUpload3);
        }
        else
        {
            // Notify the user that a file was not uploaded.
            // string logomsg;
            filename3 = "n/a";
        }

        if (filename3 != "n/a")
        {
            img1 = filename3;
        }

        //filename4
        if (FileUpload4.HasFile)
        {
            // Call a helper method routine to save the file.
            filename4 = SaveFile(FileUpload4);
        }
        else
        {
            // Notify the user that a file was not uploaded.
            // string logomsg;
            filename4 = "n/a";
        }

        if (filename4 != "n/a")
        {
            img2 = filename4;
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