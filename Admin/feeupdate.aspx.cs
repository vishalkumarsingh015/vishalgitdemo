using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_feeupdate : System.Web.UI.Page
{
    string id, img1, img2;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void save_Click(object sender, EventArgs e)
    {
        if (txtcaste.SelectedValue == "TC")
        {

            int a = sql.ExecuteSql(@"update apply_tc set payment_status = 'paid', trans_id = '" + txtrefrence.Text + "', fee = '" + txtfee.Text + "' where  reg_no='" + txtrefrence.Text + "'");
            if (a > 0)
            {
                txtrefrence.Text = "";
                txtfee.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('TC UPDATED!');", true);
            }
        }
        else if (txtcaste.SelectedValue == "Charactor")
        {


            int a = sql.ExecuteSql(@"update apply_charctor set payment_status = 'paid', tran_id = '" + txtrefrence.Text + "', fee = '" + txtfee.Text + "' where  reg_no='" + txtrefrence.Text + "'");
            if (a > 0)
            {
                txtrefrence.Text = "";
                txtfee.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Charactor UPDATED!');", true);
            }

        }
        else if (txtcaste.SelectedValue == "PG2022")
        {
            int a = sql.ExecuteSql(@"update tblpgADMISSION_3rd_2020_22 set payment = 'paid', tran_id = '" + txtrefrence.Text + "', fee = '" + txtfee.Text + "', roll = '"+ getrollpg() + "' where  reg_no='" + txtrefrence.Text + "'");
            if (a > 0)
            {
                txtrefrence.Text = "";
                txtfee.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('PG2022 UPDATED!');", true);
            }
        }
        else if (txtcaste.SelectedValue == "UG")
        {


            int a = sql.ExecuteSql(@"update tblugPart1Addmission_2020_25 set payment = 'paid', tran_id = '" + txtrefrence.Text + "', fee = '" + txtfee.Text + "', roll = '" + getroll() + "' where  reg_no='" + txtrefrence.Text + "' and toa='3rd'");
            if (a > 0)
            {
                txtrefrence.Text = "";
                txtfee.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('UG UPDATED!');", true);
            }
        }
        else if (txtcaste.SelectedValue == "Inter")
        {


            int a = sql.ExecuteSql(@"update tblinterAddmission_2022_24 set payment = 'paid', tran_id = '" + txtrefrence.Text + "', fee = '" + txtfee.Text + "', roll_no = '" + getrollenter() + "' where  reg_no='" + txtrefrence.Text + "' and toa='2nd' ");

            if (a > 0)
            {
                txtrefrence.Text = "";
                txtfee.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Inter UPDATED!');", true);
            }

        }
        


    }


    public string getroll()
    {
        string ab = "";
        DataTable dt = sql.GetDataTable("select (max(cast(roll as int))+1) as a from tblugPart1Addmission_2020_25  where Subject_hons=(select distinct Subject_hons from tblugPart1Addmission_2020_25 where Reg_No='" + txtrefrence.Text + "') ");
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


    public string getrollpg()
    {
        string ab = "";
        DataTable dt = sql.GetDataTable("select (max(cast(roll as int))+1) as a from tblpgADMISSION_3rd_2020_22  where Subject_stream=(select Subject_stream from tblpgADMISSION_3rd_2020_22 where Reg_No='" + txtrefrence.Text + "') ");
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

    public string getrollenter()
    {
        string ab = "";
        DataTable dt = sql.GetDataTable("select (max(cast(roll_no as int))+1) as a from tblinterAddmission_2022_24  where stream=(select distinct stream from tblinterAddmission_2022_24 where Reg_No='" + txtrefrence.Text + "') ");
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