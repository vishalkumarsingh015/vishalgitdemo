<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="UGPart1_receipt_2022_25.aspx.cs" Inherits="UGPart1_receipt_2022_25" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
    @media print
    {
        .w100
        {
            width:100%;display:flex;
        }
        .w50
        {
            width:50%;display:flex;
        }
        .w66
        {
            width:66.66%;display:flex;
        }
        .w33
        {
            width:33.33%;display:flex;

        }
         .top
        {
          margin-top:10px;
        }
    p
    {
        margin-left:10px;
        margin-right:10px;
        font-family:Cambria Math;
        font-size:15px;
        color:Black;
    }
     .abcd
    {
       
     margin-top: -18px;    
    }
  
    .set-align
    {
       
        padding:10px;
        text-align:center;   
        margin-left:10px;
        margin-right:10px;     
    }
   .all
   {
       
       padding-left:5px;
       padding-right:5px;       
       font-weight:bold;
       font-family:Times New Roman;
       margin-left:10px;
        margin-right:10px;
   }
   .img
   {
    text-align:right;
        margin-top: -44px;
   }
  
  
    }
     @media screen
     {
      .all
   {
       
       padding-left:5px;
       padding-right:5px;       
       font-weight:bold;
       font-family:Times New Roman;
   }
     
    p
    {
        font-family:Cambria Math;
        font-size:15px;
        color:Black;
    }
    table
    {
         background-color:White;
        border:1px solid black;
        color:Black;
        font-size:12px;
        border-spacing:0;
        width:100%;
        margin-bottom:5px;
    }
    th,td
    {
        border:1px solid black;
    }
    .set-align
    {
       
        padding:10px;
        text-align:center;        
    }
   
   
   
    }
</style>
    <script type="text/javascript">
        function CallPrint() {

            var contents = $("#print_content").html();

            var frame1 = $('<iframe />');
            frame1[0].name = "frame1";
            frame1.css({ "position": "absolute", "top": "-1000000px" });
            $("body").append(frame1);
            var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
            frameDoc.document.open();
            //Create a new HTML document.
            frameDoc.document.write('<html><head><title>Fee Receipt</title>');
            frameDoc.document.write('</head><body>');
            //Append the external CSS file.

            frameDoc.document.write(' <link href="css/bootstrap-select.min.css" rel="stylesheet" />');
           
            //Append the DIV contents.
            frameDoc.document.write(contents);
            frameDoc.document.write('</body></html>');
            frameDoc.document.close();
            setTimeout(function () {
                window.frames["frame1"].focus();
                window.frames["frame1"].print();
                frame1.remove();
            }, 1000);
        }

    </script>
    <script type="text/javascript">
        function CallPrint1() {

            var contents = $("#print_content1").html();

            var frame1 = $('<iframe />');
            frame1[0].name = "frame1";
            frame1.css({ "position": "absolute", "top": "-1000000px" });
            $("body").append(frame1);
            var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
            frameDoc.document.open();
            //Create a new HTML document.
            frameDoc.document.write('<html><head><title>Fee Receipt</title>');
            frameDoc.document.write('</head><body>');
            //Append the external CSS file.

            frameDoc.document.write(' <link href="css/bootstrap-select.min.css" rel="stylesheet" />');

            //Append the DIV contents.
            frameDoc.document.write(contents);
            frameDoc.document.write('</body></html>');
            frameDoc.document.close();
            setTimeout(function () {
                window.frames["frame1"].focus();
                window.frames["frame1"].print();
                frame1.remove();
            }, 1000);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container bootdey">
    <div class="col-lg-12" >
        <div class="row"  >
              
              <div class="col-lg-9">
<div class="row invoice row-printable">
    <div class="col-md-12">
        <!-- col-lg-12 start here -->
        <div class="panel panel-default plain">
            <!-- Start .panel -->
            <div class="panel-body p30" id="print_content">
                <link href="css/style.css" rel="stylesheet" />
                <link href="css/bootstrap.css" rel="stylesheet" />
                <link href="css/materialize.css" rel="stylesheet" />
                <div class="row">
                    <!-- Start .row -->
                    <div class="col-lg-12" style="border-bottom:1px solid";>
                      <img width="100" src="css/images/ANM%20logo.jpeg" alt="College logo" style="float: left;">
                            <h4 style="text-align:center;color: #002147;">Anugrah Narayan Singh College Barh , ( Patna )</h4>
                            <p style="text-align:center;color: #002147;">(A Constituent unit of Patliputra University, Patna w.e.f 18.03.2018.)</p>
                            <p style="text-align:center;color: #002147;">( A NAAC Accredited )</p>
                             <p style="text-align:center;color: #002147;">UG 1st (2022-2025)  Admission   Form</p>
                          
 
                    </div>
                  
                    <div class="col-lg-12">
          
                       
                              
                            <div class="row">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="width:100%;" >
              <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6" >
              
               </div>
                 
              </div>
              </div>
                            <div class="row">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style=" width:100%">
              <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8 " >
              <p ><span style="width:400px">Registration no</span> : <asp:Label ID="Resgis" class="all few" runat="server" > __________________________</asp:Label>  </p>
                <p ><span style="width:400px">Roll no</span> : <asp:Label ID="rollno" class="all few" runat="server" > __________________________</asp:Label>  </p>
          
              <p><span style="width:400px">Candidate Name</span>   : <asp:Label ID="S_name" class="all few" runat="server" > __________________________</asp:Label></p>
              <p><span style="width:400px">Father Name </span>:  <asp:Label ID="F_name" class="all few" runat="server" >    __________________________</asp:Label></p>
              <p><span style="width:400px">Mother Name </span> : <asp:Label ID="M_name" class="all few" runat="server" >     __________________________</asp:Label></p>
              <p><span style="width:400px">Appl.Date  </span>
              
              : <asp:Label ID="DOB" class="all few" runat="server" > __________________________</asp:Label></p>
              </div>
              <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 img w33" style=" float:right; right:2px;">
                    <%--<img src="images/studenticon.png" style="width:50px" />--%>
             <asp:Image ID="Image1" runat="server" style="width:100px; float:right; right:20px; position:absolute" />
              </div>
             
             </div>
                  
            </div>
                            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" align="center">
              <h3 style="float:left;">Course : <asp:Label ID="lblcourse" runat="server" >-------------------</asp:Label> </h3>
<table style="width:100%">
  <tr style="border: 1px solid;padding: 11px;">
    <th style="border: 1px solid;padding: 11px;">Honours</th>
    <th style="border: 1px solid;padding: 11px;">Subsidiary 1</th>
    <th style="border: 1px solid;padding: 11px;">Subsidiary 1</th>
      <th style="border: 1px solid;padding: 11px;">Composition Paper</th>

  </tr>
  <tr>
    <td style="border: 1px solid;padding: 11px;"><asp:Label ID="lblhnours" runat="server" >-------------------</asp:Label> </td>
    <td style="border: 1px solid;padding: 11px;"><asp:Label ID="lblSubsidiary_1" runat="server" >-------------------</asp:Label> </td>
    <td style="border: 1px solid;padding: 11px;"><asp:Label ID="lblSubsidiary_2" runat="server" >-------------------</asp:Label> </td>
    <td style="border: 1px solid;padding: 11px;"><asp:Label ID="lblcoposition" runat="server" >-------------------</asp:Label> </td>
  </tr>
                                
   
</table>
               
              </div>
              </div>
                         
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 w100">
                  <div class="row">
              <div class="col-lg-6 col-md-6 col-xs-6 col-sm-4 w50" >
              <p >fee : <asp:Label ID="Label2" class="all few" runat="server" >__________________________</asp:Label>  </p>
               </div>
                <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 w50">
              <p class="abcd">Trans_id : <asp:Label ID="lbltrans_id" class="all few" runat="server" >________________________</asp:Label></p>
            
              </div>
                      </div>
              </div>
            
                            
                        
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 w100">
              <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8 w50">
              <br />
              <p style=" font-size:large; text-decoration:underline; margin-top:10px;">Student Signature:</p>
                  <asp:Image ID="Image2" runat="server" style="max-width:100px" />

              </div>
             <%-- <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4  w33" align="center">
              <br />
              <br />
               <p style="font-size:large;">College Signature: </p>

               </div>--%>
              </div>
                             
                             
                      
                                                <div class="col-md-12">
                                                <p><strong><span style="text-decoration:underline;">नोट :- </span></strong> नामांकन लेने के 24 ( चौबीस ) घंटे के अन्दर   कागजात के साथ महाविद्यालय में सम्बंधित काउंटर पर जमा करना है अन्यथा आपका नामांकन रद्द हो जायेगा तथा नामांकन फीस भी वापस नहीं होगा जिसकी सारी जवाबदेही विद्यार्थी की होगी |</p>
                                                </div>
                        <div class="invoice-footer mt25">
                            <p class="text-center">Generated on <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label> </p>
                        </div>
                    </div>
                    <!-- col-lg-12 end here -->
                </div>
                <!-- End .row -->
 
            </div>

               <input type="button" id="print_receipt" value="Print Receipt" class="btn btn-primary btn-block " onclick="CallPrint()"  style="margin-top:10px;" />  
      
        </div>
        <!-- End .panel -->
    </div>
      <input type="button" id="Button1" value="Print Application Form" class="btn btn-primary btn-block " onclick="CallPrint1()"  style="margin-top:10px;" />  
     
      
    <!-- col-lg-12 end here -->
</div>
                 </div>
        
             <div class="col-lg-6" style=" display:none" id="print_content1">
            <table cellspacing="0" border="0">
	<colgroup width="152"></colgroup>
	<colgroup width="161"></colgroup>
	<colgroup width="84"></colgroup>
	<colgroup span="2" width="116"></colgroup>
	<colgroup width="195"></colgroup>
	<tr>
		<td colspan="6" height="33" align="center"  style="text-align:center" ><font face="Times New Roman" size=6>Anugrah Narayan Singh College Barh , ( Patna )</font></td>
		</tr>
	<tr>
		<td colspan="6" height="33" align="center" style="text-align:center"  ><font face="Times New Roman" size=5>(A Constituent unit of Patliputra University, Patna w.e.f 18.03.2018.)</font></td>
		</tr>
	<tr>
		<td colspan="6" height="33" align="center" style="text-align:center"  ><font face="Times New Roman" size=5>( A NAAC Accredited )</font></td>
		</tr>
	<tr>
		<td colspan="6" height="33" align="center" style="text-align:center"  ><font face="Times New Roman" size=4> <asp:Label ID="lblstream1" runat="server" Text="Label"></asp:Label>   1st Part (UG) Admission Applicaton Form</font></td>
		</tr>
	<tr>
		<td colspan="3" height="33" align="left" ><font face="Times New Roman" size=3 color="#000000">Class Roll No</font> <asp:Label ID="lblroll1" runat="server" Text="Label"></asp:Label></td>
		<td colspan="3" align="left" ><font face="Times New Roman" size=3>Session :-</font> <asp:Label ID="lblsession1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td colspan="2" height="33" align="left"  ><font face="Times New Roman" size=3>Reg_no :- </font><asp:Label ID="lbluan1" runat="server" Text="Label"></asp:Label></td>
		<td colspan="4" align="left" ><font face="Times New Roman" size=3>Admission Date &amp; Time:-</font><asp:Label ID="lbladmissiondate1" runat="server" Text="Label"></asp:Label></td>
		</tr>
                	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"> PPU Confidential No:- </font><asp:Label ID="lblPPU" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=4 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3> Subject :-</font><asp:Label ID="lblsubject1" runat="server" Text="Label"></asp:Label></td>
		</tr>
             
	 
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=5 height="33" align="left" valign=middle><font face="Times New Roman" size=3>1. Candidate Name :</font><asp:Label ID="lblname1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=6 align="center" valign=middle><asp:Image ID="imgphoto" ImageUrl="~/shubham.jpg" Width="120px" runat="server"></asp:Image></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=5 height="33" align="left" valign=middle><font face="Times New Roman" size=3>2. Father's Name :</font><asp:Label ID="lblfname1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=5 height="33" align="left" valign=middle><font face="Times New Roman" size=3>3. Mother's Name :</font><asp:Label ID="lblmname1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">4. Date of Birth :</font><asp:Label ID="lbldob1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">5. Aadhar No. :</font><asp:Label ID="lblaadhar1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">6. Gender :</font><asp:Label ID="lblgender1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">7. Domicile :</font><asp:Label ID="lbldomivile1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">8. Category :</font><asp:Label ID="lblcategory1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">9. Dom. Cert. :</font><asp:Label ID="lbldomceri1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">10. Sub Category :</font><asp:Label ID="lblsubcat1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">11. Religion :</font><asp:Label ID="lblreligion1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=3 align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><asp:Image ID="imgsign" ImageUrl="~/sign.jpg" style="width:120px" runat="server"></asp:Image> </td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">12. EWS :</font><asp:Label ID="lblews1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">13. Minority :</font><asp:Label ID="lblminority1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">14. Nationality :</font><asp:Label ID="lblnation1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>15. Cast :</font><asp:Label ID="lblcast1" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">16. Mobile No.</font><asp:Label ID="lblmob1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=4 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>17. Email :</font><asp:Label ID="lblmail1" runat="server" Text="Label"></asp:Label></td>
		</tr>
                <tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">18.Subsidery1.</font><asp:Label ID="lbllSubsidery1" runat="server" Text="Label"></asp:Label></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=4 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>19.Subsidery2 :</font><asp:Label ID="lbllSubsidery2" runat="server" Text="Label"></asp:Label></td>

		</tr>
                <tr>                    		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=4 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>20.Composition:</font><asp:Label ID="Composition" runat="server" Text="Label"></asp:Label></td></tr>
	
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=6 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">22. Permanent Address :</font><asp:Label ID="lblperaddress" runat="server" Text="Label"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=6 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">23. Payment Details :</font> Rs. <asp:Label ID="lblfee" runat="server" Text="500.00"></asp:Label></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=6 height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">24. Qualification Detail</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" height="45" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>Class</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>Board/University Name</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3>Passing Year</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>Roll Code &amp; Roll Number</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>Max Marks</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>Obtained Marks</font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">Matric </font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblmatricboard" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3><asp:Label ID="lblmatpassingyear" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblmatroll" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblmatricmarks" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblmatricobtain" runat="server" Text="Label"></asp:Label></font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" height="33" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">Intermediate</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblinterboard" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3><asp:Label ID="lblinteryear" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblinterroll" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblintermarks" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblinterobtain" runat="server" Text="Label"></asp:Label></font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" height="42" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">Other Board</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblpgboard" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3><asp:Label ID="lblpgyear" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblpgroll" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblpgmarks" runat="server" Text="Label"></asp:Label></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><asp:Label ID="lblpgobtain" runat="server" Text="Label"></asp:Label></font></td>
	</tr>
	 
 
	 
 
	 
	 
	 
	<tr>
		<td colspan=6 height="27" align="center" valign=middle bgcolor="#FFFFFF"><b><font face="Times New Roman" size=3 color="#000000">Document Checklist ( Office Use only )</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000" colspan=12 height="27" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" color="#000000">NOTE: Mark the number of documents ( Photocopy/Xerox) attached by the Candidate during form submission to the college</font></td>

		</tr>
                <tr>        <td style="border-bottom: 1px solid #000000" colspan=12 height="27" align="left" valign=middle bgcolor="#FFFFFF" color="#000000">नामांकन लेने के 24 ( चौबीस ) घंटे के अन्दर कागजात के साथ महाविद्यालय में सम्बंधित काउंटर पर जमा करना है अन्यथा आपका नामांकन रद्द हो जायेगा तथा नामांकन फीस भी वापस नहीं होगा जिसकी सारी जवाबदेही विद्यार्थी की होगी |</td></tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 height="27" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">1. 1. Photocopy of XIIth Mark sheet</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">2. Original of CLC/SLC</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 height="27" align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>3. Payment Slip College copy</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3>4. Photocopy of Cast Certificate</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 height="27" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">5. Photocopy of Income Certificate</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><br>6. Original of Migration Certificate		</font></td>
		</tr>
                <tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 height="27" align="left" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000">7. Photocopy of Xth Mark sheet</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><br>8. Online apply form & Provisional offer letter copy		</font></td>
		</tr>
  
	<tr>
		<td height="40" align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3 color="#000000"><br></font></td>
		<td align="left" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><br></font></td>
		<td align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3><br></font></td>
		<td align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><br></font></td>
		<td align="center" valign=middle bgcolor="#FFFFFF"><font face="Times New Roman" size=3><br></font></td>
		<td align="center" valign=middle bgcolor="#FFFFFF" sdnum="1033;0;0"><font face="Times New Roman" size=3><br></font></td>
	</tr>
	 
</table>
            
            </div>
                </div>
               </div>
</div>
</asp:Content>

