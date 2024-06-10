<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="cart_user.aspx.cs" Inherits="Electronic_Kingdom.cart_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card img {
            width: 100px;
            margin: 10px;
        }
       /* form{
            display:flex;
            flex-direction:column;
            align-items:center;
            text-align:center;
        }*/
        .card {
           margin-left:100px !important;
            background-color: rgb(205 156 249 / 0.2) !important;
        }
        /* .cart-value{
            position:absolute;
            top:115px;
            left:780px;
        }
        .bill-summary{
            position:absolute;
            top:195px;
            left:780px;
            
        }*/
        .lbl-msg{
            margin-left:50%;
        }
        .bill-summary h6 {
            margin: 20px 0 0 0;
        }

        .fa-trash-can {
            font-size: 20px;
            color: red;
        }
        .btn-place {
            width: 100%;
        }

        .txt {
            font-weight: bold;
            margin-top: 10px;
            font-size: 20px;
        }
        .p{
            margin-bottom:30px !important;
        }
         @media(max-width:991px){
             .card{
    margin-left:80px !important;
}
           .m{
    width: 620px !important; 
    height: auto !important
}
            .c{
     margin-left:0px !important;
 }
            form{
       display:flex !important;
       flex-direction:row !important;
       align-items:center !important;
       text-align:center !important;


   }
                        .b {
    width: 620px !important; 
   
}
                        .lbl-msg{
    margin-left:50px !important;
}
 }
         @media(max-width:765px){
    
    .card{
        margin-left:10px !important;
    }
  
                .m{
                width: auto !important; 
                height: auto !important
            }
            .b {
    width: auto !important; 
}
     
}
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </div>
    <form runat="server">

        <asp:GridView ID="gridview1" runat="server" Visible="false"></asp:GridView>


                <div class="row e"> 
                    <div class="col-12 col-xl-6 my-5 mb-0">
        <asp:Label ID="lbl_msg" runat="server" CssClass="lbl-msg" Text="Cart is Empty" Visible="false" Font-Bold="True" ForeColor="Red" Font-Size="20px"></asp:Label>
        <asp:Repeater ID="repeater_product" runat="server">
            <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card mb-3 m mx-auto" style="width: 640px; height: 130px">
                                <div class="row">
                                    <div class="col-12 col-lg-4">
                                        <img src="images/Product_image/<%# Eval("product_name") %>/<%# Eval("product_image1") %>" class="img-fluid rounded-start" alt="...">
                                    </div>
                                    <div class="col-12 col-lg-8">
                                        <div class="card-body c" style="margin-left: -80px">
                                            <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("product_id") %>' Visible="False"></asp:Label>
                                            <h5 class="card-title"><%# Eval("product_name") %></h5>
                                            <p class="card-text"><span class="text-black">₹</span><asp:Label ID="lbl_product_cost" CssClass="text-black" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
                                            <div class="row">
                                                <div class="col-12 col-lg-4">
                                                    <p class="card-text">Quantity:</p>
                                                </div>
                                                <div class="col-12 col-lg-3">
                                                    <asp:DropDownList class="input-group mb-3" ID="txtbox_quantity" runat="server" OnSelectedIndexChanged="txtbox_quantity_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-12 col-lg-4">
                                                    <asp:LinkButton ID="btn_delete" runat="server" OnClick="btn_delete_Click"><i class="fa-solid fa-trash-can"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </ItemTemplate>
        </asp:Repeater>
                    </div>
                  
        <div class="col-12 col-xl-6 p">
            <div class="card cart-value mx-auto my-5 mb-4 b" style="width: 25rem;">
                <div class="card-body">
                    <h5 class="card-title text-center">Cart Total : ₹<asp:Label ID="lbl_cart_total" CssClass="text-black" runat="server" Text="500"></asp:Label></h5>
                </div>
            </div>
            <div class="card bill-summary mx-auto mb-5 b" style="width: 25rem;">
                <div class="card-body ">
                    <h5 class="card-title text-center">Bill Summary:</h5>
                    <h6 class="card-subtitle mb-2 text-center">Delivery Charges : ₹<asp:Label ID="Label3" CssClass="text-black" runat="server" Text="50"></asp:Label></h6>
                    <h6 class="card-subtitle mb-2 text-center">Handling Charges : ₹<asp:Label ID="Label2" CssClass="text-black" runat="server" Text="3"></asp:Label></h6>
                    <h6 class="card-subtitle mb-2 text-center">Total Amount : ₹<asp:Label ID="lbl_total" CssClass="text-black" runat="server" Text="0"></asp:Label></h6>

                </div>
            <asp:Button ID="btn_place_order" runat="server" CssClass="btn btn-success btn-place" Text="Place Order" OnClick="btn_place_order_Click" />
            </div>
        </div>
                      </div>
    <asp:GridView ID="GridView2" runat="server" Visible="false"></asp:GridView>
        <section>
            <div class="modal" id="model" tabindex="-1" style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Alert</h5>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lbl_text" CssClass="text-black mx-auto txt" runat="server" Text="Label"></asp:Label>
                            <div class="progress" style="margin-top: 10px;">
                                <div id="progressBar" class="progress-bar progress-bar-striped bg-primary" role="progressbar" aria-label="Success striped example" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </form>
    <script>
        let width = 0;
        const interval = setInterval(() => {
            if (width >= 100) {
                clearInterval(interval);
                setTimeout(() => {
                    model.style.display = 'none';
                }, 1000);
            } else {
                width += 20;
                progressBar.style.width = width + '%';
            }
        }, 30);
    </script>
</asp:Content>
