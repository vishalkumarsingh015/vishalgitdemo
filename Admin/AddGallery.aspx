<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddGallery.aspx.cs" Inherits="Admin_AddGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<script type="text/javascript">
   
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Add Gallery</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Admin</li>
								<li class="breadcrumb-item active" aria-current="page">Gallery</li>
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
						  <h4 class="box-title">Add Gallery </h4>
						</div>
					 
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i> Notice Information</h4>
								<hr class="my-15">
							 
								   
			<asp:Label ID="lblid" runat="server" Visible="false" Text="Label"></asp:Label>
									 
							 
								<div class="row">
						

								 

								  <div class="col-md-12">
									<div class="form-group">
                                                     <label for="txtnotice_title" class="control-label">Gallery Title :</label>
                                                <%--<input type="text" class="form-control input-default" placeholder="Input Default">--%>
                                                <asp:TextBox ID="txtnotice_title" runat="server" class="form-control input-default" placeholder="Notice Title" AutoComplete="off"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtnotice_title" ValidationGroup="Must"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								  </div>

								
								  <div class="col-md-6">
							   <label>Gallery Image :</label>
                  <asp:FileUpload ID="FileUpload1"  runat="server" class=" form-control input-default" onchange="ShowImagePreview11(this);"/>
              <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ForeColor="Red" ControlToValidate="FileUpload11"
                                    ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator> --%>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpeg|.jpg|.png)$"
    ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ValidationGroup="Must" ErrorMessage="Please select a valid Format of File."
    Display="Dynamic" />


								  </div>
								  <div class="col-md-6">
									                      <asp:Image ID="Imgprv11" class="img img-responsive" style="margin-bottom:10px;max-height:100px;" ImageUrl="../img/default.png" runat="server" ></asp:Image>
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
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Gallery Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example" class="text-fade table table-bordered example" style="width:100%">
					   	<thead>
							<tr class="text-dark">
							                    <th style="text-align:center;">S/N</th>
								              
                                                <th style="text-align:center;">Title</th>
                                                <th style="text-align:center;">Image</th>
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
                                               <%#Eval("title")%>
                                               </td>
                                                
                                                 
                                                <td>
                                                                 <asp:Image ID="Image1" runat="server" Height="50px"  ImageUrl='<%#Eval("image","~/img/{0}") %>' />
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

