<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Bonafide.aspx.cs" Inherits="Student_Bonafide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function allowOnlyNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;

        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            // alert("Only Numbers Are Allowed.");
            return false;
        }
        return true;
    }

 
 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Apply Bonafide certificate </h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Apply Bonafide certificate</li>
								<li class="breadcrumb-item active" aria-current="page">Student</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>	  
    <div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Personal Details</h4>
								<hr class="my-15">
							 
								<div class="row">
								  <div class="col-md-3">
									<div class="form-group">
                                                     <label for="txtregno" class="control-label">Registration No :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="txtregno"  runat="server" class="form-control input-default" placeholder="Registration No" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtregno" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>
                                  <div class="col-md-3">
									<div class="form-group">
                                              <label for="txtrollno" class="control-label">Roll No :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="txtrollno" runat="server"   class="form-control input-default" placeholder="Roll No" AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtrollno" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>                        
									</div>
								  </div>
								  <div class="col-md-3">
									<div class="form-group">
                                             <label for="txtstudent_num" class="control-label">Student's Name :</label>
                                            <asp:TextBox ID="txtstudent_num" runat="server" class="form-control"  placeholder="Student's Name" AutoComplete="off"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtstudent_num" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>
                                  <div class="col-md-3">
									<div class="form-group">
                                  <label for="txtfathername" class="control-label">Father's Name :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="txtfathername" runat="server"  class="form-control" placeholder="Father's Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtfathername" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>
									
								</div>
								<div class="row">

                                    <div class="col-md-3">
									<div class="form-group">
                                  <label for="txtfathername" class="control-label">Mother's Name :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="txtmother" runat="server"  class="form-control" placeholder="Mother's Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" ControlToValidate="txtmother" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>
									<div class="col-md-3">
									<div class="form-group">
                                  <label for="mobile" class="control-label">Mobile :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="mobile" runat="server" MaxLength="10" class="form-control input-default" placeholder="Mobile No." AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ControlToValidate="mobile" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
        ControlToValidate="mobile" ErrorMessage="Please Enter Valid Mobile No." ForeColor="Red" ValidationExpression="^[6-9][0-9]{9}$" ValidationGroup="Must"/>
									</div>
								  </div>
                                    <div class="col-md-3">
                                                <label for="name" class="control-label">Aadhra No</label>                                               
                                                 <asp:TextBox ID="txtaadhar_no"  runat="server"  class="form-control" placeholder="Aadhar" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ForeColor="Red" ControlToValidate="txtaadhar_no"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
									<div class="col-md-3">
                                                                         <label for="email" class="control-label">Email :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="email" runat="server" class="form-control input-default copymail" placeholder="Email" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="email" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="email" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Must"/>
                                            </div>
								     
							   </div>
                                <div class="row">
                                    <div class="col-md-3">
									<div class="form-group">
                                              <label for="aadhar" class="control-label">DOB</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                <asp:TextBox ID="txtnotice_date" runat="server" class="form-control datepicker"   placeholder="DD-MM-YYYY" AutoComplete="off" onkeydown="javascript:return false"></asp:TextBox>
  
									</div>
								  </div>
                                    <div class="col-md-3">
                                               <label for="ddlgender" class="control-label">Gender :</label>
                                               <asp:DropDownList ID="ddlgender" runat="server" class="form-control select2" style="width:100%;">
                                               <asp:ListItem Text="---Select Gender---" Value="0"></asp:ListItem>
                                               <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                               <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                               </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" InitialValue="0" ControlToValidate="ddlgender" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
								    </div>
                                    <div class="col-md-3">
									<div class="form-group">
                                             <label for="txtfathername" class="control-label">Session From :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                            <asp:TextBox ID="txtsessionfrom" runat="server"  class="form-control" placeholder="Session From" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="txtsessionfrom" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
                                    </div>
                                    <div class="col-md-3">
									<div class="form-group">
                                             <label for="txtfathername" class="control-label">Session To :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                            <asp:TextBox ID="txtsessionto" runat="server"  class="form-control" placeholder="Session To" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" ControlToValidate="txtsessionfrom" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>  
                                    </div>
                                    
                                    
                               </div>
							    <div class="row">
                                    <div class="form-group col-md-3">
                                                <label for="name" class="control-label">Stream</label>                                               
                                                 <asp:TextBox ID="txtstream"  runat="server"  class="form-control" placeholder="Stream" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ForeColor="Red" ControlToValidate="txtstream"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>
                                    
                                    <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Subject</label>                                               
                                                 <asp:TextBox ID="txtsub"  runat="server"  class="form-control" placeholder="Subject" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ForeColor="Red" ControlToValidate="txtsub"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>

                                    
                                    <div class="form-group col-md-3" style="margin-left:0;margin-right:0;">
                                                <label for="name" class="control-label">Admission fee</label>                                               
                                                 <asp:TextBox ID="txtadmissionfee"  runat="server"  class="form-control" placeholder="Admission fee" AutoComplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ControlToValidate="txtadmissionfee"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                                            </div>

                                    
                                     <div class="form-group col-md-3">
                                             								<label>Last Fee Receipt:</label>
		 
   <asp:FileUpload ID="FileUpload2"  runat="server" class=" form-control input-default" onchange="ShowImagePreview4(this);"/>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ForeColor="Red" ControlToValidate="FileUpload2"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>          
                                            </div>
                                     <div class="form-group col-md-1" style="margin-left:0;margin-right:0;">
                                            <asp:Image ID="Image2" class="img img-responsive" src="../images/document.png"  style="margin-bottom:10px;max-height:100px;" runat="server" ></asp:Image>	
                                            </div>
							    </div>
								</div>
								</div>
							 
							<!-- /.box-body -->
							<div class="box-footer">
								       <asp:Button ID="save" runat="server" Text="Save Details" OnClick="save_Click" class="btn btn-primary"
                      ValidationGroup="Must"  />
                              
                       
								<%--<button type="button" class="btn btn-primary-light me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> Save
								</button>--%>
							</div>  
						</div>

			</div>
                </div>
		<!-- Main content -->

</asp:Content>

