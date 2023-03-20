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


/// <summary>
/// Summary description for CCommonDB
/// </summary>
abstract public class CSql1
  {
    private SqlConnection sqlConnection;      // Connection string
    private SqlCommand sqlCommand;          // Command
    private SqlDataAdapter sqlDataAdapter;  // Data Adapter      
    private DataSet sqlDataSet;            // Data Set
   
    public CSql1()
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
public class CCommonDB1:CSql1
{
   
	public CCommonDB1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string AuthenticateUser1(
     System.Web.SessionState.HttpSessionState objSession, // Session Variable
     System.Web.HttpResponse objResponse,                 // Response Variable
                                       // Login
     string username ,string password                                      // Persist login
     )
    {
        int nLoginID = 0;
        string nLoginType = string.Empty;
        //string nCity = string.Empty;

        // Log the user in
        LoginUser( username, password,ref nLoginID, ref nLoginType);

        if (nLoginID != 0)  // Success
        {
            // Log the user in
            //System.Web.Security.FormsAuthentication.SetAuthCookie(nLoginID.ToString());

            // Set the session varaibles    
            objSession["loginID"] = nLoginID.ToString();
            objSession["userType"] = nLoginType.ToString();
            //objSession["ncity"] = nCity.ToString();
            //// Set cookie information incase they made it persistant
            //System.Web.HttpCookie wrapperCookie = new System.Web.HttpCookie("wrapper");
            //wrapperCookie.Value = objSession["loginID"].ToString();
            //wrapperCookie.Expires = DateTime.Now.AddDays(30);

            //System.Web.HttpCookie lgnTypeCookie = new System.Web.HttpCookie("loginType");
            //lgnTypeCookie.Value = objSession["loginType"].ToString();
            //lgnTypeCookie.Expires = DateTime.Now.AddDays(30);

            //// Add the cookie to the response
            //objResponse.Cookies.Add(wrapperCookie);
            //objResponse.Cookies.Add(lgnTypeCookie);

            string flag = string.Empty;
            flag = "main.aspx";
            return flag;
        }
        else
        {
            return string.Empty;
        }
    }

    public string AuthenticateUser(
      System.Web.SessionState.HttpSessionState objSession, // Session Variable
      System.Web.HttpResponse objResponse,                 // Response Variable
      string email,                                        // Login
      string password                                       // Persist login
      )
    {
        int nLoginID = 0;
        string nLoginType = string.Empty;
        string nLoginName = string.Empty;
        string parentid = string.Empty;
        string sponserId = string.Empty;

        // Log the user in
        Login(email, password, ref nLoginID, ref nLoginType,ref nLoginName,ref parentid,ref sponserId);

        if (nLoginID != 0)  // Success
        {
            // Log the user in
            //System.Web.Security.FormsAuthentication.SetAuthCookie(nLoginID.ToString());

            // Set the session varaibles    
            objSession["loginID"] = nLoginID.ToString();
            objSession["userId"] = nLoginType.ToString();
            objSession["Name"] = nLoginName.ToString();
            objSession["MartUserId"] = nLoginID.ToString();
            objSession["MartUserName"] = nLoginName.ToString();
            objSession["MartParentId"] = parentid.ToString();
            objSession["MartSponserid"] = sponserId.ToString();
            objSession["CustomerFlag"] = "M";

            // Set cookie information incase they made it persistant
            //System.Web.HttpCookie wrapperCookie = new System.Web.HttpCookie("wrapper");
            //wrapperCookie.Value = objSession["loginID"].ToString();
            //wrapperCookie.Expires = DateTime.Now.AddDays(30);

            //System.Web.HttpCookie lgnTypeCookie = new System.Web.HttpCookie("userId");
            //lgnTypeCookie.Value = objSession["userId"].ToString();
            //lgnTypeCookie.Expires = DateTime.Now.AddDays(30);

            //System.Web.HttpCookie lgnTypeCookie1 = new System.Web.HttpCookie("userName");
            //lgnTypeCookie1.Value = objSession["Name"].ToString();
            //lgnTypeCookie1.Expires = DateTime.Now.AddDays(30);

            // Add the cookie to the response
            //objResponse.Cookies.Add(wrapperCookie);
            //objResponse.Cookies.Add(lgnTypeCookie);
            //objResponse.Cookies.Add(lgnTypeCookie1);


            //  string flag = string.Empty;
            //  if (objSession["userId"].ToString() == "Admin")
            //    {
            //        flag = "Admin.aspx";
            //    }
            //  else if (objSession["userId"].ToString() == "Distributor")
            //    {
            //       flag= "Admin.aspx";
            //}

            //    return flag;
            //}                                       
            //else
            //{
            //  return string.Empty;
            //}



            return "DashBoard.aspx";
        }
        else
        {
            return string.Empty;
        }
    }


    public void Login(string email, string password, ref int nLoginID, ref string nLoginType, ref string nLoginName,ref string parentid,ref  string sponserId)
    {
      ResetSql();
 
      DataSet ds = new DataSet();


      SqlParameter paramLogin = new SqlParameter("@var1", SqlDbType.NVarChar, 100);
      paramLogin.Value = email;

      SqlParameter paramPassword = new SqlParameter("@var2", SqlDbType.NVarChar, 20);
      paramPassword.Value = Encryptdata(password);
 
 
      Command.CommandType = CommandType.StoredProcedure;
      Command.CommandText = "glbl_Login";
      Command.Parameters.Add(paramLogin);
      Command.Parameters.Add(paramPassword);

      Adapter.TableMappings.Add("Table", "userDetails");
      Adapter.SelectCommand = Command;
      Adapter.Fill(ds);
      try
      {

          if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count>0)
          {

              DataRow row = ds.Tables[0].Rows[0];

              // Get the login id and the login type
              nLoginID = Convert.ToInt32(row["id"].ToString());
              nLoginType = row["userId"].ToString();
              nLoginName = row["UserName"].ToString();
              parentid = row["ParentId"].ToString();
              sponserId = row["refId"].ToString();
          }
          else
          {
              nLoginID = 0;
              nLoginType = null;
          }
      }
      catch
      {


       
      
      }

    
  }
 public void LoginUser( string username, string password, ref int nLoginID, ref string nLoginType)
 {
     ResetSql();

     DataSet ds = new DataSet();
    
     // Set our parameters
     //SqlParameter paramCity = new SqlParameter("@city", SqlDbType.BigInt, 100);
     //paramCity.Value = city;
     SqlParameter paramLogin = new SqlParameter("@username", SqlDbType.NVarChar, 100);
     paramLogin.Value= username;

     SqlParameter paramPassword = new SqlParameter("@pass", SqlDbType.NVarChar, 20);
     paramPassword.Value = Encryptdata(password);
    

     Command.CommandType = CommandType.StoredProcedure;
     Command.CommandText = "LoginUser";
     Command.Parameters.Add(paramLogin);
     Command.Parameters.Add(paramPassword);
     //Command.Parameters.Add(paramCity);
     Adapter.TableMappings.Add("Table", "tblLogin");
     Adapter.SelectCommand = Command;
     Adapter.Fill(ds);
     try
     {

         if (ds.Tables.Count != 0 && ds.Tables[0].Rows.Count > 0)
         {

             DataRow row = ds.Tables[0].Rows[0];

             // Get the login id and the login type
             nLoginID = Convert.ToInt32(row["id"].ToString());
             nLoginType = row["userType"].ToString();
             //nCity = row["City"].ToString();
         }
         else
         {
             nLoginID = 0;
             nLoginType = null;
             //nCity = null;
         }
     }
     catch
     {




     }


 }

 public  string Encryptdata(string password)
 {
     string strmsg = string.Empty;
     byte[] encode = new byte[password.Length];
     encode = Encoding.UTF8.GetBytes(password);
     strmsg = Convert.ToBase64String(encode);
     return strmsg;
 }
 
 public  string Decryptdata(string encryptpwd)
 {
     string decryptpwd = string.Empty;
     UTF8Encoding encodepwd = new UTF8Encoding();
     Decoder Decode = encodepwd.GetDecoder();
     byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
     int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
     char[] decoded_char = new char[charCount];
     Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
     decryptpwd = new String(decoded_char);
     return decryptpwd;
 }

 
    
  }
