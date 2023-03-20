<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="feeupdate.aspx.cs" Inherits="Admin_feeupdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Create Branch Head</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Employee Management</li>
								<li class="breadcrumb-item active" aria-current="page">Branch Head</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>	  

		<!-- Main content -->
		 
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Personal Details</h4>
								<hr class="my-15">
							 
								<div class="row">
						

								<div class=" form-group col-md-3">
                    <label style="float:left;">Platform<span class="text-danger">*</span></label>
               
    <asp:DropDownList ID="txtcaste" runat="server" data-placeholder="Caste"   onchange="func()" CssClass=" form-control  select " style="width:100%;height:37px;border-radius:4px" >
    <asp:ListItem Text="---Select Platform---" Value="0"></asp:ListItem>
     <asp:ListItem value="TC" Text="TC"> </asp:ListItem>
	 <asp:ListItem value="Charactor" Text="Charactor"> </asp:ListItem>
     <asp:ListItem value="PG2022" Text="PG2022"> </asp:ListItem>
     <asp:ListItem value="UG" Text="UG"> </asp:ListItem>
      <asp:ListItem value="Inter" Text="Inter"> </asp:ListItem>
</asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Initialvalue="0" ControlToValidate="txtcaste" ForeColor="Red" ErrorMessage=" Gender required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>  
       </div>                 
                
                 <div class="col-sm-3">
                  <div class="form-group">
                    <label style="float:left;">Refrence No:-</label>
                  <%--  <input name="form_name" type="text" placeholder="Enter Name" required="" class="form-control">--%>
                     <asp:TextBox ID="txtrefrence"  runat="server"  class="form-control" placeholder="Enter Your Reference" AutoComplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtrefrence"
                     ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="col-sm-3">
                  <div class="form-group">
                    <label style="float:left;">fee:-</label>
                  <%--  <input name="form_name" type="text" placeholder="Enter Name" required="" class="form-control">--%>
                     <asp:TextBox ID="txtfee"  runat="server"  class="form-control" placeholder="Enter Your Reference" AutoComplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtfee"
                     ErrorMessage="Field Required" Display="Dynamic" ValidationGroup="Must"></asp:RequiredFieldValidator>
                  </div>
                </div>
									
								</div>
									 
								</div>
							  

								 
									 
								</div>
								</div>
							 
							<!-- /.box-body -->
							<div class="box-footer">
								       <asp:Button ID="save" runat="server" Text="Save Details" class="btn btn-primary" onclick="save_Click"
                      ValidationGroup="Must"  />
                       <asp:Button ID="update" runat="server" Text="Update Details" class="btn btn-primary" 
                      ValidationGroup="Must"   />
								<%--<button type="button" class="btn btn-primary-light me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> Save
								</button>--%>
							</div>  
						</div>

			</div>
				 			
</asp:Content>

