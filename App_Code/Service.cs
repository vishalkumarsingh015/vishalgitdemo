using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data;

/// <summary>
/// Summary description for Service
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Service : System.Web.Services.WebService {

    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetStudentDetailsForAdmin(string admis_id)
    {
        List<string> stResult = new List<string>();

        DataTable dt = new SqlComan().GetDataTable("select current_status.class_id,current_status.section_id,class.class_name,section.section_name,student_data.*,REPLACE(current_status.session,'-','to') as session,current_status.admis_id,convert(varchar,convert(datetime,student_data.dob,105),106) as dob_format,convert(varchar,convert(datetime,admission.doa,105),106) as doa from current_status inner join admission on current_status.admis_id=admission.admis_id inner join student_data on current_status.stu_id=student_data.stu_id inner join class on current_status.class_id=class.class_id inner join section on current_status.section_id=section.section_id where admission.status='Active' and current_status.status='Active' and current_status.b_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "' and (current_status.admis_id like '" + admis_id + "%' or student_data.sname like '" + admis_id + "%' or student_data.mobile like '" + admis_id + "%'  or class.class_name like '" + admis_id + "%')");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
                stResult.Add(string.Format("{0}~{1}~{2}~{3}~{4}~{5}~{6}~{7}~{8}~{9}~{10}~{11}~{12}~{13}~{14}", dt.Rows[i]["admis_id"].ToString(), dt.Rows[i]["sname"].ToString() + " (" + dt.Rows[i]["mobile"].ToString() + ") / " + dt.Rows[i]["class_name"].ToString() + "(" + dt.Rows[i]["section_name"].ToString() + ") / " + dt.Rows[i]["session"].ToString(), dt.Rows[i]["s_photo"].ToString(), dt.Rows[i]["sname"].ToString(), dt.Rows[i]["class_name"].ToString() + "(" + dt.Rows[i]["section_name"].ToString() + ")", dt.Rows[i]["doa"].ToString(), dt.Rows[i]["dob_format"].ToString(), dt.Rows[i]["fname"].ToString(), dt.Rows[i]["mname"].ToString(), dt.Rows[i]["aadhar_no"].ToString(), dt.Rows[i]["mobile"].ToString(), dt.Rows[i]["residential_add"].ToString(), dt.Rows[i]["class_id"].ToString(), dt.Rows[i]["section_id"].ToString(), dt.Rows[i]["session"].ToString()));
        }
        return stResult.ToArray();
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetStudentDetailsForEmployee(string admis_id)
    {
        List<string> stResult = new List<string>();

        DataTable dt = new SqlComan().GetDataTable("select current_status.class_id,current_status.section_id,class.class_name,section.section_name,student_data.*,REPLACE(current_status.session,'-','to') as session,current_status.admis_id,convert(varchar,convert(datetime,student_data.dob,105),106) as dob_format,convert(varchar,convert(datetime,admission.doa,105),106) as doa from current_status inner join admission on current_status.admis_id=admission.admis_id inner join student_data on current_status.stu_id=student_data.stu_id inner join class on current_status.class_id=class.class_id inner join section on current_status.section_id=section.section_id where admission.status='Active' and current_status.status='Active' and current_status.b_id=(select b_id from employee where emp_id='" + HttpContext.Current.Request.Cookies["user_id"].Value + "') and (current_status.admis_id like '" + admis_id + "%' or student_data.sname like '" + admis_id + "%' or student_data.mobile like '" + admis_id + "%'  or class.class_name like '" + admis_id + "%')");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
                stResult.Add(string.Format("{0}~{1}~{2}~{3}~{4}~{5}~{6}~{7}~{8}~{9}~{10}~{11}~{12}~{13}~{14}", dt.Rows[i]["admis_id"].ToString(), dt.Rows[i]["sname"].ToString() + " (" + dt.Rows[i]["mobile"].ToString() + ") / " + dt.Rows[i]["class_name"].ToString() + "(" + dt.Rows[i]["section_name"].ToString() + ") / " + dt.Rows[i]["session"].ToString(), dt.Rows[i]["s_photo"].ToString(), dt.Rows[i]["sname"].ToString(), dt.Rows[i]["class_name"].ToString() + "(" + dt.Rows[i]["section_name"].ToString() + ")", dt.Rows[i]["doa"].ToString(), dt.Rows[i]["dob_format"].ToString(), dt.Rows[i]["fname"].ToString(), dt.Rows[i]["mname"].ToString(), dt.Rows[i]["aadhar_no"].ToString(), dt.Rows[i]["mobile"].ToString(), dt.Rows[i]["residential_add"].ToString(), dt.Rows[i]["class_id"].ToString(), dt.Rows[i]["section_id"].ToString(), dt.Rows[i]["session"].ToString()));
        }
        return stResult.ToArray();
    } 
}
