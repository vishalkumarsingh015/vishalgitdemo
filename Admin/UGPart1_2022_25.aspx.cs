using System;
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

public partial class UGPart1_2022_25 : System.Web.UI.Page
{
    string img1, img2, img3, img4, img5, img6, img7, img8;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            Image1.ImageUrl = "images/studenticon.png";
            Image2.ImageUrl = "images/signature.png";
            Image3.ImageUrl = "images/document.png";
            Image4.ImageUrl = "images/document.png";
            Image5.ImageUrl = "images/document.png";
            Image6.ImageUrl = "images/document.png";
            Document.Visible = false;
            Pro.Visible = true;
            btnpay.Visible = false;
            btnsave.Visible = true;
            getlogin();
         

        }

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {

        try
        {
          


            int i = sql.ExecuteSql(@"insert into [tblugPart1Addmission_2020_25]  (Reg_No, Subject_hons, Session, Name, fathername, Mothername, Mobile_No, Aadhar_no, DOB, Gender, Category, Sub_Category, Domicile, Dom_Cert, Religion, EWS, Minority, Nationality, Cast, Subject_Honours, Subsidery1, Subsidery2,
                                            Composition, [10_thboard], [10_passyear], [10_throll_code], [10_thmarks], [10_thobtained_mark], [12_thboard], [12_passyear], [12_throll_code], [12_thmarks], [12_thobtained_mark], BA_BSC_thboard, BA_BSC_passyear, BA_BSC_throll_code, BA_BSC_thmarks, BA_BSC_thobtained_mark,
                                            addedby,status,addeddate,address,email,ppu) values 
                ('" + txtregno.Text + "','" + lblstream.Text + "','" + txtsession.Text + "','" + txtname.Text + "','" + txtfather.Text + "','" + txtmom.Text + "','" + txtmobile.Text + "','" + txtaadhar.Text + "','" + DOB.Text + "'," +
                "'" + ddlgender.SelectedValue + "','" + ddlcategory.SelectedValue + "','" + txtsubcategory.Text + "','" + txtDomicile.Text + "','" + ddldom_certi.SelectedValue + "','" + txtreligion.Text + "','" + ddlews.SelectedValue + "','" + txtMinority.Text + "','" + txtnation.SelectedValue + "','" + TextBox13.Text + "','" + txthounours.Text + "','" + ddlSubsidery1.SelectedValue + "','" + ddlSubsidery2.SelectedValue + "'," +
                "'" + ddlcomposition.SelectedValue + "','" + txt10thboard.Text + "','" + txt10passingyear.Text + "','" + txt10thRoll.Text + "','" + txt10thmaxmarks.Text + "','" + txt10thObtained_Marks.Text + "','" + txt12thboard.Text + "','" + txt12passingyear.Text + "','" + txt12thRoll.Text + "','" + txt12thmaxmarks.Text + "','" + txt12thObtained_Marks.Text + "','" + txtotherboard.Text + "','" + txtotherpassingyear.Text + "','" + txtotherRoll.Text + "','" + txtothermaxmarks.Text + "','" + txtotherObtained_Marks.Text + "'," +
                "'" + txtregno.Text + "','Active','" + System.DateTime.UtcNow.AddMinutes(330).ToString() + "','" + txtaddress.Text + "','" + txtemail.Text + "','" + PPu.Text + "')");
            if (i > 0)
            {
                Document.Visible = true;
                Pro.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Is Not Saved ');", true);
            }
        }

        catch (Exception exc)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + exc.ToString() + "');", true);
        }
    }
    protected void update_docu(object sender, EventArgs e)
    {
        int i = 0;

        if (FileUpload1.HasFile)
            img1 = SaveFile(FileUpload1);
        if (FileUpload2.HasFile)
            img2 = SaveFile(FileUpload2);
        if (FileUpload3.HasFile)
            img3 = SaveFile(FileUpload3);
        if (FileUpload4.HasFile)
            img4 = SaveFile(FileUpload4);
        if (FileUpload5.HasFile)
            img5 = SaveFile(FileUpload5);
        if (FileUpload6.HasFile)
            img6 = SaveFile(FileUpload6);


        i = sql.ExecuteSql("update [ ] set Photo='" + img1 + "',Sign='" + img2 + "',[Part_1marksheet]='" + img3 + "',[Part1_admitcard]='" + img4 + "',Caste_certificate='" + img5 + "',Income_certificate='" + img6 + "' where reg_no='" + lblref.Text + "'");
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thank you for apply');", true);
            payment(lblref.Text, lblrate.Value);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Not Apply" + lblref.Text + "');", true);
        }
    }

    protected void pay(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('ADMISSION CLOSED ! ');", true);
        payment(lblref.Text, lblrate.Value);

    }

    public void payment(string id, string ammout)
    {

        //string jk = "https://payment.atomtech.in/paynetz/epi/fts?login=126647&pass=8466d6b9&ttype=NBFundTransfer&prodid=COLLEGE&amt=50&txncurr=INR&txnscamt=0&clientcode=001&txnid=123&custacc=11238950188&date=13/08/2021&ru=http://bluebusline.in/success.aspx";
        string strClientCode, strClientCodeEncoded;
        byte[] b;
        string udf9 = id;
        string MerchantLogin = "341447";
        string MerchantPass = "87c604b5";
        string TransactionType = "NBFundTransfer";
        string ProductID = "COLLEGE";
        string TransactionID = id;
        string TransactionAmount = ammout;
        string TransactionCurrency = "INR";
        string CustomerAccountNo = "37341346459";
        string ClientCode = "007";
        string TransactionServiceCharge = "00";
        string TransactionDateTime = System.DateTime.UtcNow.AddMinutes(330).ToString("MM/dd/yyyy hh:mm tt");
        string ru = "https://www.anscollege.ac.in/UGPart1_receipt_2022_25.aspx";
        string reqHashKey = "60310d68c943666c51";

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
    public string SaveFile(FileUpload file)
    {
        string fileName = "";
        // Specify the path to save the uploaded file to.
        String savePath = Server.MapPath("img/");


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
    protected void sub(string a)
    {

        using (SqlCommand cmd = new SqlCommand("select * from UG_Subsiderylist where Subject_hons='" + a + "'", con))
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            ddlSubsidery1.DataSource = cmd.ExecuteReader();
            ddlSubsidery1.DataTextField = "Subject";
            ddlSubsidery1.DataValueField = "Subject";
            ddlSubsidery1.DataBind();
            con.Close();
            con.Open();
            ddlSubsidery2.DataSource = cmd.ExecuteReader();
            ddlSubsidery2.DataTextField = "Subject";
            ddlSubsidery2.DataValueField = "Subject";
            ddlSubsidery2.DataBind();

            ddlSubsidery1.Items.Insert(0, new ListItem("--Select Paper--", "0"));
            ddlSubsidery2.Items.Insert(0, new ListItem("--Select Paper--", "0"));

            con.Close();

        }
    }
    protected void getlogin()
    {
        try
        {

            string reg_noo = Request.Cookies["BLUHJHS"].Value;

            if (Request.Cookies["BLUHJHS"].Value != null)
            {
                DataTable dt = new DataTable();
                dt = sql.GetDataTable("select * from [tblugPart1_list_2022_25] where Reg_no='" + reg_noo + "'  ");
                if (dt.Rows.Count > 0)
                {

                    lblregistration.Text = lblregistration1.Text = txtregno.Text = lblref.Text = dt.Rows[0]["Reg_no"].ToString();
                    lblname1.Text = lblname.Text = txtname.Text = dt.Rows[0]["name"].ToString();
                    lblsession1.Text = lblsession.Text = txtsession.Text = dt.Rows[0]["SESSION"].ToString();
                    txtfather.Text = dt.Rows[0]["Fathername"].ToString();

                    txtmom.Text = dt.Rows[0]["b_group"].ToString();
                    ddlgender.SelectedValue = dt.Rows[0]["Gender"].ToString();

                    txtaddress.Text = dt.Rows[0]["address"].ToString();
                    txtmobile.Text = dt.Rows[0]["Mobile_No"].ToString();
                    DOB.Text = dt.Rows[0]["dob"].ToString();
                    txtemail.Text = dt.Rows[0]["email_id"].ToString();
                    ddlcategory.SelectedValue = dt.Rows[0]["Category"].ToString();
                    txthounours.Text = dt.Rows[0]["Subject_honours"].ToString();
                    lblstream1.Text = lblstream.Text = dt.Rows[0]["Subject_hons"].ToString();
                    sub(dt.Rows[0]["Subject_hons"].ToString());
                    string a = ddlcategory.SelectedValue.ToUpper().Trim();
                    string b = dt.Rows[0]["Subject_hons"].ToString().ToUpper().Trim();
                    string c = dt.Rows[0]["Gender"].ToString().ToUpper().Trim();
                    string e = dt.Rows[0]["Subject_honours"].ToString().ToUpper().Trim();
                    int rate = 0;
                    if (b == "B.SC.")
                    {
                        if (e == "MATHEMATICS" || e== "CHEMISTRY" || e=="PHYSICS")
                        {
                            if (c == "FEMALE")
                            {
                                rate = 2000;
                            }
                            else
                            {

                                if (a == "GENERAL" || a == "BC-II")
                                {
                                    rate = 3632;
                                }
                                else if (a == "BC-I")
                                {
                                    rate = 3548;
                                }
                                else
                                {
                                    rate = 2000;
                                }

                            }


                        }
                        else
                        {

                            if (c == "FEMALE")
                            {
                                rate = 2500;
                            }
                            else
                            {

                                if (a == "GENERAL" || a == "BC-II")
                                {
                                    rate = 4132;
                                }
                                else if (a == "BC-I")
                                {
                                    rate = 4048;
                                }
                                else
                                {
                                    rate = 2500;
                                }

                            }
                        }
                    }
                    else
                    {
                        if (c == "FEMALE")
                        {
                            rate = 1500;
                        }
                        else
                        {
                            if (a == "GENERAL" || a == "BC-II")
                            {
                                rate = 3119;
                            }
                            else if (a == "BC-I")
                            {
                                rate = 3041;
                            }
                            else
                            {
                                rate = 1500;
                            }

                        }
                    }

                    lblrate.Value = rate.ToString();
                 
                }
                DataTable st = sql.GetDataTable("select * from [tblugPart1Addmission_2020_25] where reg_no='" + reg_noo + "' ");
                if (st.Rows.Count > 0)
                {
                    if (st.Rows[0]["payment"].ToString() == "paid")
                    {
                        Session["BeforeMsg"] = "Code written Before page Redirecting";


                        Response.Redirect("UGPart1_receipt_2022_25.aspx?id=" + lblref.Text, false);


                        Session["after"] = "code written after page Redirecting";
                    }
                    if (st.Rows[0]["Sign"].ToString() == "")
                    {
                        Document.Visible = true;

                        Pro.Visible = false;

                    }
                    else
                    {
                        Document.Visible = false;
                        btnsave.Visible = false;
                        Pro.Visible = true;
                        btnpay.Visible = true;

                    }
                }



            }
            else
            {
                Response.Redirect("default.aspx");

            }
        }
        catch (Exception ex)
        {

            Response.Redirect("default.aspx");
        }

    }

}