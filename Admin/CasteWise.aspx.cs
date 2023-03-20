using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.IO;

public partial class Branch_CasteWise : System.Web.UI.Page
{
    SqlComan sql = new SqlComan();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                stu_div.Visible = false;
                bindsession();
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
        ddlsession.DataSource = list;
        ddlsession.DataBind();
        ddlsession.Items.Insert(0, new ListItem("---Select Session---", "0"));
    }
    protected void search_Click(object sender, EventArgs e)
    {
        stu_div.Visible = true;
        DataTable dt = sql.GetDataTable("select * from class where status='Active' and b_id='" + Request.Cookies["user_id"].Value + "'");
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        if (Repeater1.Items.Count > 0)
        {
            DataTable dtt = sql.GetDataTable("select *,vir.status as transfer_status,convert(varchar,vir.addeddate,105) as doss from student_data inner join (select class_id,admis_id,stu_id,status,addeddate from current_status where current_status.session='" + ddlsession.SelectedValue + "' and current_status.status='Active' union select class_id,admis_id,stu_id,transfer_status,addeddate from class_record where class_record.session='" + ddlsession.SelectedValue + "' and class_record.status='Active') as vir on student_data.stu_id=vir.stu_id");
            if (dtt.Rows.Count > 0)
            {
                int t_m = 0, t_f = 0, t_t = 0, g_m = 0, g_f = 0, g_t = 0, o_m = 0, o_f = 0, o_t = 0, s_m = 0, s_f = 0, s_t = 0, st_m = 0, st_f = 0, st_t = 0, ot_m = 0, ot_f = 0, ot_t = 0;
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    Label class_id = item.FindControl("class_id") as Label;

                    //male student
                    var dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male");
                    ((Label)(item.FindControl("t_m"))).Text = dr.Count().ToString();
                    t_m = t_m + int.Parse(((Label)(item.FindControl("t_m"))).Text);
                    //female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female");
                    ((Label)(item.FindControl("t_f"))).Text = dr.Count().ToString();
                    t_f = t_f + int.Parse(((Label)(item.FindControl("t_f"))).Text);
                    //total male female student
                    ((Label)(item.FindControl("t_t"))).Text = (int.Parse(((Label)(item.FindControl("t_m"))).Text) + int.Parse(((Label)(item.FindControl("t_f"))).Text)).ToString();
                    t_t = t_t + int.Parse(((Label)(item.FindControl("t_t"))).Text);
                    //general male student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male" && x.Field<string>("caste") == "General");
                    ((Label)(item.FindControl("g_m"))).Text = dr.Count().ToString();
                    g_m = g_m + int.Parse(((Label)(item.FindControl("g_m"))).Text);
                    //general female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female" && x.Field<string>("caste") == "General");
                    ((Label)(item.FindControl("g_f"))).Text = dr.Count().ToString();
                    g_f = g_f + int.Parse(((Label)(item.FindControl("g_f"))).Text);
                    //general total male female student
                    ((Label)(item.FindControl("g_t"))).Text = (int.Parse(((Label)(item.FindControl("g_m"))).Text) + int.Parse(((Label)(item.FindControl("g_f"))).Text)).ToString();
                    g_t = g_t + int.Parse(((Label)(item.FindControl("g_t"))).Text);
                    //obc male student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male" && x.Field<string>("caste") == "OBC");
                    ((Label)(item.FindControl("o_m"))).Text = dr.Count().ToString();
                    o_m = o_m + int.Parse(((Label)(item.FindControl("o_m"))).Text);
                    //obc female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female" && x.Field<string>("caste") == "OBC");
                    ((Label)(item.FindControl("o_f"))).Text = dr.Count().ToString();
                    o_f = o_f + int.Parse(((Label)(item.FindControl("o_f"))).Text);
                    //obc total male female student
                    ((Label)(item.FindControl("o_t"))).Text = (int.Parse(((Label)(item.FindControl("o_m"))).Text) + int.Parse(((Label)(item.FindControl("o_f"))).Text)).ToString();
                    o_t = o_t + int.Parse(((Label)(item.FindControl("o_t"))).Text);
                    //sc male student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male" && x.Field<string>("caste") == "SC");
                    ((Label)(item.FindControl("s_m"))).Text = dr.Count().ToString();
                    s_m = s_m + int.Parse(((Label)(item.FindControl("s_m"))).Text);
                    //sc female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female" && x.Field<string>("caste") == "SC");
                    ((Label)(item.FindControl("s_f"))).Text = dr.Count().ToString();
                    s_f = s_f + int.Parse(((Label)(item.FindControl("s_f"))).Text);
                    //sc total male female student
                    ((Label)(item.FindControl("s_t"))).Text = (int.Parse(((Label)(item.FindControl("s_m"))).Text) + int.Parse(((Label)(item.FindControl("s_f"))).Text)).ToString();
                    s_t = s_t + int.Parse(((Label)(item.FindControl("s_t"))).Text);
                    //st male student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male" && x.Field<string>("caste") == "ST");
                    ((Label)(item.FindControl("st_m"))).Text = dr.Count().ToString();
                    st_m = st_m + int.Parse(((Label)(item.FindControl("st_m"))).Text);
                    //st female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female" && x.Field<string>("caste") == "ST");
                    ((Label)(item.FindControl("st_f"))).Text = dr.Count().ToString();
                    st_f = st_f + int.Parse(((Label)(item.FindControl("st_f"))).Text);
                    //st total male female student
                    ((Label)(item.FindControl("st_t"))).Text = (int.Parse(((Label)(item.FindControl("st_m"))).Text) + int.Parse(((Label)(item.FindControl("st_f"))).Text)).ToString();
                    st_t = st_t + int.Parse(((Label)(item.FindControl("st_t"))).Text);
                    //other male student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Male" && x.Field<string>("caste") == "Other");
                    ((Label)(item.FindControl("ot_m"))).Text = dr.Count().ToString();
                    ot_m = ot_m + int.Parse(((Label)(item.FindControl("ot_m"))).Text);
                    //other female student
                    dr = dtt.AsEnumerable().Where(x => x.Field<string>("class_id") == class_id.Text && x.Field<string>("gender") == "Female" && x.Field<string>("caste") == "Other");
                    ((Label)(item.FindControl("ot_f"))).Text = dr.Count().ToString();
                    ot_f = ot_f + int.Parse(((Label)(item.FindControl("ot_f"))).Text);
                    //other total male female student
                    ((Label)(item.FindControl("ot_t"))).Text = (int.Parse(((Label)(item.FindControl("ot_m"))).Text) + int.Parse(((Label)(item.FindControl("ot_f"))).Text)).ToString();
                    ot_t = ot_t + int.Parse(((Label)(item.FindControl("ot_t"))).Text);
                }
                lt_m.Text = t_m.ToString();
                lt_f.Text = t_f.ToString();
                lt_t.Text = t_t.ToString();
                lg_m.Text = g_m.ToString();
                lg_f.Text = g_f.ToString();
                lg_t.Text = g_t.ToString();
                lo_f.Text = o_f.ToString();
                lo_m.Text = o_m.ToString();
                lo_t.Text = o_t.ToString();
                ls_f.Text = s_f.ToString();
                ls_m.Text = s_m.ToString();
                ls_t.Text = s_t.ToString();
                lst_f.Text = st_f.ToString();
                lst_m.Text = st_m.ToString();
                lst_t.Text = st_t.ToString();
                lot_f.Text = ot_f.ToString();
                lot_m.Text = ot_m.ToString();
                lot_t.Text = ot_t.ToString();
            }
        }
    }
}