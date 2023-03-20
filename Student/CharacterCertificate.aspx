<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="CharacterCertificate.aspx.cs" Inherits="Branch_CharacterCertificate" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Generate Character Certificate</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Generate Certificate</li>
								<li class="breadcrumb-item active" aria-current="page">Character Certificate</li>
							</ol>
						</nav>
					</div>
				</div>
				 
			</div>
		</div>	  
		 
		<!-- Main content -->
		      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
	 
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body"  id="criteria_div" runat="server">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Search Criteria</h4>
								<hr class="my-15">
								 
								<div class="row">
                                       <div class="form-group col-md-3">
                                                <label for="ddlsession" class="control-label">Session :</label>
                                               <asp:DropDownList ID="ddlsession" runat="server" class="form-control select2" style="width:100%;"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="ddlsession" ValidationGroup="Must" InitialValue="0"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                       <div class="form-group col-md-3">
                                                <label for="ddlclass" class="control-label">Class Name :</label>
                                               <asp:DropDownList ID="ddlclass" runat="server" class="form-control select2" style="width:100%;" AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="ddlclass" ValidationGroup="Must" InitialValue="0"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>                                                                                     
                                       <div class="form-group col-md-3">
                                                <label for="ddlsection" class="control-label">Section Name :</label>
                                               <asp:DropDownList ID="ddlsection" runat="server" class="form-control select2" style="width:100%;" AutoPostBack="true" OnSelectedIndexChanged="ddlsection_SelectedIndexChanged"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="ddlsection" ValidationGroup="Must" InitialValue="0"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>       
                                       <div class="form-group col-md-3">
                                                <label for="ddlstu" class="control-label">Student Name :</label>
                                                <asp:DropDownList ID="ddlstu" runat="server" class="form-control select2" style="width:100%;"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="ddlstu" ValidationGroup="Must" InitialValue="0"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
								 
								 
								</div>

							 <div class="box-footer" id="Div1" runat="server" >
								                <asp:Button ID="search" runat="server" Text="Generate" class="btn btn-primary m-b-10 border-none m-r-5 sbmt-btn" onclick="search_Click"
                      ValidationGroup="Must"  />
								<%--<button type="button" class="btn btn-primary-light me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> Save
								</button>--%>
							</div>
								</div>
							 
							<!-- /.box-body -->
							   
						</div>

					 
					  </div>
					  <!-- /.box -->			
				</div>  

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
          <div class="row" style="margin-bottom:15px;">   
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 abc" align="center">
              <h3 style="font-family:Lucida Calligraphy;margin-bottom:0;"><asp:Label ID="b_name" runat="server"></asp:Label></h3>
               <p style="margin-bottom:0;text-align:center"><asp:Label ID="b_add" runat="server"></asp:Label></p>
               <p style="margin-bottom:0;text-align:center">Mob: +91 <asp:Label ID="b_contact" runat="server"></asp:Label>, Email: <asp:Label ID="b_email" runat="server"></asp:Label></p>
              </div>
              </div>  
             
               <div class="row" style="margin-bottom:10px;"> 
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 abc" align="center">
               <h4 style="margin-bottom:0;font-family:Cursive;">Character Certificate</h4>
              
              </div>
               </div>  

               <div class="row" style="margin-bottom:10px;">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
               <hr style="margin-top:2px;margin-bottom:15px;border-color:Black;"/>
              <div class="row">
              <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12"> 
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="row">
               <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
               </div>
               <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
               <span style="width:20%;">Date :</span><p class="dash" style="float:right;width:68%;"><asp:Label ID="print_dt" class="all few" runat="server"></asp:Label></p> 
               </div>
                        </div>
               </div>
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="padding:20px 90px; line-height:2.5;">
              <span >This is to certify that I know Mr./Ms./Ku. 
              <span class="dash"><asp:Label ID="sname" class="all few m-l-15 m-r-15" runat="server"></asp:Label></span>
              S/D/C of Mr. 
              <span class="dash"><asp:Label ID="fname" class="all few  m-l-15 m-r-15" runat="server"></asp:Label></span>
              & Mrs./Ms. 
              <span class="dash"><asp:Label ID="mname" class="all few  m-l-15 m-r-15" runat="server"></asp:Label></span>
              resident of
              <span class="dash m-l-15 m-r-15"><asp:Label ID="residential_add" class="all few  m-l-15 m-r-15" runat="server"></asp:Label></span>
              for the last 
               <span class="dash m-l-15 m-r-15"><asp:Label ID="yrs" class="all few  m-l-15 m-r-15" runat="server"></asp:Label></span>
               years.
               Mr./Ms./Ku.
               <span class="dash m-l-15 m-r-15"><asp:Label ID="sname1" class="all few" runat="server"></asp:Label></span>
               bears good moral character and to the best of my knowledge is not involved 
               in any criminal activity and no personal legal case is pending against him/her.
              </span>
              </div>             
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="padding:0px 100px;">                
                <br />
                 <p style="margin-bottom:0px;">
                Signature With Seal

                 </p>   
                 <br />                 
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

