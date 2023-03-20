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
/// Summary description for month
/// </summary>


public class month 
{
    public month()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int monthcount(string mm)
    {
        
        string[] sa = mm.Split('-');
        if (sa.Count() == 1)
        {
            return 1;
        }
        else
        {
            var min = monthname(sa[0].Trim());
            var max = monthname(sa[1].Trim());

            var c = 0;
            for (var a = min; a <= max; a++)
            {
                c = c + 1;
            }

            return c;
        }
      
    
            

    }
    public static string monthdisit(int b)
    {        
        var a = b;

        if (a == 1)
        {
            return "APR";
        }
        else if (a == 2)
        {
            return "MAY";
        }
        else if (a == 3)
        {
            return "JUN";
        }
        else if (a == 4)
        {
            return "JUL";
        }
        else if (a == 5)
        {
            return "AUG";
        }
        else if (a == 6)
        {
            return "SEP";
        }
        else if (a == 7)
        {
            return "OCT";
        }
        else if (a == 8)
        {
            return "NOV";
        }
        else if (a == 9)
        {
            return "DEC";
        }
        else if (a == 10)
        {
            return "JAN";
        }
        else if (a == 11)
        {
            return "FEB";
        }
        else if (a == 12)
        {
            return "MAR";
        }
        else
        {
            return "";
        }
    }
    public static int monthname(string b)
    {
        var a = b.ToUpper();

        if (a == "JAN" || a == "JANUARY")
        {
            return 10;
        }
        else if (a == "FEB" || a == "FEBRUARY")
        {
            return 11;
        }
        else if (a == "MAR" || a == "MARCH")
        {
            return 12;
        }
        else if (a == "APR" || a == "APRIL")
        {
            return 1;
        }
        else if (a == "MAY" || a == "MAY")
        {
            return 2;
        }
        else if (a == "JUN" || a == "JUNE")
        {
            return 3;
        }
        else if (a == "JUL" || a == "JULY")
        {
            return 4;
        }
        else if (a == "AUG" || a == "AUGUST")
        {
            return 5;
        }
        else if (a == "SEP" || a == "SEPTEMBER")
        {
            return 6;
        }
        else if (a == "OCT" || a == "OCTOBER")
        {
            return 7;
        }
        else if (a == "NOV" || a == "NOVEMBER")
        {
            return 8;
        }
        else if (a == "DEC" || a== "DECEMBER")
        {
            return 9;
        }
        else
        {
            return 0;
        }
      
    }
    public static string getOriginalMonth(int x)
    {
        string mon="";
        if (x == 1)
            mon = "Jan";
        else if (x == 2)
            mon = "Feb";
        else if (x == 3)
            mon = "Mar";
        else if (x == 4)
            mon = "Apr";
        else if (x == 5)
            mon = "May";
        else if (x == 6)
            mon = "June";
        else if (x == 7)
            mon = "July";
        else if (x == 8)
            mon = "Aug";
        else if (x == 9)
            mon = "Sep";
        else if (x == 10)
            mon = "Oct";
        else if (x == 11)
            mon = "Nov";
        else if (x == 12)
            mon = "Dec";
        return mon;
    }
    public static int getFinancialMonth(int x)
    {
        int s = 0;
        if (x == 1)
            s = 10;
        else if (x == 2)
            s = 11;
        else if (x == 3)
            s = 12;
        else if (x == 4)
            s = 1;
        else if (x == 5)
            s = 2;
        else if (x == 6)
            s = 3;
        else if (x == 7)
            s = 4;
        else if (x == 8)
            s = 5;
        else if (x == 9)
            s = 6;
        else if (x == 10)
            s = 7;
        else if (x == 11)
            s = 8;
        else if (x == 12)
            s = 9;
        return s;

    }

    public static string CopyOfgetCopyOriginalMonthDigit(int x)
    {
        string s = "";
        if (x == 1)
            s = "04";
        else if (x == 2)
            s = "05";
        else if (x == 3)
            s = "06";
        else if (x == 4)
            s = "07";
        else if (x == 5)
            s = "08";
        else if (x == 6)
            s = "09";
        else if (x == 7)
            s = "10";
        else if (x == 8)
            s = "11";
        else if (x == 9)
            s = "12";
        else if (x == 10)
            s = "01";
        else if (x == 11)
            s = "02";
        else if (x == 12)
            s = "03";
        return s;

    }

    public static int getOriginalMonthDigit(int x)
    {
        int s = 0;
        if (x == 1)
            s = 4;
        else if (x == 2)
            s = 5;
        else if (x == 3)
            s = 6;
        else if (x == 4)
            s = 7;
        else if (x == 5)
            s = 8;
        else if (x == 6)
            s = 9;
        else if (x == 7)
            s = 10;
        else if (x == 8)
            s = 11;
        else if (x == 9)
            s = 12;
        else if (x == 10)
            s = 1;
        else if (x == 11)
            s = 2;
        else if (x == 12)
            s = 3;
        return s;

    }

    public static string getFinancialYear(DateTime date)
    {
        string fin_yr = "", prev="", next="";

        int f_m = getFinancialMonth(date.Month);
        if (f_m <= 12 && f_m >= 10)
        {
            prev = (date.Year - 1).ToString();
            next = (date.Year).ToString();
        }
        else
        {
            prev = (date.Year).ToString();
            next = (date.Year + 1).ToString();
        }
        fin_yr = prev + " - " + next;
        return fin_yr;
    }

    public static int totalDayOfMonthYear(int mon, int yr)
    {
        int temp = 0;

        //to get the no. of digit in month
        int n = mon, s = 0, r = 0;
        while (n > 0)
        {
            r = n % 10;
            s++;
            n = n / 10;
        }

        DateTime firstdate;
        if (s == 1)
            firstdate = DateTime.ParseExact("01-0" + mon + "-" + yr + "", "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
        else
            firstdate = DateTime.ParseExact("01-" + mon + "-" + yr + "", "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

        DateTime lastdate = new DateTime(firstdate.Year, firstdate.Month, 1).AddMonths(1).AddDays(-1);

        temp = (int)(lastdate - firstdate).TotalDays;

        return temp + 1;
    }

    public static string get_normal_monthname(int mon_digit)
    {
        string mon_name = "";
        if (mon_digit == 1)
            mon_name = "January";
        else if (mon_digit == 2)
            mon_name = "February";
        else if (mon_digit == 3)
            mon_name = "March";
        else if (mon_digit == 4)
            mon_name = "April";
        else if (mon_digit == 5)
            mon_name = "May";
        else if (mon_digit == 6)
            mon_name = "June";
        else if (mon_digit == 7)
            mon_name = "July";
        else if (mon_digit == 8)
            mon_name = "August";
        else if (mon_digit == 9)
            mon_name = "September";
        else if (mon_digit == 10)
            mon_name = "October";
        else if (mon_digit == 11)
            mon_name = "November";
        else if (mon_digit == 12)
            mon_name = "December";

        return mon_name;
    }

    public static int totalDayofMonthSession(int mon, string session)
    {
        int i = 0,yr;
        //e.g. mon=1 (January), session= 2020 - 2021
        int f_m = getFinancialMonth(mon);
        if (f_m <= 12 && f_m >= 10)
        {
            yr = int.Parse(session.Split('-')[1]);
        }
        else
        {
            yr = int.Parse(session.Split('-')[0]);
        }
        i = totalDayOfMonthYear(mon,yr);
        return i;
    }
    public static int getYear(int mon, string session)
    {
        int i = 0, yr;
        //e.g. mon=1 (January), session= 2020 - 2021
        int f_m = getFinancialMonth(mon);
        if (f_m <= 12 && f_m >= 10)
        {
            yr = int.Parse(session.Split('-')[1]);
        }
        else
        {
            yr = int.Parse(session.Split('-')[0]);
        }
        return yr;
    }
}
