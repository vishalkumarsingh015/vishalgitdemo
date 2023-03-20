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
using System.Web.Services;
using System.Web.Script.Services;

public partial class SuperAdmin_Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //fee collection chart    
    [WebMethod]
    public static List<GraphData> GetChartData()
    {
        string curr_session = month.getFinancialYear(System.DateTime.Now);
        string prev_year = "", next_year = "";
        if (curr_session.Contains("-"))
        {
            prev_year = curr_session.Split('-')[0].Trim();
            next_year = curr_session.Split('-')[1].Trim();
        }

        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[] {
                        new DataColumn("period", typeof(string)),
                        new DataColumn("fee_collection", typeof(int))
        });

        // Get Data from Database.
        int fee = 0;
        //April
        string period = get_data_monthly(prev_year + "-04", ref fee);
        dt.Rows.Add(period,fee);
        //May
        period = get_data_monthly(prev_year + "-05", ref fee);
        dt.Rows.Add(period, fee);
        //June
        period = get_data_monthly(prev_year + "-06", ref fee);
        dt.Rows.Add(period, fee);
        //July
        period = get_data_monthly(prev_year + "-07", ref fee);
        dt.Rows.Add(period, fee);
        //August
        period = get_data_monthly(prev_year + "-08", ref fee);
        dt.Rows.Add(period, fee);
        //September
        period = get_data_monthly(prev_year + "-09", ref fee);
        dt.Rows.Add(period, fee);
        //October
        period = get_data_monthly(prev_year + "-10", ref fee);
        dt.Rows.Add(period, fee);
        //November
        period = get_data_monthly(prev_year + "-11", ref fee);
        dt.Rows.Add(period, fee);
        //December
        period = get_data_monthly(prev_year + "-12", ref fee);
        dt.Rows.Add(period, fee);
        //January
        period = get_data_monthly(next_year + "-01", ref fee);
        dt.Rows.Add(period, fee);
        //February
        period = get_data_monthly(next_year + "-02", ref fee);
        dt.Rows.Add(period, fee);
        //March
        period = get_data_monthly(next_year + "-03", ref fee);
        dt.Rows.Add(period, fee);
        //dt.Rows.Add("2020-04", 2, 0, 0);
        //dt.Rows.Add("2020-05", 50, 15, 5);
        //dt.Rows.Add("2020-06", 15, 50, 23);
        //dt.Rows.Add("2020-07", 45, 12, 7);
        //dt.Rows.Add("2020-08", 20, 32, 55);
        //dt.Rows.Add("2020-09", 39, 67, 20);
        //dt.Rows.Add("2020-10", 20, 9, 5);
        //dt.Rows.Add("2020-11", 10, 32, 15);
        //dt.Rows.Add("2020-12", 22, 19, 25);
        //dt.Rows.Add("2021-01", 24, 39, 45);
        //dt.Rows.Add("2021-02", 27, 32, 15);
        //dt.Rows.Add("2021-03", 20, 43, 51);
        List<GraphData> chartData = new List<GraphData>();
        foreach (DataRow dr in dt.Rows)
        {
            chartData.Add(new GraphData
            {               
                fee_collection = (Convert.ToInt32(dr["fee_collection"]))
            });
        }

        return chartData;
    }
    static string get_data_monthly(string yr_mon, ref int fee)
    {
        SqlComan sql = new SqlComan();
        fee = 0;
        DataTable feereceipt = sql.GetDataTable("select SUM(CONVERT(float,receipt.paid_amt)) as paid_amount from receipt where CONVERT(varchar(7),CONVERT(datetime,receipt.paid_date,105),126)='" + yr_mon + "' and receipt.b_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "'  and receipt.status='Active'");
        //sql.GetDataTable("select distinct admis_id,class_id,section_id,session,CONVERT(varchar(7),CONVERT(datetime,dop,105),126) as dop, paid_amount,'feereceipt' as table_name from feereceipt where CONVERT(varchar(7),CONVERT(datetime,dop,105),126)='" + yr_mon + "' and b_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "'  and status='Active' union select type,details,amount,paid_date,CONVERT(varchar(7),CONVERT(datetime,paid_date,105),126) as dop, amount,'income' as table_name from income where CONVERT(varchar(7),CONVERT(datetime,paid_date,105),126)='" + yr_mon + "' and b_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "'  and status='Active' union select type,details,amount,paid_date,CONVERT(varchar(7),CONVERT(datetime,paid_date,105),126) as dop, amount,'expense' as table_name from expense where CONVERT(varchar(7),CONVERT(datetime,paid_date,105),126)='" + yr_mon + "' and b_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "' and status='Active'");
        if (feereceipt.Rows.Count > 0)
        {
            if (feereceipt.Rows[0]["paid_amount"].ToString() != "")
                fee = (int)double.Parse(feereceipt.Rows[0]["paid_amount"].ToString());
        }
        return yr_mon;
    }
}
public class GraphData
{
    public int fee_collection { get; set; }
}