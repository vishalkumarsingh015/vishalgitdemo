<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    	<!-- Banner Area Start -->
		<div class="banner-area-wrapper">
            <div class="banner-area text-center">	
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="banner-content-wrapper">
                                <div class="banner-content">
                                    <h2>login</h2> 
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
		<!-- Banner Area End -->
        <!-- Login start -->
        <div class="login-area pt-150 pb-150">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <div class="login">
                            <div class="login-form-container">
                                <div class="login-text">
                                    <h2>login</h2>
                                    <span>Please login using account detail bellow.</span>
                                </div>
                                <div class="login-form">
                                    <div action="#" method="post">
                                       <%-- <input type="text" name="user-name" placeholder="Username">--%>
              		             <asp:TextBox ID="username" runat="server"  class="form-control" placeholder="Enter Username"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="username" ValidationGroup="Must_123"
                                    runat="server" ErrorMessage="Password Required." Display="Dynamic"></asp:RequiredFieldValidator>

                     
                                         <asp:TextBox ID="password" runat="server" type="password" class="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="password" ValidationGroup="Must_123"
                                    runat="server" ErrorMessage="Password Required." Display="Dynamic"></asp:RequiredFieldValidator>

                                        <div class="button-box">
                                            <div class="login-toggle-btn" id="checkbox_div" runat="server">
                                               <asp:CheckBox ID="basic_checkbox_1" runat="server"/>
										 
                                                <label for="basic_checkbox_1">Remember me</label>
                                                <a href="#">Forgot Password?</a>
                                            </div>
                                          
                                              <asp:Button ID="LinkButton1" runat="server"   class="default-btn" type="submit" Text="Sign In"  OnClick="Button1_Click" ValidationGroup="Must_123"/>
                   
											  <asp:Button ID="Button2" runat="server"     class="default-btn" ValidationGroup="Must_123" OnClick="Button2_Click"   Text="Sign up"  />
                                              <div class="text-center">
									 <asp:Label ID="Message" runat="server" ForeColor="#ff0000"></asp:Label>
									<p class="mt-15 mb-0 text-fade">Don't have an account? <a href="#" class="text-primary ms-5">Sign Up</a></p>
								</div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login end --> 
</asp:Content>

