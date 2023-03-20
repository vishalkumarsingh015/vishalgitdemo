<%@ Page Title="" Language="C#" MasterPageFile="~/Branch/MasterPage.master" AutoEventWireup="true" CodeFile="CasteWise.aspx.cs" Inherits="Branch_CasteWise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Caste Wise Strength</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="ti-home"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Report Summary</li>
								<li class="breadcrumb-item active" aria-current="page">Caste Wise</li>
							</ol>
						</nav>
					</div>
				</div>
				 
			</div>
		</div>	  
		 
		<!-- Main content -->
		      <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
	 
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body"  id="criteria_div" runat="server">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Search Details</h4>
								<hr class="my-15">
								 
								<div class="row">
                                        <div class="form-group col-md-3">
                                                <label for="ddlsession" class="control-label">Session :</label>
                                               <asp:DropDownList ID="ddlsession" runat="server" class="form-control select2" style="width:100%;"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="ddlsession" ValidationGroup="Must" InitialValue="0"
                                    runat="server" ErrorMessage="Field Required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                          <div class="form-group col-md-3">
                                            <br />
                                             <asp:Button ID="search" runat="server" Text="Generate" class="btn btn-success" onclick="search_Click"
                      ValidationGroup="Must"  />
                       <a href="Main.aspx" class="btn btn-default m-b-10 m-l-5 sbmt-btn" title="Cancel">Cancel</a>
                                            </div>
                                             
                                        </div>
								 
								</div>

							 
								</div>
							 
							<!-- /.box-body -->
							   
						</div>

					 
					  </div>
					  <!-- /.box -->			
				</div>  

			 <div class="row" id="stu_div" runat="server">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-primary mb-0"><i class="ti-user me-15"></i>Student Strength Details</h4>
								<hr class="my-15">
								 
								<div class="row">
									 <div class="table-responsive">
					  <table id="example" class="text-fade table table-bordered example" style="width:100%">
						<thead>
							<tr class="text-dark">
								                         <th style="text-align:center;vertical-align:middle;" rowspan="2">#</th>
                                                <th style="text-align:center;vertical-align:middle;" rowspan="2">Class</th>
                                                   <th style="text-align:center;" colspan="3">Total Student</th>
                                                     <th style="text-align:center;" colspan="3">General</th>
                                                      <th style="text-align:center;" colspan="3">OBC</th>
                                                      <th style="text-align:center;" colspan="3">SC</th>
                                                      <th style="text-align:center;" colspan="3">ST</th>
                                                      <th style="text-align:center;" colspan="3">Other</th> 
							</tr>
							<tr class="text-dark">
								                         <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>
                                                       <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>
                                                        <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>
                                                        <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>
                                                        <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>
                                                        <th style="text-align:center;">Male</th>
                                                     <th style="text-align:center;">Female</th>
                                                      <th style="text-align:center;">Total</th>

							</tr>
						</thead>
					    <tbody>
                                             <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>
                                             <asp:Label ID="class_id" runat="server" Text='<%#Eval("class_id") %>' Visible="false"></asp:Label>
                                                   <tr class="text-dark">   
                                                <td style="text-align:center;"><%#Container.ItemIndex+1 %>.</td>
                                                <td style="text-align:center;"><%#Eval("class_name") %></td>
                                                    <td style="text-align:center;">
                                                    <asp:Label ID="t_m" runat="server"></asp:Label>
                                                    </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="t_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="t_t" runat="server"></asp:Label>
                                                      </td>
                                                       <td style="text-align:center;">
                                                       <asp:Label ID="g_m" runat="server"></asp:Label>
                                                       </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="g_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="g_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="o_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="o_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="o_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="s_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="s_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="s_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="st_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="st_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="st_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="ot_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="ot_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="ot_t" runat="server"></asp:Label>
                                                      </td>
                                                </tr> 
                                                    </ItemTemplate></asp:Repeater>           
                                            <tr class="text-dark">   
                                              
                                                <td style="text-align:right;" colspan="2">Total</td>
                                                    <td style="text-align:center;">
                                                    <asp:Label ID="lt_m" runat="server"></asp:Label>
                                                    </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="lt_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lt_t" runat="server"></asp:Label>
                                                      </td>
                                                       <td style="text-align:center;">
                                                       <asp:Label ID="lg_m" runat="server"></asp:Label>
                                                       </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="lg_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lg_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lo_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="lo_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lo_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="ls_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="ls_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="ls_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lst_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="lst_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lst_t" runat="server"></asp:Label>
                                                      </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lot_m" runat="server"></asp:Label>
                                                      </td>
                                                     <td style="text-align:center;">
                                                     <asp:Label ID="lot_f" runat="server"></asp:Label>
                                                     </td>
                                                      <td style="text-align:center;">
                                                      <asp:Label ID="lot_t" runat="server"></asp:Label>
                                                      </td>
                                                </tr>
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

