﻿using System;
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

public partial class Student_Bonafidewithfeestrucher : System.Web.UI.Page
{
    string img1, img2;
    SqlComan sql = new SqlComan();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Button1.Visible = false;
            getlogin();
            //getapply();
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {

        if (FileUpload2.HasFile)
            img2 = SaveFile(FileUpload2);
        int i = 0;
        i = sql.ExecuteSql(@"insert into Apply_Bonafide_fee ( [Reg_no], [Roll_no], [Student_name], [Father_name], [mother_name], [Mobile], [Aadhar], [email], [gender], [Session_from], [Session_to],
                 [Stream], [Honours],[addeddate], [addedby],[status],[Activity], [Student_id],[Admissionfee],[Photo]) values
             ('" + txtregno.Text + "','" + txtrollno.Text + "','" + txtstudent_num.Text + "','" + txtfathername.Text + "','" + txtmother.Text + "','" + mobile.Text + "','" + txtaadhar_no.Text + "','" + email.Text + "'," +
             "'" + ddlgender.SelectedValue + "','" + txtsessionfrom.Text + "','" + txtsessionto.Text + "'," +
             "'" + txtstream.Text + "','" + txtsub.Text + "','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','Student','Active','Pending','" + Request.Cookies["user_id"].Value + "','"+ txtadmissionfee.Text+"','"+ img2+"')");

        if (i > 0)
        {


            payment(txtregno.Text);


        }

    }

  


    //protected void update_docu(object sender, EventArgs e)
    //{
    //    int i = 0;
    //    string bapart3mrksheet = "";





    //    i = sql.ExecuteSql("update Apply_tc set Fee_recipt='" + img1 + "',[Marksheet]='" + img2 + "',Reg_no='" + txtregno.Text + "',Roll_no='" + txtrollno.Text + "',Student_name='" + txtstudent_num.Text + "',Father_name='" + txtfathername.Text + "',mother_name='" + txtmother.Text + "',Mobile='" + mobile.Text + "',Aadhar='" + txtaadhar_no.Text + "',Dob='" + txtnotice_date.Text + "',email='" + email.Text + "',gender='" + ddlgender.SelectedValue + "',Session_from='" + txtsessionfrom.Text + "',Session_to='" + txtsessionto.Text + "',Stream='" + txtstream.Text + "',Honours='" + txtsub.Text + "',Passing_year='" + txtPas_year.Text + "',division='" + txtdivision.Text + "',address='" + txtaddress.Text + "' where Student_id='" + Request.Cookies["user_id"].Value + "'");
    //    if (i > 0)
    //    {
    //        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thank you for apply');", true);
    //        if (i > 0)
    //        {


    //            payment(txtregno.Text);


    //        }
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Not Apply');", true);
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

    protected void getlogin()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = sql.GetDataTable("select * from Reg_Student_tc_char where student_id='" + Request.Cookies["user_id"].Value + "'  ");
            if (dt.Rows.Count > 0)
            {
                txtregno.Text = dt.Rows[0]["Registration_no"].ToString();
                txtstudent_num.Text = dt.Rows[0]["Full_name"].ToString();
                txtfathername.Text = dt.Rows[0]["Father_name"].ToString();
                mobile.Text = dt.Rows[0]["Phone"].ToString();
                txtstream.Text = dt.Rows[0]["Stream"].ToString();
                string b = dt.Rows[0]["Stream"].ToString().ToUpper().Trim();
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

    //protected void getapply()
    //{
    //    DataTable dtt = new DataTable();
    //    dtt = sql.GetDataTable("select * from Apply_Charctor where student_id='" + Request.Cookies["user_id"].Value + "'  ");
    //    if (dtt.Rows.Count > 0)
    //    {

    //        Button1.Visible = true;
    //        save.Visible = false;
    //    }
    //    else
    //    {
    //        Button1.Visible = false;
    //        save.Visible = true;

    //    }
    //}

    public void payment(string id)
    {

        //string jk = "https://payment.atomtech.in/paynetz/epi/fts?login=126647&pass=8466d6b9&ttype=NBFundTransfer&prodid=COLLEGE&amt=50&txncurr=INR&txnscamt=0&clientcode=001&txnid=123&custacc=11238950188&date=13/08/2021&ru=http://bluebusline.in/success.aspx";

        string strClientCode, strClientCodeEncoded;
        byte[] b;
        string udf9 = id;
        string MerchantLogin = "330017";
        string MerchantPass = "badab7ef";
        string TransactionType = "NBFundTransfer";
        string ProductID = "COLLEGE";
        string TransactionID = id;
        string TransactionAmount = "100";
        string TransactionCurrency = "INR";
        string CustomerAccountNo = "37341346459";
        string ClientCode = "007";
        string TransactionServiceCharge = "00";
        string TransactionDateTime = System.DateTime.UtcNow.AddMinutes(330).ToString("MM/dd/yyyy hh:mm tt");
        string ru = "https://www.anscollege.ac.in/Student/Bonafide_recipet_fee.aspx";
        string reqHashKey = "673bf10dc7fde670b4";

        b = Encoding.UTF8.GetBytes(ClientCode);
        strClientCode = Convert.ToBase64String(b);
        strClientCodeEncoded = HttpUtility.UrlEncode(strClientCode);
        string signature = "";
        string strsignature = MerchantLogin + MerchantPass + TransactionType + ProductID + TransactionID + TransactionAmount + TransactionCurrency;
        byte[] bytes = Encoding.UTF8.GetBytes(reqHashKey);
        byte[] bt = new System.Security.Cryptography.HMACSHA512(bytes).ComputeHash(Encoding.UTF8.GetBytes(strsignature));
        // byte[] b = new HMACSHA512(bytes).ComputeHash(Encoding.UTF8.GetBytes(prodid));
        signature = byteToHexString(bt).ToLower();

        string strurl = @"https://payment.atomtech.in/paynetz/epi/fts?login=" + MerchantLogin + "&pass=" + MerchantPass +
            "&ttype=NBFundTransfer&prodid=" + ProductID + "&amt=" + TransactionAmount + "&txncurr=INR&txnscamt=" + TransactionServiceCharge
            + "&clientcode=" + ClientCode + "&txnid=" + TransactionID + "&date=" + TransactionDateTime + "&custacc=" + CustomerAccountNo + "&ru=" + ru + "&signature=" + signature;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls; // comparable to modern browsers
        HttpContext.Current.Response.Redirect(strurl, false);

    }

    public static string byteToHexString(byte[] byData)
    {
        StringBuilder sb = new StringBuilder((byData.Length * 2));
        for (int i = 0; (i < byData.Length); i++)
        {
            int v = (byData[i] & 255);
            if ((v < 16))
            {
                sb.Append('0');
            }

            sb.Append(v.ToString("X"));

        }

        return sb.ToString();
    }
}