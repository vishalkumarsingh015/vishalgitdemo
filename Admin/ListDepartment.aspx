<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ListDepartment.aspx.cs" Inherits="Branch_ListDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">View All Department</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin Management</li>
								<li class="breadcrumb-item active" aria-current="page">Department</li>
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
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Department Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example5" class="text-fade table table-bordered example5" style="width:100%">
						  <thead>
                                                <tr class="text-dark">   
                                                <th style="text-align:center;">#</th>                                             
                                                    <th style="text-align:center;">Department Name</th>
                                                    <th style="text-align:center;">Action</th>
                                                </tr>
                                            </thead>
                                             <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"><ItemTemplate>
                                                <tr class="text-dark"><asp:Label ID="dept_id" runat="server" Text='<%#Eval("dept_id") %>' Visible="false"></asp:Label>
                                                    <td><%#Container.ItemIndex + 1 %></td>
                          
							<td><%# Eval("dept_name") %></td>
                            
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

