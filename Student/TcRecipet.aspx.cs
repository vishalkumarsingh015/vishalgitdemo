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

public partial class Student_TcRecipet : System.Web.UI.Page
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
                        Response.Redirect("ApplyTc.aspx");
                    }
                    else if (Request.Params["f_code"].ToString() == "C")
                    {

                        Response.Redirect("ApplyTc.aspx");

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
                            string respHashKey = "e51eca524d903ece8b";
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
                                SqlCommand cmd1 = new SqlCommand("update Apply_tc set payment_status='paid' ,fee='" + postinamount + "',trans_id='" + resgistration + "' where Reg_No='" + resgistration + "'", con);
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
            DataTable dt = sql.GetDataTable(@"select * from Apply_tc as ta where ta.Reg_No='" + a + "'  ");

            if (dt.Rows.Count > 0)
            {
                lblregno.Text = dt.Rows[0]["Reg_No"].ToString();
                lblname.Text = dt.Rows[0]["Student_Name"].ToString();
                lblfather.Text = dt.Rows[0]["father_name"].ToString();
                lblfee.Text = dt.Rows[0]["fee"].ToString();
                lblstatus.Text = dt.Rows[0]["Payment_status"].ToString();
                lbltransid.Text = dt.Rows[0]["trans_id"].ToString();
                lblstream.Text = dt.Rows[0]["Stream"].ToString();
                lblhonours.Text = dt.Rows[0]["Honours"].ToString();
                lblfrom.Text = dt.Rows[0]["Session_from"].ToString();
                lblto.Text = dt.Rows[0]["Session_to"].ToString();
                lblroll_no.Text = dt.Rows[0]["Roll_no"].ToString();
                lblpassyear.Text = dt.Rows[0]["Passing_year"].ToString();
                lblrecipetdate.Text = dt.Rows[0]["addeddate"].ToString();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Page Error of GetData...');", true);
        }

    }
}