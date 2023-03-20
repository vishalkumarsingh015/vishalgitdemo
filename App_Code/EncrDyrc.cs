using System;

using System.Security.Cryptography;
using System.IO;
using System.Text;

public class EncrDyrc
{
    DESCryptoServiceProvider key = new DESCryptoServiceProvider();
    public static string PrivateKey = "LlU9JJLJAu8=";
    public EncrDyrc()
    {
       
    }
    public EncrDyrc(string Key)
    {
        key.IV = Convert.FromBase64String("x7hkVXoObeI=");
        key.Key = Convert.FromBase64String(Key);

    }
    public string Encrypt(string PlainText)
    {

        MemoryStream ms = new MemoryStream();
        CryptoStream encStream = new CryptoStream(ms, key.CreateEncryptor(), CryptoStreamMode.Write);
        StreamWriter sw = new StreamWriter(encStream);
        sw.WriteLine(PlainText);
        sw.Close();
        encStream.Close();
        byte[] buffer = ms.ToArray();
        ms.Close();

        return Convert.ToBase64String(buffer);
    }
  
    public string Decrypt(string CypherText)
    {
        byte[] bText = Convert.FromBase64String(CypherText);
        MemoryStream ms = new MemoryStream(bText);
        CryptoStream encStream = new CryptoStream(ms, key.CreateDecryptor(), CryptoStreamMode.Read);
        StreamReader sr = new StreamReader(encStream);
        string val = sr.ReadLine();
        sr.Close();
        encStream.Close();
        ms.Close();
        return val;
    }

    public static string Encryp(string input)
    {
        byte[] resultArray = new byte[]{};
        try
        {
            string key = "sblw-3hn8-sqoy19";
            byte[] inputArray = UTF8Encoding.UTF8.GetBytes(input);
            TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
            tripleDES.Key = UTF8Encoding.UTF8.GetBytes(key);
            tripleDES.Mode = CipherMode.ECB;
            tripleDES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = tripleDES.CreateEncryptor();
            resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            tripleDES.Clear();
           
        }
        catch
        {
        }
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
    public static string Decryp(string input)
    {
        byte[] resultArray = new byte[] { };
        try
        {

            string key = "sblw-3hn8-sqoy19";
            byte[] inputArray = Convert.FromBase64String(input.Replace(" ", "+")); ;
            TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
            tripleDES.Key = UTF8Encoding.UTF8.GetBytes(key);
            tripleDES.Mode = CipherMode.ECB;
            tripleDES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = tripleDES.CreateDecryptor();
            resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            tripleDES.Clear();
            return UTF8Encoding.UTF8.GetString(resultArray);
        }
        catch
        {
        }
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
  
}
