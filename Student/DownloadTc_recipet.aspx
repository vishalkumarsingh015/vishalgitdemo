<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="DownloadTc_recipet.aspx.cs" Inherits="Student_DownloadTc_recipet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Download Tc Receipt</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Download Tc Receipt</li>
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
									<div class="form-group" style="margin-top: 18px;">
                                 <asp:Button ID="Button2" runat="server" Text="Save Details" OnClick="save_Click" class="btn btn-primary"
                      ValidationGroup="Must"  />
										</div>
								</div>
									
								</div>
								  
								</div>
								</div>
							 
						 
							   
						</div>

			</div>
                </div>
		<!-- Main content -->
</asp:Content>

