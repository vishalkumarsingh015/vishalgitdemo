<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Top_news.aspx.cs" Inherits="Admin_Notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Top News</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin</li>
								<li class="breadcrumb-item active" aria-current="page">Top News</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>	  

		<!-- Main content -->
		<section class="content">
			<div class="row">			  
				<div class="col-lg-6 col-12">
					  <div class="box">
						<div class="box-header with-border">
						  <h4 class="box-title">Add Top Notice </h4>
						</div>
					 
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i> Notice Information</h4>
								<hr class="my-15">
							 
								   
			<asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>
									 
							 
								<div class="row">
						

								 

								  <div class="col-md-12">
									<div class="form-group">
                                              <label for="aadhar" class="control-label">Top Notice Date</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                <asp:TextBox ID="txtnotice_date" runat="server" class="form-control datepicker"   placeholder="DD-MM-YYYY" AutoComplete="off" onkeydown="javascript:return false"></asp:TextBox>
  
									</div>
								  </div>

								   
<div class="col-md-12">
									<div class="form-group">
                                  <label for="mobile" class="control-label">Top Notice Details</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                     <asp:TextBox ID="txtnotice" style="resize:none;" TextMode="MultiLine" MaxLength="120" Rows="2" runat="server" class="form-control input-default" placeholder="Notice Details" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtnotice" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
 
									</div>
								  </div>
									
								</div>
							</div>
							 
							<div class="box-footer">
			    <asp:Button ID="save" runat="server" class="btn btn-primary-light me-1" Text="Save"  OnClick="save_Click"   ValidationGroup="Must"/>
 
							</div>  
						</div>
					  </div>
					 			
				</div>  

				<div class="col-lg-6 col-12">
					<div class="row" id="stu_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>News Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example" class="text-fade table table-bordered example" style="width:100%">
					   	<thead>
							<tr class="text-dark">
							                    <th style="text-align:center;">S/N</th>
								              
                                                <th style="text-align:center;">DATE</th>
                                                <th style="text-align:center;">News Details</th>
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
                                               <%#Eval("Notice_date")%>
                                               </td>
                                                
                                                 
                                                <td>
                                               <%#Eval("Notice_details")%>
                                               </td>
                                              
                                                
                                              
                                                    <td style="text-align:center;">
<%--                                                     <asp:LinkButton ID="edit"  CommandArgument='<%# Eval("id") %>' CommandName="Edit"  runat="server" ><i class="ti-pencil-alt" style="color:green"></i></asp:LinkButton>--%>
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

