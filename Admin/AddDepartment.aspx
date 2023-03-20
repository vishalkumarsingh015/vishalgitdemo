<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddDepartment.aspx.cs" Inherits="Branch_AddEmployee" %>

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

    function ShowImagePreview3(input) {

        if (input.files[0]) {
            var reader = new FileReader();

            reader.readAsDataURL(input.files[0]);

            reader.onload = function (e) {

                $('#<%=Image1.ClientID%>').prop('src', e.target.result)


            };
        }
    }
    function ShowImagePreview4(input) {

        if (input.files[0]) {
            var reader = new FileReader();

            reader.readAsDataURL(input.files[0]);

            reader.onload = function (e) {

                $('#<%=Image2.ClientID%>').prop('src', e.target.result)


            };
        }
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Create Branch Head</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Employee Management</li>
								<li class="breadcrumb-item active" aria-current="page">Branch Head</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>	  

		<!-- Main content -->
		 
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Personal Details</h4>
								<hr class="my-15">
							 
								<div class="row">
						

								  <div class="col-md-4">
									<div class="form-group">
                                                     <label for="emp_name" class="control-label">Name :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="emp_name" runat="server" class="form-control input-default" placeholder="Employee Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="emp_name" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>

								  <div class="col-md-4">
									<div class="form-group">
                                              <label for="aadhar" class="control-label">Aadhar No :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="aadhar" runat="server" MaxLength="12" class="form-control input-default" placeholder="Aadhar No." AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                                                    <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
  
									</div>
								  </div>

								   
<div class="col-md-4">
									<div class="form-group">
                                  <label for="mobile" class="control-label">Mobile :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="mobile" runat="server" MaxLength="10" class="form-control input-default" placeholder="Mobile No." AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="mobile" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
        ControlToValidate="mobile" ErrorMessage="Please Enter Valid Mobile No." ForeColor="Red" ValidationExpression="^[6-9][0-9]{9}$" ValidationGroup="Must"/>
									</div>
								  </div>
									
								</div>

								<div class="row">
									
									<div class="col-md-4">
                                                                         <label for="email" class="control-label">Email :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="email" runat="server" class="form-control input-default copymail" placeholder="Email" AutoComplete="off"></asp:TextBox>
                                          
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="email" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Must"/>
                                            </div>
								    <div class="col-md-4">
    <label for="ddlgender" class="control-label">Gender :</label>
                                               <asp:DropDownList ID="ddlgender" runat="server" class="form-control select2" style="width:100%;">
                                               <asp:ListItem Text="---Select Gender---" Value="0"></asp:ListItem>
                                               <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                               <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                               </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" InitialValue="0" ControlToValidate="ddlgender" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
								    </div>
									<div class="col-md-4">
									<div class="form-group">
                                                     <label for="ddldept" class="control-label">Department :</label>                                               
                                                <asp:DropDownList ID="ddldept" runat="server" class="form-control select2" style="width:100%;"     ></asp:DropDownList>
                                               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ControlToValidate="ddldept" InitialValue="0"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>	
									</div>
								  </div>
							   </div>
								
							     
									 

							   
									 
								</div>
							 <div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Login Credential</h4>
								<hr class="my-15">
							 
								<div class="row">
						

								  <div class="col-md-4">
									<div class="form-group">
                                                    <label for="uname" class="control-label">UserName :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="uname" runat="server" class="form-control input-default setuname" placeholder="UserName" AutoComplete="off"></asp:TextBox>
                                           
									</div>
								  </div>

							      <div class="col-md-4">
									<div class="form-group">
                                              <label for="pwd" class="control-label">Password :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="pwd" runat="server" class="form-control input-default" placeholder="Password" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ForeColor="Red" ControlToValidate="pwd" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>                           <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
  
									</div>
								  </div>

								  <div class="col-md-4">
									<div class="form-group">
                                                                                          <label for="cnpwd" class="control-label">Confirm Password :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="cnpwd" runat="server" type="password" class="form-control input-default" placeholder="Confirm Password" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ForeColor="Red" ControlToValidate="cnpwd" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="pwd" ControlToValidate="cnpwd" ErrorMessage="Password Mismatched!" Display="Dynamic"></asp:CompareValidator>
									</div>
								  </div>

									 
								</div>

								 
									 
								</div>

							 <div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Upload Images</h4>
								<hr class="my-15">
							 
								<div class="row">
								   
								 <div class="col-sm-3">
                <div class="form-group ">
                      <label>Photo:</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                  <asp:FileUpload ID="FileUpload3"  runat="server" class=" form-control input-default" onchange="ShowImagePreview3(this);"/>
 
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpeg|.jpg|.png)$"
    ControlToValidate="FileUpload3" runat="server" ForeColor="Red" ValidationGroup="Must" ErrorMessage="Please select a valid Format of File."
    Display="Dynamic" />					
                  <p class="help-block"></p>
                </div>
				</div>
			                   	<div class="col-sm-3" style="padding-left:80px;">
					<%--<img src="../img/lock.png" id="img_preview" class="img img-responsive" style="margin-bottom:10px;">--%>
                    <asp:Image ID="Image1" class="img img-responsive" style="margin-bottom:10px;max-height:100px;" ImageUrl="../img/default.png" runat="server" ></asp:Image>
				</div> 

									<div class="col-sm-3">
                    <label>ID Proof:</label>
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                  <asp:FileUpload ID="FileUpload4"  runat="server" class=" form-control input-default" onchange="ShowImagePreview4(this);"/> 	
 
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpeg|.jpg|.png)$"
    ControlToValidate="FileUpload4" runat="server" ForeColor="Red" ValidationGroup="Must" ErrorMessage="Please select a valid Format of File."
    Display="Dynamic" />				
                  <p class="help-block"></p>
                </div>
				</div>
			                   	<div class="col-sm-3" style="padding-left:80px;">
					<%--<img src="../img/lock.png" id="img_preview" class="img img-responsive" style="margin-bottom:10px;">--%>
                    <asp:Image ID="Image2" class="img img-responsive" style="margin-bottom:10px;max-height:100px;" ImageUrl="../img/default.png" runat="server" ></asp:Image>
				</div> 
								  </div>

								 
									 
								</div>
								</div>
							 
							<!-- /.box-body -->
							<div class="box-footer">
								       <asp:Button ID="save" runat="server" Text="Save Details" class="btn btn-primary" onclick="save_Click"
                      ValidationGroup="Must"  />
                       <asp:Button ID="update" runat="server" Text="Update Details" class="btn btn-primary" onclick="update_Click"
                      ValidationGroup="Must"   />
								<%--<button type="button" class="btn btn-primary-light me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> Save
								</button>--%>
							</div>  
						</div>

			</div>
				 			
				 

			 
		 
			 
		 
  <!-- /.content end  -->
</asp:Content>

