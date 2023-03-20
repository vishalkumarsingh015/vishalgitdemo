<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Admin_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript">
    function allowOnlyNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;


        if (charCode > 31 && (charCode < 48 || charCode > 57)) {

            //alert("Only Numbers Are Allowed.");
            return false;
        }
        return true;
    }
   <%-- function ShowImagePreview11(input) {

        if (input.files[0]) {
            var reader = new FileReader();

            reader.readAsDataURL(input.files[0]);

            reader.onload = function (e) {

                $('#<%=Imgprv11.ClientID%>').prop('src', e.target.result)


            };
        }
    }--%>
    </script>
	<script type="text/javascript">
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Master Student</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Academic</li>
								<li class="breadcrumb-item active" aria-current="page">Master Student</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
	 
			 <div class="row">
				<div class="col-xl-12">
					<div class="card">
						<div class="card-body">
							<h4 class="header-title">Student Complaints</h4>
						 
 	 
							<div class="tab-content">
								<div class="tab-pane show active" id="justified-tabs-preview">
									

									<div class="tab-content px-20">
										<div class="tab-pane show active listall" id="listall" runat="server">
    

			 <div class="row" id="class_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Complaints </h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id=""  class="text-fade table table-bordered example" style="width:100%">
						<thead>
							<tr class="text-dark">
								                       <th>#</th>                                             
                                                    <th> Name</th>
							                         <th>email</th>
                                                    <th>phone</th>
								                    
                                                   
                                                   
								<th>subject</th>
								<th>message</th>
								
								
                                                    <th>Action</th>
							</tr>
						</thead>
					    <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" ><ItemTemplate>
                                                <tr class="text-dark"> 
                                                    <td><%#Container.ItemIndex + 1 %></td>
                          
							<td><%# Eval(" Name") %></td>
                            <td><%# Eval("email") %></td>
                            
                            <td><%# Eval("phone") %></td>
													
													<td><%# Eval("subject") %></td>
													
													<td><%# Eval("message") %></td>
													
                                                    <td style="text-align:center;">
                          <%-- <asp:LinkButton ID="edit"  CommandArgument='<%# Eval("id") %>' CommandName="Edit"  runat="server" ><i class="ti-pencil-alt" style="color:green"></i></asp:LinkButton>--%>
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
											</div>
										
										</div>
										 

										 
										</div>

										</div>
										 
									</div>                                           
								</div> <!-- end preview-->

								  <!-- end preview code-->
							</div> <!-- end tab-content-->
						</div> <!-- end card-body -->
					  <!-- end card-->
				 <!-- end col -->

				  <!-- end col -->

</asp:Content>

