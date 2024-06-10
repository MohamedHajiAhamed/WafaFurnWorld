<%@ Page Title="" Language="C#" MasterPageFile="~/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="dashboard_admin.aspx.cs" Inherits="Electronic_Kingdom.dashboard_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
    <style>
        .card .lbl {
    margin-top: 18px;
    font-size: 30px;
    color:antiquewhite;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                 <div class="col-9">
                     <section class="dashboard">
                         <h1>DashBoard</h1>
                         <div class="container-fluid ">
                             <div class="row">
                                 <div class="col-lg-4">
                                     <div class="card text-center mb-3" style="width: 18rem;height:12rem">
                                         <div class="card-body">
                                             <h5 class="card-title">Total Product</h5>
                                             <div class="card-icon">
                                                 <i class="fa-solid fa-boxes-stacked"></i>
                                                 <asp:Label CssClass="lbl" ID="lbl_total_product" runat="server" Text="Label"></asp:Label>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="col-lg-4">
                                     <div class="card text-center mb-3" style="width: 18rem;height:12rem">
                                         <div class="card-body">
                                             <h5 class="card-title">Received Order </h5>
                                             <div class="card-icon">
                                                 <span class="icon-box bg-color-brown set-icon">
                                                     <i class="fa fa-envelope"></i>
                                                 </span>
                                                <asp:Label CssClass="lbl" ID="lbl_total_order" runat="server" Text="Label"></asp:Label>
                                             </div>
                                         </div>
                                     </div>

                                 </div>
                                 <div class="col-lg-4">
                                     <div class="card text-center mb-3" style="width: 18rem;height:12rem">
                                         <div class="card-body">
                                             <h5 class="card-title">Processed Order</h5>
                                             <div class="card-icon">
                                                 <i class="fa-solid fa-box"></i>
                                                <asp:Label CssClass="lbl" ID="lbl_processed_order" runat="server" Text="Label"></asp:Label>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </section>
                 </div>
             </div>
         </div>
   
</asp:Content>
