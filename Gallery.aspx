<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

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
                                    <h2>Gallery</h2> 
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
		<!-- Banner Area End -->
        <!-- Event Start -->
        <div class="event-area three text-center pt-150 pb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-event mb-60">
                            <div class="event-img">
                                <a href="#">
                                    <img src="img/event/event5.jpg" alt="Gallery">
                                    <%--<div class="course-hover">
                                        <i class="fa fa-link"></i>
                                    </div>--%>
                                </a>
                                
                            </div>
                            
                        </div>
                    </div>
                  
               
            </div>
        </div>      
        <!-- Event End -->
</asp:Content>

