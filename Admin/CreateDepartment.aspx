<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CreateDepartment.aspx.cs" Inherits="Branch_AddDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Create Department</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Custom Setting</li>
								<li class="breadcrumb-item active" aria-current="page">Create Department</li>
							</ol>
						</nav>
					</div>
				</div>
				 
			</div>
		</div>	  

		<!-- Main content -->
		<section class="content">
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Create Department</h4>
								<hr class="my-15">
								 
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
                            <label for="dept_name" class="control-label">Department Name :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="dept_name" runat="server" class="form-control input-default" placeholder="Department Name" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="dept_name" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div> 
								</div>
								 
								</div>
							 
								</div>
							 
							<!-- /.box-body -->
							   
						</div>
					  </div>
					  <!-- /.box -->			
				</div>  

			 <div class="row">			  
				<div class="col-lg-12 col-12">
					   
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
					  <!-- /.box -->			
		 
		 
			 
		  <!-- /.row -->

		</section>
 
		
</asp:Content>

