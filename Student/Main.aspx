<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="SuperAdmin_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  <!-- Content Wrapper. Contains page content -->
 
		<!-- Main content -->
	 
			<div class="row">
				<div class="col-xl-9 col-12">
					<div class="box bg-success">
						<div class="box-body d-flex p-0">
							<div class="flex-grow-1 p-30 flex-grow-1 bg-img bg-none-md" style="background-position: right bottom; background-size: auto 100%; background-image: url(http://edulearn-lms-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-30.svg)">
								<div class="row">
									<div class="col-12 col-xl-7">
										<h1 class="mb-0 fw-600">Power your College with UPL EduTech!</h1>
										<p class="my-10 fs-16 text-white-70">A complete College ERP  with modules.</p>
										<div class="mt-45 d-md-flex align-items-center">
											<div class="me-30 mb-30 mb-md-0">
												<div class="d-flex align-items-center">
													<div class="me-15 text-center fs-24 w-50 h-50 l-h-50 bg-danger b-1 border-white rounded-circle">
														<i class="ti-user"></i>
													</div>
													<div>
														<h5 class="mb-0"> Students Name</h5>
														<p class="mb-0 text-white-70"></p>
													</div>
												</div>
											</div>
											<div>
												<div class="d-flex align-items-center">
													<div class="me-15 text-center fs-24 w-50 h-50 l-h-50 bg-warning b-1 border-white rounded-circle">
														<i class="ti-marker"></i>
													</div>
													<div>
														<h5 class="mb-0">Addmission Date</h5>
														<p class="mb-0 text-white-70">20/07/2022</p>
													</div>
												</div>

											</div>
										</div>

									</div>
									<div class="col-12 col-xl-5">

										<div class="d-flex align-items-center" style="margin-top: 149px;">
													<div class="me-15 text-center fs-24 w-50 h-50 l-h-50 bg-warning b-1 border-white rounded-circle">
														<i class="ti-write"></i>
													</div>
													<div>
														<h5 class="mb-0">Total Fee</h5>
														<p class="mb-0 text-white-70">20000</p>
													</div>
												</div>
									</div>
								</div>
							</div>
						</div>
					</div>										
				</div>
				<div class="col-xl-3 col-12">
					<div class="box bg-transparent no-shadow">
						<div class="box-body p-xl-0 text-center">							
							<h3 class="mb-20">Have More<br>knowledge to share?</h3>
							<a href="course.html" class="waves-effect waves-light w-p100 btn btn-primary"><i class="ti-plus me-15"></i> Compose Mail</a>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<a class="box box-link-shadow text-center pull-up" href="javascript:void(0)">
								<div class="box-body py-5 bg-primary-light px-5">
									<p class="fw-500 text-primary text-overflow">Total Fee</p>
								</div>
								<div class="box-body p-10">
									<p class="countnm  m-0" style="font-size: 21px;">50000</p>
								</div>
							</a>
						</div>
						<div class="col-6">
							<a class="box box-link-shadow text-center pull-up" href="javascript:void(0)">
								<div class="box-body py-5 bg-primary-light px-5">
									<p class="fw-500 text-primary text-overflow">Other Fee</p>
								</div>
								<div class="box-body p-10">
									<p class="countnm   m-0" style="font-size: 21px;">250</p>
								</div>
							</a>
						</div>
					</div>
				</div>
				 
				 
				<div class="col-xl-8 col-12">
					<div class="box">
						<div class="box-header no-border">
							<h3 class="box-title">Admission Performance</h3>
						</div>
						<div class="box-body">
							<div id="performance_chart"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-header no-border">
							<h3 class="box-title">Overall Pass Percentage</h3>
						</div>
						<div class="box-body" style="min-height: 275px;">
							<div id="pass_chart"></div>
						</div>
					</div>
				</div>
				 				
				  
			</div>
	 
		<!-- /.content -->
	 
  <!-- /.content-wrapper -->

</asp:Content>

