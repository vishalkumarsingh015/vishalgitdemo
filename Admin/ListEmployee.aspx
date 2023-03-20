<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ListEmployee.aspx.cs" Inherits="Branch_ListEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">List All Employee</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Employee Management</li>
								<li class="breadcrumb-item active" aria-current="page">Employee</li>
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
					  <table id="example5" class="text-fade table table-bordered example" style="width:100%">
						<thead>
							<tr class="text-dark">
							                      <th style="text-align:center;">#</th> 
                                                                                         
                                                    <th style="text-align:center;">Name</th>
                                                    <th style="text-align:center;">Mobile No.</th>
                                                    <th style="text-align:center;">Email</th>
								   <th style="text-align:center;">Dept_name</th>
								 <th style="text-align:center;">Username</th>
								 <th style="text-align:center;">Password</th>
                                                    <th style="text-align:center;">Action</th>
							</tr>
						</thead>
					    <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"><ItemTemplate>
                                                <tr><asp:Label ID="emp_id" runat="server" Text='<%#Eval("emp_id") %>' Visible="false"></asp:Label>
                                                    <td><%#Container.ItemIndex + 1 %></td>
                        
							<td><%# Eval("emp_name") %></td>
                            <td><%# Eval("mobile") %></td>
                            <td><%# Eval("email") %></td>
													 <td><%# Eval("dept_name") %></td>
													     <td> <asp:Label ID="Label2" runat="server" Text='<%#chng(Eval("UserName")) %>'></asp:Label></td>
                                      <td> <asp:Label ID="pwd" runat="server" Text='<%#chng(Eval("password")) %>'></asp:Label></td>
                      
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

