<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="intermediate_Registrationdata.aspx.cs" Inherits="Admin_intermediate_Registrationdata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">View All Registration </h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin Management</li>
								<li class="breadcrumb-item active" aria-current="page">Registration Report</li>
							</ol>
						</nav>
					</div>
				</div>
				 
			</div>
		</div>	  
		   
		<!-- Main content -->
		      <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
		 
			   

			 <div class="row" id="stu_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Registration Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example5" class="text-fade table table-bordered example" style="width:100%">
						  <thead> 
                                                <tr class="text-dark">   
                                                <th style="text-align:center;">#</th>                                             
                                                    <th style="text-align:center;">Reg_No</th>
													<th style="text-align:center;">TOA</th>
													  <th style="text-align:center;">Subject_stream</th>
													  <th style="text-align:center;">Session</th>
													  <th style="text-align:center;">Name</th>
													  <th style="text-align:center;">Father's Name</th>
													  <th style="text-align:center;">Mother Name</th>
													  <th style="text-align:center;">Mobile No</th>
													  <th style="text-align:center;">Aadhar No</th>
													  <th style="text-align:center;">DOB</th>
													  <th style="text-align:center;">Gender </th>
													 <th style="text-align:center;">Category </th>
													 <th style="text-align:center;">Roll No </th>
													 <th style="text-align:center;">Bank Ac </th>
													 <th style="text-align:center;">Religion </th>
													 <th style="text-align:center;"> Bank Branch  </th>
													 <th style="text-align:center;">Ifsc Code </th>
													 <th style="text-align:center;">Nationality </th>
													 <th style="text-align:center;">First Identificatio </th>
													 <th style="text-align:center;">Second identificatio</th>
													<th style="text-align:center;">Mark Identificatio</th>

													<th style="text-align:center;">School Name</th>
													<th style="text-align:center;">School Code</th>
													<th style="text-align:center;">student category</th>
													<th style="text-align:center;">marital status</th>
													<th style="text-align:center;">Sub Divison name</th>
													<th style="text-align:center;">Distict name</th>
													<th style="text-align:center;">Subject_1</th>
													<th style="text-align:center;">Subject_2</th>
													<th style="text-align:center;">Subject_3</th>
													<th style="text-align:center;">Composition_1</th>
													<th style="text-align:center;">Composition_2</th>
													<th style="text-align:center;">additional subject Science</th>
													<th style="text-align:center;">additional subject arts</th>
													<th style="text-align:center;">medium</th>
													 <th style="text-align:center;">Photo </th>
													 <th style="text-align:center;">Sign</th>
													<th style="text-align:center;">hindi Sign</th>
											 
                                                    
                                                </tr>
                                            </thead>
                                             <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>
                                                <tr class="text-dark"> 
                                                    <td><%#Container.ItemIndex + 1 %></td>
                          
							<td><%# Eval("Reg_No") %></td>
													<td><%# Eval("Toa") %></td>
													<td><%# Eval("stream") %></td>
													<td><%# Eval("Session") %></td>
													<td><%# Eval("Name") %></td>
													<td><%# Eval("fathername") %></td>
													<td><%# Eval("Mothername") %></td>
													<td><%# Eval("Mobile_No") %></td>
													<td><%# Eval("Aadhar_no") %></td>
													<td><%# Eval("DOB") %></td>
													<td><%# Eval("Gender") %></td>
													<td><%# Eval("Category") %></td>
													<td><%# Eval("bseb_unique_id") %></td>  
													<td><%# Eval("Bank_Ac") %></td>
													<td><%# Eval("Religion") %></td>
													<td><%# Eval("Bank_branch") %></td>
													<td><%# Eval("Ifsc_code") %></td>
													<td><%# Eval("Nationality") %></td>
													<td><%# Eval("First_identificatio") %></td>
													<td><%# Eval("Second_identificatio") %></td>
													<td><%# Eval("Mark_identificatio") %></td>

													<td><%# Eval("schoolname") %></td>
													<td><%# Eval("schoolcode") %></td>
													<td><%# Eval("student_cate") %></td>
													<td><%# Eval("marital_status") %></td>
													<td><%# Eval("SubDivisonname") %></td>
													<td><%# Eval("Distictname") %></td>
													<td><%# Eval("Subject_1") %></td>
													<td><%# Eval("Subject_2") %></td>
													<td><%# Eval("Subject_3") %></td>
													<td><%# Eval("Composition_1") %></td>
													<td><%# Eval("Composition_2") %></td>
													<td><%# Eval("additional_subject") %></td>
													<td><%# Eval("additional_subject_arts") %></td>
													<td><%# Eval("medium") %></td>
													 
													    <td>
                                                                 <asp:Image ID="Image1" runat="server" Height="50px"  ImageUrl='<%#Eval("Photo","~/img/{0}") %>' />
                                               </td>
													   <td>
                                                                 <asp:Image ID="Image2" runat="server" Height="50px"  ImageUrl='<%#Eval("Sign","~/img/{0}") %>' />
                                               </td>

													 <td>
                                                                 <asp:Image ID="Image3" runat="server" Height="50px"  ImageUrl='<%#Eval("Student_signhindi","~/img/{0}") %>' />
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
					  <!-- /.box -->			
		 
		 
			 
		  <!-- /.row -->

		 
				  </ContentTemplate>
				  </asp:UpdatePanel>
		<!-- /.content -->

</asp:Content>

