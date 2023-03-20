<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
                                    <h2>contact</h2> 
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
		<!-- Banner Area End -->
        <!-- Contact Start -->
        <div class="map-area">
            <!-- google-map-area start -->
            <div class="google-map-area">
                <!--  Map Section -->
                <div id="contacts" class="map-area">
                   
                    <div id="" > <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3597.763079860083!2d85.12794021425148!3d25.612787821000843!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed5975c433da41%3A0x75a975b6aa6164!2sUPL%20InfoTech!5e0!3m2!1sen!2sin!4v1671276965244!5m2!1sen!2sin" width="600" height="450" style="width:100%;height:440px;"x  allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
                </div>
            </div>
        </div>
        <div class="contact-area pt-150 pb-140"> 
            <div class="container">     
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="contact-contents text-center">
                            <div class="single-contact mb-65">
                                <div class="contact-icon">
                                    <img src="img/contact/contact1.png" alt="contact">
                                </div>
                                <div class="contact-add">
                                    <h3>address</h3>
                                    <p>patna</p>
                                    <p>Patna Bihar(801104)</p>
                                </div>
                            </div>
                            <div class="single-contact mb-65">
                                <div class="contact-icon">
                                    <img src="img/contact/contact2.png" alt="contact">
                                </div>
                                <div class="contact-add">
                                    <h3>Contact</h3>
                                    <p>Mob:- 8889994444</p>
                                   
                                </div>
                            </div>
                            <%--<div class="single-contact">
                                <div class="contact-icon">
                                    <img src="img/contact/contact3.png" alt="contact">
                                </div>
                                <div class="contact-add">
                                    <h3>address</h3>
                                    <p>135, Fir</p>
                                    <p>New Yourk City, USA</p>
                                </div>
                            </div>--%>
                        </div>
                    </div>    
                    <div class="col-lg-7 col-md-7">
                        <div class="reply-area">
                            <h3>LEAVE A message</h3>
                            <p>I must explain to you how all this a mistaken idea of ncing great explorer of the rut the is lder of human happinescias unde omnis iste natus error sit volptatem </p>
                            
                        <div class="form-control">
  <div class="row">

      <div class="form-group col-md-6">
      <label>Name</label>
   
           <asp:TextBox ID="Textfullname"  class="form-control"  AutoComplete="off" ValidationGroup="vashu" placeholder="Enter your name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"   ValidationGroup="vashu" ControlToValidate="Textfullname"  runat="server" ErrorMessage="please enter name" ForeColor="red" display="dynamic"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group col-md-6">
      <label >Email</label>
        <asp:TextBox ID="textEmail"  CssClass="form-control" AutoComplete="off"  placeholder="Enter Email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textEmail" ValidationGroup="vashu" ForeColor="Red" ErrorMessage="Enter Email "></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationGroup="vashu" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" ControlToValidate="textEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
    </div>
      <div class="form-group col-md-6">
    <label>Phone</label>
    
            <asp:TextBox ID="Textphone" class="form-control"  MaxLength="10"  AutoComplete="off" placeholder="Enter your phone number"     runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup="vashu"  ControlToValidate="Textphone" Forecolor="red" runat="server" ErrorMessage="please enter phone number" display="dynamic"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Forecolor="red" ValidationGroup="vashu" ControlToValidate="Textphone"  ErrorMessage="Not a Valid Phone no." ValidationExpression="[0-9]{10}"  Display="Dynamic"></asp:RegularExpressionValidator>
  </div>
    <div class="form-group col-md-6">
    <label for="inputAddress">Subject</label>
        <asp:TextBox ID="textsub" class="form-control"  placeholder="Subject" MaxLength="20"  AutoComplete="off" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="vashu"   ForeColor="Red" ControlToValidate="textsub" ErrorMessage="Enter Subject"  Display="Dynamic"></asp:RequiredFieldValidator>

  </div>
  </div>
  
  <div class="form-group">
    <label>Massage</label>
   <asp:TextBox ID="txtmessage" maxlength="300" TextMode="MultiLine" Rows="4" class="form-control" AutoComplete="off" placeholder="Write your message*" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ValidationGroup="vashu" ControlToValidate="txtmessage"  runat="server" ErrorMessage="please enter message" display="dynamic"></asp:RequiredFieldValidator>

  </div>
  
   <asp:Button ID="button1" class="btn btn-primary m-3 " ValidationGroup="vashu"  OnClick="Button4_Click" runat="server" Text="Submit" />

</div>
                           

                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- Contact End -->
</asp:Content>

