<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Take_Addmission_session.aspx.cs" Inherits="Admin_Take_Addmission_session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">All Classes</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin</li>
								<li class="breadcrumb-item active" aria-current="page">Classes</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>	  

		<!-- Main content -->
		<section class="content">
			<div class="row">			  
				<div class="col-lg-7 col-12">
					  <div class="box">
						<div class="box-header with-border">
						  <h4 class="box-title">Take Addmission</h4>
						</div>
					 
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i> Addmission Information</h4>
								<hr class="my-15">
								<div class="row">
								  <div class="col-md-4">
									<div class="form-group">
									 
                                            <label for="ddlclasstype" class="control-label">Department</label> 
										
                                           <asp:DropDownList ID="ddlclasstype" runat="server" class="form-control input-default select2"  AutoPostBack="true" OnSelectedIndexChanged="select_Index" style="width:100%;">
                                           <asp:ListItem Text="---Select classes---" Value="0"></asp:ListItem>
                                           <asp:ListItem Text="Intermediate" Value="Intermediate"></asp:ListItem>
                                           <asp:ListItem Text="Graduation" Value="Graduation"></asp:ListItem>
										   <asp:ListItem Text="Post Graduation" Value="Post Graduation"></asp:ListItem>
                                           </asp:DropDownList>  
										<asp:RequiredFieldValidator ControlToValidate="ddlclasstype" ID="RequiredFieldValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a type" InitialValue="0" runat="server"  Display="Dynamic"></asp:RequiredFieldValidator>

                                            
									</div>
								  </div>
			<asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>
									<div class="col-md-4">
									<div class="form-group">
									    <label for="fname1" class="control-label"> Classes :</label>                                               
                                        <asp:DropDownList ID="ddlclass" runat="server" class="form-control select2" style="width:100%;">
										</asp:DropDownList>
										<asp:RequiredFieldValidator ControlToValidate="ddlclass" ID="RequiredFieldValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a type" InitialValue="0" runat="server"  Display="Dynamic"></asp:RequiredFieldValidator>

									</div>
								  </div>

								  <div class="col-md-4">
									<div class="form-group">
									      <label  class="control-label"> Session :</label>                                               
                                           <asp:DropDownList ID="ddlsession1" runat="server" class="form-control select2" style="width:100%;">
											   </asp:DropDownList>
																<asp:RequiredFieldValidator ControlToValidate="ddlsession1" ID="RequiredFieldValidator3"
ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a type"
InitialValue="0" runat="server"  Display="Dynamic">
</asp:RequiredFieldValidator>
									</div>
								  </div>
								</div>
							</div>
							 
							<div class="box-footer">
			    <asp:Button ID="save" runat="server" class="btn btn-primary-light me-1" Text="Save" ValidationGroup="g1" OnClick="save_Click"  />
                <asp:Button ID="update" runat="server" class="btn btn-primary-light me-1" Text="Update" ValidationGroup="g1" OnClick="update_Click" />
							</div>  
						</div>
					  </div>
					 			
				</div>  

				<div class="col-lg-5 col-12">
					<div class="row" id="stu_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Addmission Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example" class="text-fade table table-bordered example" style="width:100%">
					   	<thead>
							<tr class="text-dark">
							                    <th style="text-align:center;">S/N</th>
								                <th style="text-align:center;">Department</th>
                                                <th style="text-align:center;">Class</th>
                                                <th style="text-align:center;">Session</th>
                                                <th style="text-align:center;">Action</th>
							</tr>
						  </thead>
					    <tbody>
                                               <asp:Repeater ID="Repeater1" OnItemCommand="Repeater1_ItemCommand"  runat="server" >
                 <ItemTemplate> 
                                                <tr style="color:black">
                                            
                                                 <td>
                                                      <%#Container.ItemIndex + 1 %>
                                                </td>
											    <td>
                                               <%#Eval("addmission_type")%>
                                               </td>
											    <td>
                                               <%#Eval("classes")%>
                                               </td>
                                                
                                                 
                                                <td>
                                               <%#Eval("session")%>
                                               </td>
                                              
                                                
                                              
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
				 		
				</div>
 
		</section>
	 
	 

</asp:Content>

