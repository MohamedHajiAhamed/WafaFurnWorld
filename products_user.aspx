<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="products_user.aspx.cs" Inherits="Electronic_Kingdom.products_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card_product{
            background-color:whitesmoke !important;
            border-radius:0 0 10px 10px;
             border:2px solid black;
        }
        .fa-heart{
            font-size:30px;
            padding-left:10px;
            cursor:pointer;
        }
       .image{
             
     overflow:hidden;
     cursor:zoom-in;
      border-radius:10px 10px 0 0;
     
         }
       .image{
           display:flex;
          justify-content:center;
 
       }
        .image img {
            transition:.7s;
            height:400px;
            width:300px;
          
            
       }
        .image .Camera .Mobile{
            height: 80px;
            padding: 100px;
            margin-bottom:100px;
            width: 300px;
        }
        .image .TV, .image .HeadPhone, .image .Laptop {
            height: 300px;
            margin: 50px;
            width: 300px;
        }

        .image .Camera {
            height: 200px;
            margin: 100px;
            width: 300px;
        }
        .image:hover img{
            transform:scale(1.5);
            transition:.4s;
        }
        .txtbox_search {
           height:50px;
        }
        .input-group .button{
            width:15%;
            height:52px;
            margin-top:0;
            background-color:darkblue !important;
        }
        #addon-wrapping{
            height:50px;
        }
        .input-group{
            width:95%;
        }
        .card-category i{
            font-size:50px;
            color:midnightblue;

        }
        .button{
             display:flex;
justify-content:center;
margin-bottom:10px;
        }
        .card-category {
            cursor:pointer;
}
        .card-category:hover{
            background-color:darkcyan !important;
            color:aliceblue;
         i{color:aliceblue;}
        }
        .card{
            display:flex;
            align-items:center;
            text-align:center;
            background-color:powderblue !important;
        }
        #LinkButton1{
            text-decoration:none;
        }
        .lbl-msg{
            margin:20px;
        }
        .txt{
            font-weight:bold;
            margin-top:10px;
            font-size:20px;
        }
        .categories-box{
                         display:flex;
                         /*width:100%;*/
                         flex-direction:column;
                       align-items:center;
margin-bottom:10px;
        }
        @media (max-width:2000px) {
            .categories-box .card-category {
                width:195px;
            }
        }
         @media (max-width:990px) {
     .categories-box .card-category {
         width:auto;
     }
 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </div>
    <form runat="server">
        <div class="input-group mx-auto">
  <span class="input-group-text text-black" id="addon-wrapping"><i class="fa-solid fa-magnifying-glass"></i></span>
            <asp:TextBox ID="txtbox_search" CssClass="form-control bg-white text-black txtbox_search border border-dark" placeholder="Search Product" runat="server"></asp:TextBox>
            <asp:Button ID="btn_search" class="button" runat="server" Text="Search" OnClick="btn_search_Click"/>
</div>
        <div class="container-fluid categories-box">
           <label style="margin-left:25px;font-weight:600;text-transform:capitalize">Top Search <i style="color:red;" class="fa-solid fa-arrow-trend-up"></i></label>
        <div class="row row-cols-2 row-cols-lg-5 row-cols-md-3 g-5" >
                        <div class="col">
                <asp:LinkButton ID="btn_all" Font-Underline="false" runat="server" OnClick="btn_all_Click">
  <div class="card card-category">
    <div class="card-body">
      <h5 class="card-title"><i class="fa-solid fa-bars"></i></h5>
      <p class="card-text">Show All</p>
    </div>
  </div>
                    </asp:LinkButton>
</div>
             <div class="col">
                 <asp:LinkButton ID="btn_mobile" Font-Underline="false" runat="server" OnClick="btn_mobile_Click">
   <div class="card card-category">
     <div class="card-body" id="btn-b">
       <h5 class="card-title"><img width="50"  height="50" src="https://img.icons8.com/ios-filled/50/191980/bed.png" alt="table"/></h5>
       <p class="card-text">Bed</p>
     </div>
   </div>
                     </asp:LinkButton>
 </div>
  <div class="col">
         <asp:LinkButton ID="btn_headphone" Font-Underline="false" runat="server" OnClick="btn_headphone_Click">
    <div class="card card-category" >
      <div class="card-body" id="btn-table">
        <h5 class="card-title"><img width="50"  height="50" src="https://img.icons8.com/ios-filled/50/191980/table.png" alt="table"/></h5>
        <p class="card-text">Dinning Table</p>
      </div>
    </div>
      </asp:LinkButton>
  </div>
 
  <div class="col">
         <asp:LinkButton ID="btn_laptop" Font-Underline="false" runat="server" OnClick="btn_laptop_Click">
    <div class="card card-category">
      <div class="card-body" id="btn-ctable">
        <h5 class="card-title"><img width="50"  height="50" src="https://img.icons8.com/ios-filled/50/191980/coffee-table.png" alt="table"/></h5>
        <p class="card-text">Coffee Table</p>
      </div>
    </div>
     </asp:LinkButton>
  </div>
            <div class="col">
       <asp:LinkButton ID="btn_tv" Font-Underline="false" runat="server" OnClick="btn_tv_Click">
  <div class="card card-category">
    <div class="card-body" id="btn-w">
      <h5 class="card-title"><img width="50"  height="50" src="https://img.icons8.com/ios-filled/50/191980/wardrobe--v1.png" alt="table"/></h5>
      <p class="card-text">Wardrobe</p>
    </div>
  </div>
       </asp:LinkButton>
</div>
                        
            </div>
            </div>
                 <div class="container-fluid">
<div class="row ">
    
        <asp:Repeater ID="repeater_product" runat="server">
            <ItemTemplate>
              <div class="col-lg-4 col-md-6 g-4 shadow p-4 mb-5 ">
                  <div class="image">
  <img src="images/Product_image/<%# Eval("product_name") %>/<%# Eval("product_image1") %>" class="card-img-top <%# Eval("product_categories") %>"  alt="...">    
                      </div>
  <div class="card-body text-black card_product">
    <h4 class="card-title  text-center p-1"><%# Eval("product_name") %></h4>
    <h5 class="card-text text-center  p-2"><span class="text-black">₹</span><%# Eval("price") %></h5>
      <p class="card-text text-center  p-2"><%# Eval("product_description") %></p>
      <div class="button">
      <asp:Button ID="btnAddToCart" CssClass="btn btn-success btn-cart" runat="server" Text="Add to Cart"  CommandArgument='<%# Eval("product_id") %>'  OnClick="btnAddToCart_Click" />
      <abbr title="Add to Favourite"><i class="fa-regular fa-heart"></i></abbr>
          </div>
  </div>
                  </div>
                </ItemTemplate>
            </asp:Repeater>
         </div>

                         
  <asp:Label ID="lbl_msg" runat="server"  CssClass="lbl-msg" Text="No Product Found" Visible="false" Font-Bold="True" ForeColor="Red" Font-Size="20px"></asp:Label>
                         <section>
  <div class="modal" id="model" tabindex="-1" style="display:none">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Alert</h5>
            </div>
            <asp:Label ID="lbl_text" CssClass="text-black mx-auto txt" runat="server" Text="Label"></asp:Label>
            <div class="modal-body">
                <div class="progress" style=" margin-top:10px;">
                    <div id="progressBar" class="progress-bar progress-bar-striped bg-primary"  role="progressbar" aria-label="Success striped example" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
    </div>
</div>

    </section>
    </div>
        </form>
    <script>
        const hearts = document.querySelectorAll('.fa-heart');

        hearts.forEach(heart => {
            heart.addEventListener('click', () => {
                if (heart.classList.contains('fa-regular')) {
                    heart.classList.remove('fa-regular');
                    heart.classList.add('fa-solid');
                    heart.style.color = 'red';
                } else {
                    heart.classList.remove('fa-solid');
                    heart.classList.add('fa-regular');
                    heart.style.color = 'black';
                }
            });
        });
        

        let width = 0;
        const interval = setInterval(() => {
            if (width >= 100) {
                clearInterval(interval);
                setTimeout(() => {
                    model.style.display = 'none'; 
                }, 800);
            } else {
                width += 10;
                progressBar.style.width = width + '%';
            }
        }, 30);
        const cont = document.getElementById("btn-table").parentElement;
        const btn = document.getElementById("btn-table").childNodes[1];
        cont.parentElement.addEventListener('mouseover', () => {
            btn.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/ffffff/table.png' alt='table' />";
        });
        cont.addEventListener('mouseleave', () => {
           btn.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/191970/table.png' alt='table' />";
        });
        const cont_ct = document.getElementById("btn-ctable").parentElement;
        const btn_ct = document.getElementById("btn-ctable").childNodes[1];
        cont_ct.parentElement.addEventListener('mouseover', () => {
            btn_ct.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/ffffff/coffee-table.png' alt='table' />";
        });
        cont_ct.addEventListener('mouseleave', () => {
            btn_ct.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/191970/coffee-table.png' alt='table' />";
        });
        const cont_w = document.getElementById("btn-w").parentElement;
        const btn_w = document.getElementById("btn-w").childNodes[1];
        cont_w.parentElement.addEventListener('mouseover', () => {
            btn_w.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/ffffff/wardrobe--v1.png' alt='table' />";
        });
        cont_w.addEventListener('mouseleave', () => {
            btn_w.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/191970/wardrobe--v1.png' alt='table' />";
        });
        const cont_b = document.getElementById("btn-b").parentElement;
        const btn_b = document.getElementById("btn-b").childNodes[1];
        cont_b.parentElement.addEventListener('mouseover', () => {
            btn_b.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/ffffff/bed.png' alt='table' />";
        });
        cont_b.addEventListener('mouseleave', () => {
            btn_b.innerHTML = "<img width='50' height='50' src='https://img.icons8.com/ios-filled/50/191970/bed.png' alt='table' />";
        });
    </script>
    
</asp:Content>
