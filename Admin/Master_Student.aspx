<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Master_Student.aspx.cs" Inherits="Admin_Master_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

	<script type="text/javascript">
    function allowOnlyNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;


        if (charCode > 31 && (charCode < 48 || charCode > 57)) {

            //alert("Only Numbers Are Allowed.");
            return false;
        }
        return true;
    }
    function ShowImagePreview11(input) {

        if (input.files[0]) {
            var reader = new FileReader();

            reader.readAsDataURL(input.files[0]);

            reader.onload = function (e) {

                $('#<%=Imgprv11.ClientID%>').prop('src', e.target.result)


            };
        }
    }
    </script>
	<script type="text/javascript">
        function chng_tab2() {
            var element = document.getElementById("<%=listall.ClientID %>");
        element.classList.remove("active");
        element.classList.remove("in");
        var element = document.getElementById("<%=list_all_a.ClientID %>");
        element.classList.remove("active");
        var element = document.getElementById("<%=addnew.ClientID %>");
        element.classList.add("active");
        element.classList.add("in");
        var element = document.getElementById("<%=add_new_a.ClientID %>");
 
        element.classList.add("active");
    }
    function chng_tab1() {
        var element = document.getElementById("<%=addnew.ClientID %>");
        element.classList.remove("active");
        element.classList.remove("in");
        var element = document.getElementById("<%=add_new_a.ClientID %>"); 
        element.classList.remove("active");
        var element = document.getElementById("<%=listall.ClientID %>"); 
        element.classList.add("active");
        element.classList.add("in");
        var element = document.getElementById("<%=list_all_a.ClientID %>");
            element.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Master Student</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Academic</li>
								<li class="breadcrumb-item active" aria-current="page">Master Student</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
	 
			 <div class="row">
				<div class="col-xl-12">
					<div class="card">
						<div class="card-body">
							<h4 class="header-title">Student Details</h4>
						 
 	 
							<div class="tab-content">
								<div class="tab-pane show active" id="justified-tabs-preview">
									<ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
										<li class="nav-item">
											<a href=".listall"  id="list_all_a" runat="server" data-bs-toggle="tab"   class="nav-link rounded-0 active">
												<i class="mdi mdi-home-variant d-md-none d-block"></i>
												<span class="d-none d-md-block">List Student</span>
											</a>
										</li>
										<li class="nav-item">
											<a href=".addnew" id="add_new_a" runat="server" data-bs-toggle="tab"  class="nav-link rounded-0">
												<i class="mdi mdi-account-circle d-md-none d-block"></i>
												<span class="d-none d-md-block">Add New Student</span>
											</a>
										</li>
									</ul>

									<div class="tab-content px-20">
										<div class="tab-pane show active listall" id="listall" runat="server">
  <div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body"  id="criteria_div" runat="server">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Details</h4>
								<hr class="my-15">
								 
								 
								 
								</div>

							 
								</div>
							 
							<!-- /.box-body -->
							   
						</div>

					 
					  </div>
					  <!-- /.box -->			
				</div>  

			 <div class="row" id="class_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Details </h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id=""  class="text-fade table table-bordered example" style="width:100%">
						<thead>
							<tr class="text-dark">
								                       <th>#</th>                                             
                                                    <th> Name</th>
                                                    <th>Registration_No</th>
								                    <th>Father's_Name</th>
                                                   
                                                    <th>Gender</th>
								<th>Stream</th>
								<th>DOB</th>
								<th>Mobile</th>
								<th>Roll_no</th>
								<th>Email</th>
								<th>Session</th>
								<th>Caste</th>
								<th>Department</th>
								<th>classes</th>
                                                    <th>Action</th>
							</tr>
						</thead>
					    <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" ><ItemTemplate>
                                                <tr class="text-dark"> 
                                                    <td><%#Container.ItemIndex + 1 %></td>
                          
							<td><%# Eval("Name") %></td>
                            <td><%# Eval("Reg_no") %></td>
                            
                            <td><%# Eval("father") %></td>
													<td><%# Eval("Gender") %></td>
													<td><%# Eval("Stream") %></td>
													<td><%# Eval("DOB") %></td>
													<td><%# Eval("Mobile") %></td>
													<td><%# Eval("Roll_no") %></td>
													<td><%# Eval("email") %></td>
													<td><%# Eval("Session") %></td>
													<td><%# Eval("caste") %></td>
													<td><%# Eval("Depart") %></td>
													<td><%# Eval("classes") %></td>
                                                    <td style="text-align:center;">
                            <asp:LinkButton ID="edit"  CommandArgument='<%# Eval("id") %>' CommandName="Edit"  runat="server" ><i class="ti-pencil-alt" style="color:green"></i></asp:LinkButton>
                            <asp:LinkButton ID="delete"  CommandArgument='<%# Eval("id") %>' CommandName="Delete"  runat="server" OnClientClick="if ( !confirm('Are you sure you want to delete this record?')) return false;"><i class="ti-trash" style="color:red"></i></asp:LinkButton>
                                                    </td>
                                                </tr>  
                                                </ItemTemplate>
                                                </asp:Repeater>                                          
                                            </tbody>
			        	 
					</table>
					</div>
								 </div> 
                                              
								</div>
								 </div>
								 
							 
								</div>
							 
							<!-- /.box-body -->
							   
						</div>
					  </div>
											</div>
										<div class="tab-pane addnew"  id="addnew" runat="server">
  <div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
								<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Details</h4>
								<hr class="my-15">
								<div class="row">
								<div class="col-md-3">
                                 <label for="txtreg_no" class="control-label">Registration No :</label>                                               
                                 <asp:TextBox ID="txtreg_no" MaxLength="12" runat="server" class="form-control input-default" placeholder="Registration No." AutoComplete="off"></asp:TextBox>
				</div>

							    <div class="col-md-3">
									<div class="form-group">
                                   <label for="sname1" class="control-label">Name :</label>                                               
                                                <asp:TextBox ID="txtname" runat="server" class="form-control input-default" placeholder="Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtname" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>

							    <div class="col-md-3">
									<div class="form-group">
                                   <label for="sname1" class="control-label">Father's Name :</label>                                               
                                                <asp:TextBox ID="txtfather" runat="server" class="form-control input-default" placeholder="Father's Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtfather" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>

							    <div class="col-md-3">
									<div class="form-group">
							  <label for="dobir" class="control-label">Date Of Birth :</label>
                                            <asp:TextBox ID="dobir" runat="server" class="form-control datepicker"  placeholder="DD-MM-YYYY" AutoComplete="off" onkeydown="javascript:return false"></asp:TextBox>
                                           
									</div>
								  </div>

								  
								</div>
								<div class="row">
									<div class="col-md-3">
									<div class="form-group">
                                               <label for="email1" class="control-label">Email (For Correspondence) : </label>
                                               
                                                <asp:TextBox ID="email1" runat="server" class="form-control input-default" placeholder="Email" AutoComplete="off"></asp:TextBox>
                                  <%--         <asp:RequiredFieldValidator ID="RequiredFieldValidator2910" ForeColor="Red" ControlToValidate="email1" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email1" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Must"/>
									</div>
								  </div>
									<div class="col-md-3">
										    
                  <%--<input type="file" name="staff_photo" id="staff_photo">--%>
                    <label for="mobile1" class="control-label">Mobile (For Correspondence):</label>                                               
                                                <asp:TextBox ID="mobile1" MaxLength="10" runat="server" class="form-control input-default" placeholder="Mobile" AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2911" ForeColor="Red" ControlToValidate="mobile1" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"  
        ControlToValidate="mobile1" ErrorMessage="Please Enter Valid Mobile No." ForeColor="Red" ValidationExpression="^[6-9][0-9]{9}$" ValidationGroup="Must"/>
								    </div>
									<div class="col-md-3">
                                 <label for="aadhar_no1" class="control-label">Aadhar No :</label>                                               
                           <asp:TextBox ID="aadhar_no1" MaxLength="12" runat="server" class="form-control input-default" placeholder="Aadhar No." AutoComplete="off" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
				</div>
									<div class="col-md-3">
                                                                                          <label for="ddlgender" class="control-label">Gender : </label>                                               
                                           <asp:DropDownList ID="ddlgender" runat="server" class="form-control input-default select2" style="width:100%;">
                                           <asp:ListItem Text="---Select Gender---" Value="0"></asp:ListItem>
                                           <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                           <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                           </asp:DropDownList>     

                                            </div>
									
								</div>
							    <div class="row">
									<div class="col-md-3">
        <asp:DropDownList ID="ddlstream" class="form-control" runat="server">
                        <asp:ListItem Text="B.Com" Value="B.Com"></asp:ListItem>
                        <asp:ListItem Text="B.Sc" Value="B.Sc"></asp:ListItem>
                        <asp:ListItem Text="B.A." Value="B.A."></asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" Display="Dynamic" InitialValue="0"  ForeColor="Red" ValidationGroup="regis" ErrorMessage="Field Required" ControlToValidate="ddlstream"  ></asp:RequiredFieldValidator>     
   
				</div>
									<div class="col-md-3">
                                 <label for="txtstream" class="control-label">Roll No :</label>                                               
                                 <asp:TextBox ID="txtroll_no"  runat="server" class="form-control input-default" placeholder="Roll No" AutoComplete="off"></asp:TextBox>
				</div>
									<div class="col-md-3">
                            <label for="ddlcaste" class="control-label">Caste : </label>                                               
                                           <asp:DropDownList ID="ddlcaste" runat="server" class="form-control input-default custom_select2" style="width:100%;">
                                           <asp:ListItem Text="---Select Caste---" Value="0"></asp:ListItem>
                                           <asp:ListItem Text="General" Value="General"></asp:ListItem>
                                           <asp:ListItem Text="OBC" Value="OBC"></asp:ListItem>
                                           <asp:ListItem Text="BC-II" Value="BC-II"></asp:ListItem>
                                          <asp:ListItem Text="BC-I" Value="BC-I"></asp:ListItem>
                                         <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                                        <asp:ListItem Text="ST" Value="ST"></asp:ListItem>
                                           </asp:DropDownList> 
                                         
                                            </div>
								    <div class="col-md-3">
									<div class="form-group">
									 
                                                                                          <label for="ddlclasstype" class="control-label">Department</label>                                               
                                           <asp:DropDownList ID="ddlclasstype" runat="server" class="form-control input-default select2"  AutoPostBack="true" OnSelectedIndexChanged="select_Index" style="width:100%;">
                                           <asp:ListItem Text="---Select classes---" Value="0"></asp:ListItem>
                                           <asp:ListItem Text="Intermediate" Value="Intermediate"></asp:ListItem>
                                           <asp:ListItem Text="Graduation" Value="Graduation"></asp:ListItem>
											    <asp:ListItem Text="Post Graduation" Value="Post Graduation"></asp:ListItem>
                                           </asp:DropDownList>     

                                            
									</div>
								  </div>
			<asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>
									
								</div>
								<div class="row">
								  <div class="col-md-3">
									<div class="form-group">
									      <label for="fname1" class="control-label"> Classes :</label>                                               
                                           <asp:DropDownList ID="ddlclass" runat="server" class="form-control select2" style="width:100%;">
											   </asp:DropDownList>
									</div>
								  </div>
								  <div class="col-md-3">
									<div class="form-group">
									      <label for="fname1" class="control-label"> Session :</label>                                               
                                           <asp:DropDownList ID="ddlsession1" runat="server" class="form-control select2" style="width:100%;">
											   </asp:DropDownList>
									</div>
								  </div>
								  <div class="col-md-3">
							   <label>Student Photo :</label>
                  <asp:FileUpload ID="FileUpload1"  runat="server" class=" form-control input-default" onchange="ShowImagePreview11(this);"/>
              <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ForeColor="Red" ControlToValidate="FileUpload11"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> --%>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpeg|.jpg|.png)$"
    ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ValidationGroup="Must" ErrorMessage="Please select a valid Format of File."
    Display="Dynamic" />


								  </div>
								  <div class="col-md-3">
									                      <asp:Image ID="Imgprv11" class="img img-responsive" style="margin-bottom:10px;max-height:100px;" ImageUrl="../img/default.png" runat="server" ></asp:Image>
								  </div>
								  </div>
								</div>
							 
							 
								</div>
						
							<!-- /.box-body -->
							<div class="box-footer">
								       <asp:Button ID="save" runat="server" Text="Save Details" class="btn btn-primary" OnClick="save_Click"  
                      ValidationGroup="Must"  />
                       <asp:Button ID="update" runat="server" Text="Update Details" class="btn btn-primary"   
                      ValidationGroup="Must"  OnClick="update_Click"  />
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
										</div>
										</div>
										 

										 
										</div>

										</div>
										 
									</div>                                           
								</div> <!-- end preview-->

								  <!-- end preview code-->
							</div> <!-- end tab-content-->
						</div> <!-- end card-body -->
					  <!-- end card-->
				 <!-- end col -->

				  <!-- end col -->
</asp:Content>

