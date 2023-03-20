<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ApplyTcList.aspx.cs" Inherits="Admin_ApplyTcList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">View All TC Data</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin Management</li>
								<li class="breadcrumb-item active" aria-current="page">TC</li>
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
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Apply Tc Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example5" class="text-fade table table-bordered example" style="width:100%">
						  <thead>
                                                <tr class="text-dark">   
                                                <th style="text-align:center;">#</th>   
													 <th style="text-align:center;">Action</th>
                                                    <th style="text-align:center;">Reg_no</th>
													<th style="text-align:center;">Roll_no</th>
													<th style="text-align:center;">Student_name</th>
													<th style="text-align:center;">Father_name</th>
													<th style="text-align:center;">Mobile</th>
													<th style="text-align:center;">Aadhar</th>
													<th style="text-align:center;">email</th>
													<th style="text-align:center;">gender</th>
													<th style="text-align:center;">Session_from</th>
													<th style="text-align:center;">Session_to</th>
													<th style="text-align:center;">Stream</th>
													<th style="text-align:center;">Honours</th>
													<th style="text-align:center;">Fee_recipt</th>
													<th style="text-align:center;">Marksheet</th>
                                                    <th style="text-align:center;">Action</th>
                                                </tr>
                                            </thead>
                                             <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"><ItemTemplate>
                                                <tr class="text-dark"> 
                                                    <td><%#Container.ItemIndex + 1 %></td>
                                                    <td> <a  href='<%#Eval("Student_id","TcForm_update.aspx?id={0}") %>'  class="btn btn-primary" ><%#Eval("Student_id")%></a></td>
							                        <td><%# Eval("Reg_no") %></td>
													<td><%# Eval("Roll_no") %></td>
													<td><%# Eval("Student_name") %></td>
													<td><%# Eval("Father_name") %></td>
													<td><%# Eval("Mobile") %></td>
													<td><%# Eval("Aadhar") %></td>
													<td><%# Eval("email") %></td>
													<td><%# Eval("gender") %></td>
													<td><%# Eval("Session_from") %></td>
													<td><%# Eval("Session_to") %></td>
													<td><%# Eval("Stream") %></td>
													<td><%# Eval("Honours") %></td>
													<td><asp:Image ID="Image1" runat="server" Height="50px"  ImageUrl='<%#Eval("Fee_recipt","~/img/{0}") %>' /> </td>
													<td><asp:Image ID="Image2" runat="server" Height="50px"  ImageUrl='<%#Eval("Marksheet","~/img/{0}") %>' /> </td>
										 
                            
                                                    <td style="text-align:center;">
                            <asp:LinkButton ID="edit"  CommandArgument='<%# Eval("ID") %>' CommandName="Edit"  runat="server" ><i class="ti-pencil-alt color-success"></i></asp:LinkButton>
                            <asp:LinkButton ID="delete"  CommandArgument='<%# Eval("ID") %>' CommandName="Delete"  runat="server" OnClientClick="if ( !confirm('Are you sure you want to delete this record?')) return false;"><i class="ti-trash color-danger"></i></asp:LinkButton>
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

