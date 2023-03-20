﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Download_tc.aspx.cs" Inherits="Student_Download_tc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        frameDoc.document.write('<html><head><title>Character Certificate</title>');
        frameDoc.document.write('</head><body>');
        //Append the external CSS file.
        
        frameDoc.document.write('<link href="../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />');
        //frameDoc.document.write('<link rel="stylesheet" href="../assets/css/style.css" type="text/css" />');
        // frameDoc.document.write('<link rel="stylesheet" href="../css/quirk.css" type="text/css" />');
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
      <style>
 .aaaa
 {
     display:none;
 }
 
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Generate College Leaving Certificate</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Generate College Leaving Certificate</li>
								<li class="breadcrumb-item active" aria-current="page">College Leaving Certificate</li>
							</ol>
						</nav>
					</div>
				</div>
				 
			</div>
		</div>	  
		 
		<!-- Main content -->
		      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
	 
			   

			 <div class="row" id="tc_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Details </h4>
								<hr class="my-15">
								 
								<div class="row">
                                      <div class="col-md-1"></div>
     <div class="col-md-10">
									 <div id="print_content" class="content" style="padding:10px;margin:5px;">
        
    <style type="text/css">
    @media print
    {
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
        border-left:1px solid black;
    }
    p
    {
        font-family:Cambria Math;
        font-size:15px;
        color:Black;
            }
    .set-align
    {       
        padding:7px;
        text-align:center;        
    }
     .set-align1
    {       
        padding:2px;
        text-align:center;        
    }
   .all
   {       
       padding-left:5px;
       padding-right:5px;       
       font-weight:bold;
       font-family:Times New Roman;
   } 
   .pg
   {     
      page-break-before:always;
      padding:30px;
   }
   .dash
   {
       border-bottom:1px dashed;
   } 
    }
     @media screen
     {
         .dash
   {
       border-bottom:1px dashed;
   } 
         tbody tr th 
         {
               color:#ECEDEC;
         }
          table
    {
       
        border:1px solid #1F2037;
        color:#ECEDEC;
        font-size:12px;
        border-spacing:0;
        width:100%;
        margin-bottom:5px;
    }
    th,td
    {
        border-left:1px solid #1F2037;
    }
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
    .set-align
    {
       
        padding:7px;
        text-align:center;        
    }
      .set-align1
    {       
        padding:2px;
        text-align:center;        
    }
     
    }
  

@media print {
	.page-break	{ display: block; page-break-before: always; }
}
</style>

     <div id="bulk_print" runat="server">

      <div class="page-break">  
          
     <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="border: 1px solid black;margin-bottom:20px;">  
          <div class="row"> 
               <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2 abc" align="center">
                                               <img src="../images/Anslogo.Png" style="margin-top:10px">
                   </div>
      <div class="col-lg-10 col-md-10 col-xs-10 col-sm-10 abc" align="center">
              <h3 style="font-family:Lucida Calligraphy;margin-bottom:0;">Anugrah Narayan Singh College, Barh,<br />
                  
                  ( Patna )</h3>
               <p style="margin-bottom:0;text-align:center">(A Constituent unit of Patliputra University, Patna w.e.f 18.03.2018.)</p>
               <p style="margin-bottom:0;text-align:center">( A NAAC Accredited )</p>
               <p style="margin-bottom:0;text-align:center">Add:Barh,Patna,Bihar-803213 </p>
     </div>
     </div>  
             
               <div class="row" style="margin-bottom:10px;">
                   <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2 abc" align="center">
                
              
              </div>
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 abc" align="center">
               <h4 style="margin-bottom:0;font-family:Cursive;">COLLEGE LEAVING CERTIFICATE</h4>
              
              </div>
               </div>  

               <div class="row" style="margin-bottom:10px;">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
               <hr style="margin-top:2px;margin-bottom:15px;border-color:Black;"/>
              <div class="row">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12"> 
                 
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="border-bottom:1px solid;margin-bottom:8px">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p >Sl.No:<asp:Label ID="txtslno" Text="001" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">

               </div>
                <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
  <p>Reg.No:<asp:Label ID="txtreg_no" class="all few m-l-15 m-r-15" Text="20Gugf0808090" runat="server"></asp:Label></p>
               </div>
                        </div>
                 </div>
                
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Name of Student</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblname" Text="Name" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
                <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Father's Name</p>
               </div>
                <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
                 <p><asp:Label ID="lblfather" Text="Father's Name" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Mother's Name</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblmother" Text="Mother's Name" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Aadhar No</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblaadhar" Text="Aadhar No" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Date of birth</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lbldob" Text="03-12-2202" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Address</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblAddress" Text="VILL+PO-AUNTA,P.S-HATHIDAH,District:Patna,PIN:803303" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                  
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Name of the course</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblhonours" Text="Intermediate" class="all few m-l-15 m-r-15" runat="server"></asp:Label>(<asp:Label ID="lblstream" Text="I.Sc" class="all few m-l-15 m-r-15" runat="server"></asp:Label>)</p>
               </div>
                        </div>
               </div>

                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Academic Session</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p> <asp:Label ID="lblfrom" Text="2022" class="all few m-l-15 m-r-15" runat="server"></asp:Label>-<asp:Label ID="lblto" Text="2022" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>


                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Passing Year</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblpassyear" Text="2021" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                     <img src="../images/Anslogo.Png" class="aaaa" style=" width:600px ; height:auto; position:fixed; top: 205px; right:65px; opacity: 0.2;" alt="ERROR" />
                       
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Roll No.</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblroll_no" Text="021" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Date of leaving College</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lbldateofleave" Text="2021-03-22" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Result With Division</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lbldivision" Text="1st Division" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                   <p style="margin-left: 25px;">Overall Conduct of the Student during his/her period of study in the college</p>
               </div>
               <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
  <p style="text-align:center">:</p>
               </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
  <p><asp:Label ID="lblconduct" Text="Good" class="all few m-l-15 m-r-15" runat="server"></asp:Label></p>
               </div>
                        </div>
               </div>
                  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="padding:0px 100px;">                
                <br />
                 <p style="margin-bottom:0px;">
                This is to certify that the above information is in accordance with the college record  

                 </p>   
                 <br />                 
                 </div>
                   <div class="row">
<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">                
             <br />
                 <p style="margin-bottom:0px;">
                     <asp:Label ID="Label1" Text="2022-05-06 17:10:00.000" class="all few m-l-15 m-r-15" runat="server"></asp:Label>
                     <br />
                   Date And Time

                 </p>   
                 <br />                 
                 </div>
                <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">                
                <br />
                    <img src="../img/Principal%20signature.png" style="height:28px" />
                    
                 <p style="margin-bottom:0px;">
                Signature Of Assistant

                 </p>   
                 <br />                 
                 </div>
                  <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">                
                <br />
                    <img src="../img/Principal%20Ans%20college.png" style="height:32px" />
                             <p style="margin-bottom:0px;">
                Signature Of Principal With Seal
                                   <img src="../img/Principal%20stamp.png" style="height:28px"  />
                    <img src="../img/sealanscollege.png" style="height: 86px;margin-top: -48px;"/>

                 </p>        
                 </div>
                       </div>
               </div>
              </div>            
              </div>            
              </div>
       
              </div>
              
</div>
  </div>
      <br />
     </div>
								 </div> 
                                              
								</div>
								 </div>
								 
							 
								</div>
							 
							<!-- /.box-body -->
							<div class="box-footer" id="cancel_div" runat="server" >
								         <input type="button" id="print_receipt" value="Print" class="btn btn-primary m-b-10 border-none m-r-5 sbmt-btn" onclick="CallPrint()" /> 
                                    <a href="CharacterCertificate.aspx" class="btn btn-default m-b-10 m-l-5 sbmt-btn" title="Cancel">Cancel</a>
								<%--<button type="button" class="btn btn-primary-light me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> Save
								</button>--%>
							</div>  
						</div>
					  </div>
					  <!-- /.box -->			
		 </div>
		 
			 
		  <!-- /.row -->

		 
				  </ContentTemplate>
				  </asp:UpdatePanel>
		<!-- /.content -->
</asp:Content>

