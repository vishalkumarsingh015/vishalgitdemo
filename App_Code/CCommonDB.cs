using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Web.UI;


/// <summary>
/// Summary description for CCommonDB
/// </summary>
abstract public class CSql
  {
    private SqlConnection sqlConnection;      // Connection string
    private SqlCommand sqlCommand;          // Command
    private SqlDataAdapter sqlDataAdapter;  // Data Adapter      
    private DataSet sqlDataSet;            // Data Set
   
    public CSql()
    {
        sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
      sqlCommand    = new SqlCommand();
      sqlDataAdapter  = new SqlDataAdapter();
      sqlDataSet    = new DataSet();
 
      sqlCommand.Connection = sqlConnection;
    }

    /// <summary>
 
    /// Access to our sql command
    /// </summary>
    protected SqlCommand Command
    {
      get { return sqlCommand; }
    }
 
    /// <summary>
    /// Access to our data adapter
    /// </summary>
    protected SqlDataAdapter Adapter
    {
      get { return sqlDataAdapter; }
    }

    protected void ResetSql()
    {
        if (sqlCommand != null)
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
        }

        if (sqlDataAdapter != null)
            sqlDataAdapter = new SqlDataAdapter();

        if (sqlDataSet != null)
            sqlDataSet = new DataSet();
    }

    /// <summary>
    /// Runs our command and returns the dataset
    /// </summary>
    /// <returns>the data set</returns>
    protected DataSet RunQuery()
    {
        sqlDataAdapter.SelectCommand = Command;

        sqlConnection.Open();
        sqlConnection.Close();
        sqlDataAdapter.Fill(sqlDataSet);
        return sqlDataSet;
    }
    /// <summary>
    /// Makes sure that everything is clear and ready for a new query
    /// </summary>
}
public class CCommonDB:CSql
{
   
	public CCommonDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}



    public string AuthenticateUser( ref string logintype,
      System.Web.SessionState.HttpSessionState objSession, // Session Variable
      System.Web.HttpResponse objResponse,                 // Response Variable
      string email,                                        // Login
      string password ,string checkbox
                                      // Persist login
      )
    {
        int nLoginID = 0;
        int schoolid = 0;
        string nLoginType = string.Empty;
        string ModifiedDate = string.Empty;
        string user_id= string.Empty;
        string image = string.Empty;
        string activation_key = string.Empty;

        // Log the user in
        Login(email, password, ref nLoginID, ref schoolid, ref nLoginType, ref ModifiedDate, ref user_id, ref image, ref activation_key);
        logintype = nLoginType;
        if (nLoginID != 0)  // Success
        {
            // Log the user in
            //System.Web.Security.FormsAuthentication.SetAuthCookie(nLoginID.ToString());

            // Set the session varaibles    
            objSession["loginID"] = nLoginID.ToString();
            objSession["loginType"] = nLoginType.ToString();
            objSession["ModifiedDate"] = ModifiedDate.ToString();
            //objSession["S_id"] = schoolid.ToString();
            objSession["user_id"] = user_id.ToString();
           // objSession["axd"] = activation_key.ToString();


            // Set cookie information incase they made it persistant
            System.Web.HttpCookie wrapperCookie = new System.Web.HttpCookie("wrapper");
            wrapperCookie.Value = objSession["loginID"].ToString();


            System.Web.HttpCookie loginType = new System.Web.HttpCookie("loginType");
            loginType.Value = objSession["loginType"].ToString();
           

            System.Web.HttpCookie lgnTypeCookie1 = new System.Web.HttpCookie("ModifiedDate");
            lgnTypeCookie1.Value = objSession["ModifiedDate"].ToString();


            //System.Web.HttpCookie S_id = new System.Web.HttpCookie("S_id");
            //S_id.Value = objSession["S_id"].ToString();
           

            System.Web.HttpCookie lgnTypeCookie3 = new System.Web.HttpCookie("user_id");
            lgnTypeCookie3.Value = objSession["user_id"].ToString();

      

            System.Web.HttpCookie checkbox11 = new System.Web.HttpCookie("checkbox11");
            System.Web.HttpCookie img = new System.Web.HttpCookie("img");
            img.Value = image;
            if (checkbox.ToString() == "False")
            {
               checkbox11.Value = "false";

            }
            else
            {
                  checkbox11.Value = "true";
            }

         img.Expires=checkbox11.Expires = lgnTypeCookie3.Expires = wrapperCookie.Expires = loginType.Expires = lgnTypeCookie1.Expires  = DateTime.Now.AddDays(30);
         
            
           

            // Add the cookie to the response
         objResponse.Cookies.Add(wrapperCookie);
            objResponse.Cookies.Add(loginType);
            objResponse.Cookies.Add(lgnTypeCookie1);
            //objResponse.Cookies.Add(S_id);
            objResponse.Cookies.Add(lgnTypeCookie3);
           // objResponse.Cookies.Add(axdcookie);
            objResponse.Cookies.Add(checkbox11);
            objResponse.Cookies.Add(img);


            string flag = string.Empty;
            if (objSession["loginType"].ToString() == "SuperAdmin")
            {
                flag = "Admin/Main.aspx";
            }            
            else if (objSession["loginType"].ToString() == "School")
            {
                flag = "School/Main.aspx";
            }
            else if (objSession["loginType"].ToString() == "Branch")
            {
                flag = "Branch/Main.aspx";
            }
            else if (objSession["loginType"].ToString() == "Employee")
            {
                flag = "Employee/Main.aspx";
            }
            else if (objSession["loginType"].ToString() == "Student")
            {
                flag = "Student/Main.aspx";
            }
            else if (objSession["loginType"].ToString() == "Parent")
            {
                flag = "Parent/Main.aspx";
            }
            
            return flag;
        }
        else
        {
            return string.Empty;
        }
  
    }


    public void Login(string email, string password, ref int nLoginID, ref int schoolid, ref string nLoginType, ref string ModifiedDate, ref string user_id, ref string image, ref string activation_key)
    {
      ResetSql();
 
      DataSet ds = new DataSet();


      SqlParameter paramLogin = new SqlParameter("@var1", SqlDbType.NVarChar, 100);
      paramLogin.Value = CCommonDB.Encrypt(email);

      SqlParameter paramPassword = new SqlParameter("@var2", SqlDbType.NVarChar, 100);
      paramPassword.Value = CCommonDB.Encrypt(password);
 
 
      Command.CommandType = CommandType.StoredProcedure;
      Command.CommandText = "glbl_Login";
      Command.Parameters.Add(paramLogin);
      Command.Parameters.Add(paramPassword);

      Adapter.TableMappings.Add("Table", "LoginMaster");
      Adapter.SelectCommand = Command;
      Adapter.Fill(ds);
      try
      {

          if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count>0)
          {

              DataRow row = ds.Tables[0].Rows[0];

              // Get the login id and the login type
              nLoginID = Convert.ToInt32(row["ID"].ToString());
              nLoginType = row["Type"].ToString();
              ModifiedDate = row["ModifiedDate"].ToString();
              user_id = row["user_id"].ToString();
              //activation_key = row["activation_key"].ToString();
              //schoolid = Convert.ToInt32(row["SchoolID"].ToString());
              if (nLoginType != "Student")
              {
                  //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ERP"].ConnectionString);
                  //SqlDataAdapter da = new SqlDataAdapter("select emp_id from employee_master where UserName='" + CCommonDB.Encrypt(email) + "' ", con);
                  //DataTable dt = new DataTable();
                  //da.Fill(dt);
                  //if (dt.Rows.Count > 0)
                  //{
                  //    user_id = dt.Rows[0]["emp_id"].ToString();
                  //}
              }
          }
          else
          {
              //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
              //SqlDataAdapter da = new SqlDataAdapter("select * from tbluser where Mob='" + password + "' and Email='" + email + "' ", con);
              //DataTable dt = new DataTable();
              //da.Fill(dt);
              //if (dt.Rows.Count > 0)
              //{
              //    user_id = dt.Rows[0]["id"].ToString();
              //    nLoginID = Convert.ToInt32(dt.Rows[0]["ID"].ToString());
              //    nLoginType = "User";
              //    ModifiedDate = dt.Rows[0]["Name"].ToString();
              //    image = dt.Rows[0]["img"].ToString();

              //}
              //else
              //{

              //}
          }
      }
      catch
      {


       
      
      }

    
  }

 public static string Encrypt(string str)
 {
     string EncrptKey = "2013;[pnuLIT)WebCodeExpert";
     byte[] byKey = { };
     byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
     byKey = System.Text.Encoding.UTF8.GetBytes(EncrptKey.Substring(0, 8));
     DESCryptoServiceProvider des = new DESCryptoServiceProvider();
     byte[] inputByteArray = Encoding.UTF8.GetBytes(str);
     MemoryStream ms = new MemoryStream();
     CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
     cs.Write(inputByteArray, 0, inputByteArray.Length);
     cs.FlushFinalBlock();
     return Convert.ToBase64String(ms.ToArray());
 }

 public static string Decrypt(string str)
 {
     str = str.Replace(" ", "+");
     string DecryptKey = "2013;[pnuLIT)WebCodeExpert";
     byte[] byKey = { };
     byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
     byte[] inputByteArray = new byte[str.Length];

     byKey = System.Text.Encoding.UTF8.GetBytes(DecryptKey.Substring(0, 8));
     DESCryptoServiceProvider des = new DESCryptoServiceProvider();
     inputByteArray = Convert.FromBase64String(str.Replace(" ", "+"));
     MemoryStream ms = new MemoryStream();
     CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
     cs.Write(inputByteArray, 0, inputByteArray.Length);
     cs.FlushFinalBlock();
     System.Text.Encoding encoding = System.Text.Encoding.UTF8;
     return encoding.GetString(ms.ToArray());
 }

 
    
  }
