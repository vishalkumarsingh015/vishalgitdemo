using System;
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

/// <summary>
/// Summary description for msg
/// </summary>
public class msg
{
	public msg()
	{
		//
		// TODO: Add constructor logic here
		//
	} 

    public static void sendmsg_enquiry(string recipient, string mobile)
    {
        string msg = "Hello " + recipient + ",\nThank you For Visiting Us.\nHope To See You here soon.\nRegards\nBansal Classes Pvt. Ltd.\nTrishul Market, Gorakhnath Compound, East Boring Canal Road, Patna-1, Bihar 800001\nContact: 7070990942, 7634811444";
        // use the API URL here  
       // string strUrl = "http://bulksms.sunrisewebsolution.com/api/v2/sendsms?authkey=143027AtFBIJTH5e5a4b40&mobiles=" + mobile + "&message=" + msg + "&sender=CLIMAX&route=4&country=91";
        string strUrl = "http://sms.bulksmsind.in/sendSMS?username=ratansharma&message=" + msg + "&sendername=BANSAL&smstype=TRANS&numbers=" + mobile + "&apikey=437448ba-1297-4cf7-8788-13291d05b90a";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }

    public static void send_sch_msg_enquiry(string recipient, string mobile, string curr_date, string followup_date)
    {
        string msg = "Hello " + recipient + ",\nHope You Are Doing Well.\nYou visited us at\n" + curr_date + " and told to contact us again on " + followup_date + ".\nWe are waiting for your response.\nRegards\nBansal Classes Pvt. Ltd.\nTrishul Market, Gorakhnath Compound, East Boring Canal Road, Patna-1, Bihar 800001\nContact: 7070990942, 7634811444";
        DateTime regis = DateTime.ParseExact(followup_date, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
        string sch_date = regis.ToString("yy-MM-dd") + " 10:05:00";
        // use the API URL here 
       // string strUrl = "http://bulksms.sunrisewebsolution.com/api/v2/sendsms?authkey=143027AtFBIJTH5e5a4b40&mobiles=" + mobile + "&message=" + msg + "&sender=CLIMAX&route=4&schtime=" + sch_date + "";
        string strUrl = "http://sms.bulksmsind.in/sendSMS?username=ratansharma&apikey=437448ba-1297-4cf7-8788-13291d05b90a&scheduled=" + sch_date + "&message=" + msg + "&sendername=BANSAL&smstype=TRANS&numbers=" + mobile + "";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }

    public static void sendmsg_feestatus(string recipient, string mobile, string fee,string course_name)
    {
        string msg = "Hello " + recipient + ",\nYou Have Successfully Paid Rs. " + fee + ".00 Today For Courses " + course_name + ".\nRegards\nBansal Classes Pvt. Ltd.\nTrishul Market, Gorakhnath Compound, East Boring Canal Road, Patna-1, Bihar 800001\nContact: 7070990942, 7634811444";
        // use the API URL here  
        //string strUrl = "http://bulksms.sunrisewebsolution.com/api/v2/sendsms?authkey=143027AtFBIJTH5e5a4b40&mobiles=" + mobile + "&message=" + msg + "&sender=CLIMAX&route=4&country=91";
        string strUrl = "http://sms.bulksmsind.in/sendSMS?username=ratansharma&message=" + msg + "&sendername=BANSAL&smstype=TRANS&numbers=" + mobile + "&apikey=437448ba-1297-4cf7-8788-13291d05b90a";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }

    public static void sendmsg_admission( string recipient, string mobile,string[] username, string pwd)
    {
        string msg = "Hello " + recipient + ",\nThank you For Choosing Us.\nWe really cherish your association with our organisation.\nStudent Login Credential:\nUserName:" + username[0] + "\nPassword:" + pwd + "\nParent Login Credential:\nUsername:" + username[1] + "\nPassword:" + pwd + "\nPlease note that UserName/Password are case-sensitive.\nRegards\nBansal Classes Pvt. Ltd.\nTrishul Market, Gorakhnath Compound, East Boring Canal Road, Patna-1, Bihar 800001\nContact: 7070990942, 7634811444";
        // use the API URL here  
        //string strUrl = "http://bulksms.sunrisewebsolution.com/api/v2/sendsms?authkey=143027AtFBIJTH5e5a4b40&mobiles=" + mobile + "&message=" + msg + "&sender=CLIMAX&route=4&country=91";
        string strUrl = "http://sms.bulksmsind.in/sendSMS?username=ratansharma&message=" + msg + "&sendername=BANSAL&smstype=TRANS&numbers=" + mobile + "&apikey=437448ba-1297-4cf7-8788-13291d05b90a";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }
}