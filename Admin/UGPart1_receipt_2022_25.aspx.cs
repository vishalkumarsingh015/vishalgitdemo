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

public partial class UGPart1_receipt_2022_25 : System.Web.UI.Page
{
    string id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



    protected void Page_Load(object sender, EventArgs e)
    {

        int aas = 0;
        if (!IsPostBack)
        {
            try
            {
                string a = Request.Params["f_code"].ToString();
                aas = 1;

            }
            catch
            {

            }
            try
            {
                string a = Request.QueryString["id"].ToString();
                aas = 2;
            }
            catch
            {

            }
        }



        try
        {
            if (!IsPostBack)
            {
                if (aas == 1)
                {

                    string a = Request.Params["f_code"].ToString();
                    NameValueCollection nvc = Request.Form;
                    if (Request.Params["f_code"].ToString() == "F")
                    {
                        Response.Redirect("PG3rdaddmission.aspx");
                    }
                    else if (Request.Params["f_code"].ToString() == "C")
                    {

                        Response.Redirect("PG3rdaddmission.aspx");

                    }
                    else if (Request.Params["f_code"].ToString() == "Ok")
                    {
                        //Response.Redirect("view.aspx?id=" + Request.Params["udf9"].ToString());
                        if (Request.Params["mmp_txn"] != null)
                        {
                            string postingmmp_txn = Request.Params["mmp_txn"].ToString();
                            string postingmer_txn = Request.Params["mer_txn"].ToString();
                            string postinamount = Request.Params["amt"].ToString();
                            string postingprod = Request.Params["prod"].ToString();
                            string postingdate = Request.Params["date"].ToString();
                            string postingbank_txn = Request.Params["bank_txn"].ToString();
                            string postingf_code = Request.Params["f_code"].ToString();
                            string postingbank_name = Request.Params["bank_name"].ToString();
                            string signature = Request.Params["signature"].ToString();
                            string postingdiscriminator = Request.Params["discriminator"].ToString();
                            string resgistration = Request.Params["mer_txn"].ToString();
                            //lblricha.Text = resgistration.ToString();
                            string respHashKey = "86824d84f58fbe3090";
                            string ressignature = "";
                            string strsignature = postingmmp_txn + postingmer_txn + postingf_code + postingprod + postingdiscriminator + postinamount + postingbank_txn;
                            //string strsignature = postingmmp_txn + postingmer_txn1 + postingf_code + postingprod + discriminator + postinamount + postingbank_txn;
                            byte[] bytes = Encoding.UTF8.GetBytes(respHashKey);
                            byte[] b = new System.Security.Cryptography.HMACSHA512(bytes).ComputeHash(Encoding.UTF8.GetBytes(strsignature));
                            ressignature = byteToHexString(b).ToLower();

                            if (signature == ressignature)
                            {
                                //lblStatus.Text = "Signature matched...";
                                bool IsUpdated = false;
                                con.Open();
                                SqlCommand cmd1 = new SqlCommand("update tblugPart1Addmission_2020_25 set payment='paid' ,fee='" + postinamount + "',tran_id='" + resgistration + "',roll=" + getroll(resgistration) + "  where Reg_No='" + resgistration + "'", con);
                                IsUpdated = cmd1.ExecuteNonQuery() > 0;
                                con.Close();

                                getdata(resgistration);

                            }
                            else
                            {
                                Response.Redirect("default.aspx");
                            }
                        }
                    }
                }
                else if (aas == 2)
                {
                    id = Request.QueryString["id"].ToString();
                    getdata(id);
                }
                else
                {
                }

            }
        }

        catch (Exception ex)
        {
            Response.Redirect("default.aspx");
        }




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

    SqlComan sql = new SqlComan();

    protected void getdata(string a)
    {
        try
        {
            DataTable dt = sql.GetDataTable(@"select * from tblugPart1Addmission_2020_25 as ta     where ta.Reg_No='" + a + "'  ");

            if (dt.Rows.Count > 0)
            {

                Resgis.Text = dt.Rows[0]["Reg_No"].ToString();
                S_name.Text = dt.Rows[0]["Name"].ToString();
                F_name.Text = dt.Rows[0]["fathername"].ToString();
                M_name.Text = dt.Rows[0]["Mothername"].ToString();

                rollno.Text = dt.Rows[0]["roll"].ToString();
                Image1.ImageUrl = "img/" + dt.Rows[0]["photo"].ToString();
                Image2.ImageUrl = "img/" + dt.Rows[0]["sign"].ToString();

                Label13.Text = DOB.Text = dt.Rows[0]["addeddate"].ToString();

                lblcourse.Text = dt.Rows[0]["Subject_hons"].ToString();
                lblcoposition.Text = Composition.Text = dt.Rows[0]["Composition"].ToString();
                lblSubsidiary_1.Text = lbllSubsidery1.Text = dt.Rows[0]["Subsidery1"].ToString();
                lblSubsidiary_2.Text = lbllSubsidery2.Text = dt.Rows[0]["Subsidery2"].ToString();
                lblhnours.Text = dt.Rows[0]["Subject_Honours"].ToString();

                lbltrans_id.Text = dt.Rows[0]["tran_id"].ToString();
                Label2.Text = dt.Rows[0]["fee"].ToString();
                ///application form//
                lblname1.Text = dt.Rows[0]["Name"].ToString();
                lblstream1.Text = dt.Rows[0]["Subject_hons"].ToString();
                lblroll1.Text = dt.Rows[0]["roll"].ToString();
                lbluan1.Text = dt.Rows[0]["Reg_No"].ToString();
                lblsession1.Text = dt.Rows[0]["session"].ToString();
                lbladmissiondate1.Text = dt.Rows[0]["addeddate"].ToString();
                lblsubject1.Text = dt.Rows[0]["Subject_Honours"].ToString();
                lblfname1.Text = dt.Rows[0]["fathername"].ToString();
                lblmname1.Text = dt.Rows[0]["Mothername"].ToString();
                lbldob1.Text = dt.Rows[0]["DOB"].ToString();
                lblgender1.Text = dt.Rows[0]["Gender"].ToString();
                lblaadhar1.Text = dt.Rows[0]["Aadhar_no"].ToString();
                lbldomivile1.Text = dt.Rows[0]["Domicile"].ToString();
                lbldomceri1.Text = dt.Rows[0]["Dom_Cert"].ToString();
                lblcategory1.Text = dt.Rows[0]["Category"].ToString();
                lblsubcat1.Text = dt.Rows[0]["Sub_Category"].ToString();
                lblreligion1.Text = dt.Rows[0]["Religion"].ToString();
                lblews1.Text = dt.Rows[0]["EWS"].ToString();
                lblminority1.Text = dt.Rows[0]["Minority"].ToString();
                lblcast1.Text = dt.Rows[0]["Cast"].ToString();
                lblnation1.Text = dt.Rows[0]["Nationality"].ToString();
                lblmob1.Text = dt.Rows[0]["Mobile_No"].ToString();
                lblmail1.Text = dt.Rows[0]["email"].ToString();
             

                //   Ba_Bscmarksheet, Ma_mscmarksheet, Ma_msc_admitcard, Caste_certificate, Income_certificate, TOA, addedby, addeddate, updatedby, updateddate, status, Payment, FEE, tran_id, roll

                
                lblPPU.Text = dt.Rows[0]["ppu"].ToString();
                lblperaddress.Text = dt.Rows[0]["address"].ToString();
                lblfee.Text = dt.Rows[0]["fee"].ToString();
                lblmatricboard.Text = dt.Rows[0]["10_thboard"].ToString();
                lblmatpassingyear.Text = dt.Rows[0]["10_passyear"].ToString();
                lblmatroll.Text = dt.Rows[0]["10_throll_code"].ToString();
                lblmatricmarks.Text = dt.Rows[0]["10_thmarks"].ToString();
                lblmatricobtain.Text = dt.Rows[0]["10_thobtained_mark"].ToString();
                lblinterboard.Text = dt.Rows[0]["12_thboard"].ToString();
                lblinteryear.Text = dt.Rows[0]["12_passyear"].ToString();
                lblinterroll.Text = dt.Rows[0]["12_throll_code"].ToString();
                lblintermarks.Text = dt.Rows[0]["12_thmarks"].ToString();
                lblinterobtain.Text = dt.Rows[0]["12_thobtained_mark"].ToString();
                lblpgboard.Text = dt.Rows[0]["BA_BSC_thboard"].ToString();
                lblpgyear.Text = dt.Rows[0]["BA_BSC_passyear"].ToString();
                lblpgroll.Text = dt.Rows[0]["BA_BSC_throll_code"].ToString();
                lblpgmarks.Text = dt.Rows[0]["BA_BSC_thmarks"].ToString();
                lblpgobtain.Text = dt.Rows[0]["BA_BSC_thobtained_mark"].ToString();

                imgphoto.ImageUrl = "img/" + dt.Rows[0]["photo"].ToString();
                imgsign.ImageUrl = "img/" + dt.Rows[0]["sign"].ToString();





            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
                Response.Redirect("");
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
            Response.Redirect("");
        }

    }

    public string getroll(string lund)
    {
        string ab = "";
        DataTable dt = sql.GetDataTable("select (max(cast(roll as int))+1) as a from tblugPart1Addmission_2020_25  where Subject_hons=(select Subject_hons from tblugPart1Addmission_2020_25 where Reg_No='" + lund + "') ");
        if (dt.Rows[0]["a"].ToString() == "")
        {
            ab = "1";
        }
        else
        {
            ab = dt.Rows[0]["a"].ToString();
        }
        return ab;
    }
}