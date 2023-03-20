<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="UGPart1_2022_25.aspx.cs" Inherits="UGPart1_2022_25" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
             <style>
        .fed{
              background-color: transparent;
     border: none;
     border-bottom: 1px solid #9e9e9e;
     border-radius: 0;
     outline: none;
     height: 3rem;
     width: 100%;
     font-size: 1rem;
     margin: 0 0 20px 0;
     padding: 0;
     box-shadow: none;
     box-sizing: content-box;
     transition: all 0.3s;
        }
        .form-group {
    margin-bottom: 2px;
}

    </style>

     

    <script type="text/javascript" >
        function allowOnlyNumber(evt) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Only Number Can Be Entered.");
                return false;
            }
            return true;
        }

        function ShowImagePreview1(input) {

            if (input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);

                reader.onload = function (e) {

                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                };
            }
        }

        function ShowImagePreview2(input) {

            if (input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);

                reader.onload = function (e) {

                    $('#<%=Image2.ClientID%>').prop('src', e.target.result)
                };
            }
        }

        function ShowImagePreview3(input) {

            if (input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);

                reader.onload = function (e) {

                    $('#<%=Image3.ClientID%>').prop('src', e.target.result)
                };
            }
        }
        function ShowImagePreview4(input) {

            if (input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);

                reader.onload = function (e) {

                    $('#<%=Image4.ClientID%>').prop('src', e.target.result)
                        };
                    }
        }
        
        function ShowImagePreview6(input) {

            if (input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);

                reader.onload = function (e) {

                    $('#<%=Image6.ClientID%>').prop('src', e.target.result)
                };
            }
        }
    </script>
    <link href="clander_css/clander-css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .ui-datepicker  .ui-datepicker-header {
        padding:0;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:scriptmanager id="ScriptManager1" runat="server"></asp:scriptmanager>
      <!--SECTION START-->
    <section>
        <div class="full-bot-book">
            <div class="container">
                <div class="row">
                    <div class="bot-book">
                        <div class="col-md-2 bb-img">
                            <img src="images/3.png" alt="">
                        </div>
                        <div class="col-md-10 bb-text">
                            <h4 style="text-align:center;color: #002147;">Anugrah Narayan Singh College Barh , ( Patna )</h4>
                            <p style="text-align:center;color: #002147;">(A Constituent unit of Patliputra University, Patna w.e.f 18.03.2018.)</p>
                            <p style="text-align:center;color: #002147;">( A NAAC Accredited )</p>
                            <p style="text-align:center;color: #002147;"> UG Part 1st (UG) Admission Applicaton Form</p>
                        </div>
                         
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--SECTION END-->

    <!--SECTION START-->
    <section>
       
         
        <div class="stu-db" id="Pro" runat="server">
            <div class="container pg-inn"  id="print_content">
             <div class="col-md-3">
                    <div class="pro-user" style="background: url(images/weather.png);">
                        <img src="css/images/ANM%20logo.jpeg" alt="user">
                    </div>
                 
                    <div class="pro-user-bio">
                        <ul>
                             <li>
                                <h4><asp:Label ID="lblname" runat="server" Text="Label"></asp:Label></h4>
                                
                            </li>
                            <li><asp:Label ID="lblregistration" runat="server" Text="Label"></asp:Label></li>
                            <li><asp:Label ID="lblstream" runat="server" Text="Label"></asp:Label></li>
                            <li><asp:Label ID="lblsession" runat="server" Text="Label"></asp:Label></li>
                        </ul>
                    </div>
                </div>
             <div class="col-md-9">
                            
                    <div class="udb">
                        
                        <div class="udb-sec udb-prof">
                            <h4><img src="images/icon/db1.png" alt="" /> My Profile</h4>
 
                    <div class="col s12">
                        <div class="form-horizontal">
                            <div class="row">
                                 <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="padding-left: 0px;">Reg_No:</label>
                                <div class="col-sm-9">
                                       <asp:TextBox ID="txtregno"  placeholder="Reg_No" CssClass="form-control"  runat="server"></asp:TextBox>
                                  
                                </div>
                            </div>
                                </div>
                                <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="padding-left: 0px;">Session:</label>
                                <div class="col-sm-9">
                                      <asp:TextBox ID="txtsession"  placeholder="Session" CssClass="form-control"  runat="server"></asp:TextBox>
                                    
                                </div>
                            </div>
                                    </div>
                                 <div class="col-sm-2">
                            <div class="form-group">
                                				<asp:Image ID="Imgprv56"  src="images/studenticon.png"  style="width: 115px;margin-top: -56px;"  runat="server" ></asp:Image>	
                               <%--  <img src="css/images/ANM%20logo.jpeg" style="width: 115px;margin-top: -56px;">--%>
                                
                                </div></div>
                                </div>
                            <div class="row">
                                 <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="padding-left: 0px;">UAN:</label>
                                <div class="col-sm-9">
                                       <asp:TextBox ID="txtuan"  placeholder="UAN"  CssClass="form-control" runat="server"></asp:TextBox>
                                  
                                </div>
                            </div>
                                </div>
                                <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-sm-3" style="padding-left: 0px;">Mobile:</label>
                                <div class="col-sm-9">
                                      <asp:TextBox ID="txtmobile" MaxLength="10"   placeholder="Mobile" CssClass="form-control" AutoComplete="off"  runat="server" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                  
                                </div>
                                
                            </div>
                                    </div>

                                <div class="col-sm-2">
                            <div class="form-group">
                                  
                                				<asp:Image ID="Image20"  src="images/signature.png"  style="width: 118px;margin-top: 10px;" runat="server" ></asp:Image>	
 
                                </div></div>
                                </div>
                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Student's Name :</label>                                               
                                                 <asp:TextBox ID="txtname"  runat="server"  class="form-control" placeholder="Enter Your Name" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtname"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>        
                         <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Father's Name :</label>                                               
                                                  <asp:TextBox ID="txtfather"  runat="server"  class="form-control" placeholder="Enter Your Father Name" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ControlToValidate="txtfather"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>     
                   <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Mother's Name :</label>                                               
                                                   <asp:TextBox ID="txtmom"  runat="server"  class="form-control" placeholder="Enter Your Mother Name" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ControlToValidate="txtmom"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                                </div>
                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">DOB</label>                                               
                                                <div class="input-group datepicker">
                  <div class="input-group-addon f1">
                    <i class="fa fa-calendar "></i>
                  </div>
                 <%-- <input class="form-control pull-right" name="dob" value="" id="dob" type="text">--%>
                  <asp:TextBox ID="DOB" runat="server" class="form-control" placeholder="Date Of Birth" AutoComplete="Off"></asp:TextBox>  
                                                     <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="DOB"
                           CssClass="cal_Theme1" Format="dd/MM/yyyy"> </cc1:CalendarExtender>
                      
          
                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" ControlToValidate="DOB"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                </div>
                                            </div>        
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                              <label for="name" class="control-label">Gender</label>
                                                  <asp:DropDownList ID="ddlgender" runat="server" data-placeholder="Gender" >
    <asp:ListItem Text="---Select Gender---" Value="0"></asp:ListItem>
 <asp:ListItem value="Male" Text="Male">Male</asp:ListItem>
	 <asp:ListItem value="Female" Text="Female">Female</asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Initialvalue="0" ControlToValidate="ddlgender" ForeColor="Red" ErrorMessage=" Gender required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>     
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Aadhar No :</label>                                               
                                                <asp:TextBox ID="txtaadhar" MaxLength="12"  placeholder="Aadhar No"  class="form-control" runat="server" AutoComplete="off"  onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ControlToValidate="txtmom"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                           </div>
                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Category</label>                                               
                                                  <asp:DropDownList ID="ddlcategory" runat="server" data-placeholder="Category">
    <asp:ListItem Text="---Select Category---" Value="0"></asp:ListItem>
     <asp:ListItem value="General" Text="General"> </asp:ListItem>
	 <asp:ListItem value="BC-I" Text="BC-I"> </asp:ListItem>
     <asp:ListItem value="BC-II" Text="BC-II"> </asp:ListItem>
     <asp:ListItem value="S.C." Text="S.C."> </asp:ListItem>
     <asp:ListItem value="S.T." Text="S.T."> </asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Initialvalue="0" ControlToValidate="ddlcategory" ForeColor="Red" ErrorMessage=" Category required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>        
                         <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Sub Category :</label>                                               
                                                 <asp:TextBox ID="txtsubcategory"  placeholder="Sub Category"  class="form-control" runat="server" AutoComplete="off" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ControlToValidate="txtsubcategory"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>     
                   <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Domicile :</label>                                               
                                                    <asp:TextBox ID="txtDomicile"  placeholder="Domicile" class="form-control" AutoComplete="off"   runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" ControlToValidate="txtDomicile"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                                </div>
                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Dom Cert :</label>                                               
                                                                                <asp:DropDownList ID="ddldom_certi" runat="server" data-placeholder="Dom Cert">
    <asp:ListItem Text="---Select Dom Cert---" Value="0"></asp:ListItem>
 <asp:ListItem value="Yes" Text="Yes">Yes</asp:ListItem>
	 <asp:ListItem value="No" Text="No">No</asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Initialvalue="0" ControlToValidate="ddldom_certi" ForeColor="Red" ErrorMessage="Dom Cert" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> 
                                            </div>        
                         <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Religion :</label>                                               
                                                  <asp:TextBox ID="txtreligion"  placeholder="Religion" class="form-control"  runat="server" AutoComplete="off" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" ControlToValidate="txtreligion"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>     
                   <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">EWS :</label>                                               
                                                           
                                                                                <asp:DropDownList ID="ddlews" runat="server" data-placeholder="EWS">
    <asp:ListItem Text="---Select EWS---" Value="0"></asp:ListItem>
 <asp:ListItem value="Yes" Text="Yes">Yes</asp:ListItem>
	 <asp:ListItem value="No" Text="No">No</asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Initialvalue="0" ControlToValidate="ddlews" ForeColor="Red" ErrorMessage="Dom Cert" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> 
                                            </div>
                                </div>
                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Minority :</label>                                               
                                       <asp:TextBox ID="txtMinority"  placeholder="Minority" class="form-control"   runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ControlToValidate="txtMinority"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>        
                         <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Nationality :</label>                                               
                                                                           <asp:DropDownList ID="txtnation" runat="server" data-placeholder="Nationality">
    <asp:ListItem Text="---Select Nationality---" Value="0"></asp:ListItem>
 <asp:ListItem value="Indian" Text="Indian">Indian</asp:ListItem>
	 <asp:ListItem value="Non Indian" Text="Non Indian">Non Indian</asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Initialvalue="0" ControlToValidate="txtnation" ForeColor="Red" ErrorMessage=" Nationality required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>     
                   <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Caste :</label>                                               
                                                     <asp:TextBox ID="TextBox13"  placeholder="Cast" class="form-control"  runat="server"></asp:TextBox>
                                    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" class="form-control" ForeColor="Red" ControlToValidate="TextBox13"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                                </div>

                            <div class="row">
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Subject Honours</label>                                               
                                                     <asp:TextBox ID="txthounours"  placeholder="Subject Honours" class="form-control"  runat="server"></asp:TextBox>
                                    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" class="form-control" ForeColor="Red" ControlToValidate="txthounours"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> 
                                            </div>        
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Subsidery1 :</label>                                               
                                                                                     <asp:DropDownList ID="ddlSubsidery1"   runat="server"></asp:DropDownList>                                        
<%--                                                 <asp:TextBox ID="txtsubs"  class="form-control" runat="server" title="Please type Subject !">
        </asp:TextBox>    --%>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlSubsidery1" InitialValue="0"  ForeColor="Red" ErrorMessage=" Subsidiary Paper required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> 
                                            </div>     
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Subsidery2 :</label>                                               
                                                                                                 <asp:DropDownList ID="ddlSubsidery2"  runat="server"></asp:DropDownList
                                                >                                               
      <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlSubsidery2" InitialValue="0"  ForeColor="Red" ErrorMessage=" Subsidiary Paper required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                                 <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Composition</label>                                               
                                                  <asp:DropDownList ID="ddlcomposition" runat="server" data-placeholder="Category">
    <asp:ListItem Text="---Select Composition---" Value="0"></asp:ListItem>
     <asp:ListItem value="Hindi" Text="Hindi"> </asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" Initialvalue="0" ControlToValidate="ddlcomposition" ForeColor="Red" ErrorMessage=" Composition required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>

                                <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Email</label>                                               
                      <asp:TextBox ID="txtemail"  placeholder="Email" class="form-control"  AutoComplete="off" runat="server"></asp:TextBox>
                                    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" class="form-control" ForeColor="Red" ControlToValidate="txtaddress"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>
                                <div class="row">
                                      
                                      <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">PPU Confidential No</label>                                               
                      <asp:TextBox ID="PPu"  placeholder="PPU Confidential No" class="form-control"    AutoComplete="off" runat="server"></asp:TextBox>
                                    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" class="form-control" ForeColor="Red" ControlToValidate="txtaddress"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>
                                      <div class="form-group col-md-12" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Address</label>                                               
                      <asp:TextBox ID="txtaddress"  placeholder="Address" class="form-control" TextMode="MultiLine" Rows="2"  AutoComplete="off" runat="server"></asp:TextBox>
                                    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" class="form-control" ForeColor="Red" ControlToValidate="txtaddress"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
                                            </div>
                                     </div>
                                </div>

                             

                         <table style="width:100%" class="table-responsive">
  <tr style="border: 1px solid;padding: 11px;">
    <th style="border: 1px solid;padding: 11px;">Class</th>
    <th style="border: 1px solid;padding: 11px;">Board / University Name</th>
    <th style="border: 1px solid;padding: 11px;">Passing Year</th>
      <th style="border: 1px solid;padding: 11px;">Roll Code & Roll Number</th>
      <th style="border: 1px solid;padding: 11px;">Max Marks</th>
      <th style="border: 1px solid;padding: 11px;">Obtained Marks</th>

  </tr>
  <tr>
    <td style="border: 1px solid;padding: 11px;">Matric</td>
    <td style="border: 1px solid;padding: 11px;"> <asp:TextBox ID="txt10thboard" CssClass="fed"  placeholder="10th Board "  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt10passingyear"  CssClass="fed" placeholder="10th Passing Year "  runat="server" Style="margin: 0px; "></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt10thRoll"  CssClass="fed" placeholder="10th Roll Code"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt10thmaxmarks" CssClass="fed"  placeholder="10th Max Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt10thObtained_Marks" CssClass="fed"  placeholder="10th Obtained Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
  </tr>
                               <tr>
    <td style="border: 1px solid;padding: 11px;">Intermediate</td>
    <td style="border: 1px solid;padding: 11px;"> <asp:TextBox ID="txt12thboard"  CssClass="fed"  placeholder="12th Board "  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt12passingyear" CssClass="fed"  placeholder="12th Passing Year "  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt12thRoll"  CssClass="fed" placeholder=" 12th Roll Code"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt12thmaxmarks"  CssClass="fed"  placeholder="12th Max Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txt12thObtained_Marks"  CssClass="fed" placeholder="12th Obtained Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
  </tr>
  <tr>
    <td style="border: 1px solid;padding: 11px;">others</td>
    <td style="border: 1px solid;padding: 11px;"> <asp:TextBox ID="txtotherboard" CssClass="fed"  placeholder="Vocational "  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txtotherpassingyear"  CssClass="fed" placeholder="Passing Year "  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txtotherRoll" CssClass="fed"  placeholder="Roll Code"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txtothermaxmarks"  CssClass="fed"  placeholder="Max Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
    <td style="border: 1px solid;padding: 11px;"><asp:TextBox ID="txtotherObtained_Marks"  CssClass="fed"  placeholder="Obtained Marks"  runat="server" Style="margin: 0px;"></asp:TextBox></td>
  </tr>
</table>
                            <div class="form-group col-md-4" ></div>
                             <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
      <asp:HiddenField ID="lblrate" runat="server" />
                                   <asp:Button class="btn btn-primary btn-large btn-block" ID="btnsave" OnClick="btnsave_Click"     runat="server" Text="Next" ValidationGroup="Must" ></asp:Button>
     <asp:Button class="btn btn-primary" ID="btnpay"   runat="server" Text="PAY NOW" OnClick="pay"      ></asp:Button>
                        </div>

                             <div class="form-group col-md-4" style="margin-left:0;margin-right:0;">
                                  
                                 </div>
                        </div>
                    </div>
              
                        </div>
                        
                    </div>
                </div>
                 </div>
        </div>
                <div class="stu-db">
            <div class="container pg-inn"  id="Document" runat="server">
                <div class="col-md-3">
                    <div class="pro-user" style="background: url(images/weather.png);">
                        <img src="css/images/ANM%20logo.jpeg" alt="user">
                    </div>
                 
                    <div class="pro-user-bio">
                        <ul>
                            
                       
                            
                        <li>
                                <h4><asp:Label ID="lblname1" runat="server" Text="Label"></asp:Label></h4>
                                
                            </li>
                            <li><asp:Label ID="lblregistration1" runat="server" Text="Label"></asp:Label></li>
                                <li><asp:Label ID="lblstream1" runat="server" Text=" "></asp:Label></li>
                            <li><asp:Label ID="lblsession1" runat="server" Text="Label"></asp:Label></li>
                             
                        </ul>
                       
                    </div>
                </div>
                <div class="col-md-9">
                            
                    <div class="udb">
                        
                        <div class="udb-sec udb-prof">
                            <h4><img src="images/icon/db1.png" alt="" /> My Profile</h4>
 
                    <div class="col s12">
                        <div class="form-horizontal">
                          

                            <div class="row">
                                 
                                
                                 <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                 <label for="photo">Upload Photo</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload1"  runat="server" class=" form-control" onchange="ShowImagePreview1(this);" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ForeColor="Red" ControlToValidate="FileUpload1"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="confirm" ></asp:RequiredFieldValidator> 
               			
                  <p class="help-block"></p>
                                            </div>   
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 78px;">
				<asp:Image ID="Image1" class="img img-responsive" src="images/studenticon.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>
                                 <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                          <label for="photo">Upload Signature</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload2"  runat="server" class=" form-control" onchange="ShowImagePreview2(this);"/>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ForeColor="Red" ControlToValidate="FileUpload2"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="confirm"></asp:RequiredFieldValidator> 
           			
                  <p class="help-block"></p>
                                            </div>  
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 42px;margin-top: 28px;">
				<asp:Image ID="Image2" class="img img-responsive" src="images/signature.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>
                                </div>

                            <div class="row">
                                        <asp:Label ID="lblref" Visible="false" runat="server" Text=""></asp:Label> 
                                <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                 <label for="photo"> 12th Mark sheet</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload3"  runat="server" class=" form-control" onchange="ShowImagePreview3(this);" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ForeColor="Red" ControlToValidate="FileUpload3"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="confirm" ></asp:RequiredFieldValidator> 
               			
                  <p class="help-block"></p>
                                            </div>   
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 78px;">
				<asp:Image ID="Image3" class="img img-responsive" src="images/document.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>
                                <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                 <label for="photo">12th Admit Card</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload4"  runat="server" class=" form-control" onchange="ShowImagePreview4(this);" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ForeColor="Red" ControlToValidate="FileUpload4"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="confirm" ></asp:RequiredFieldValidator> 
               			
                  <p class="help-block"></p>
                                            </div>   
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 78px;">
				<asp:Image ID="Image4" class="img img-responsive" src="images/document.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>
                                </div>

                            <div class="row">
                                
                                <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                          <label for="photo"> Cast Certificate </label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload5"  runat="server" class=" form-control" onchange="ShowImagePreview5(this);"/>
                  <p class="help-block"></p>
                                            </div>  
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 42px;">
				<asp:Image ID="Image5" class="img img-responsive" src="images/document.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>

                                <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                 <label for="photo">Income Certificate</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                   <asp:FileUpload ID="FileUpload6"  runat="server" class=" form-control" onchange="ShowImagePreview6(this);" />
               			
                  <p class="help-block"></p>
                                            </div>   
                                <div class="col-md-3" style="margin-left: -10px;padding-left: 78px;">
				<asp:Image ID="Image6" class="img img-responsive" src="images/document.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
				</div>
                   <div class="row">
                    <div class="col-md-12" align="center">
    <asp:Button class="btn btn-primary" ID="upd" OnClick="update_docu "   runat="server" Text="Apply " ></asp:Button>
    
                   </div>
                </div>
                                </div>

                             

                          
                        </div>
                    </div>
              
                        </div>
                        
                    </div>
                </div>
                </div>
                    </div>

    </section>
    <!--SECTION END-->  

</asp:Content>

