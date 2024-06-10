<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Electronic_Kingdom.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Wafa Furn World</title>   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="css/style2.css">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
                .card_product{
    background-color:whitesmoke !important;
    border-radius:0 0 10px 10px;
     border:2px solid black;
}
        .image{
             
     overflow:hidden;
     cursor:zoom-in;
      border-radius:10px 10px 0 0;
      display:flex;
      align-content:center;
      justify-content:center;
     
         }
                .image img{
           transition:.7s;
           width:300px;
           height:200px;
              
      }
.image .Camera .Mobile{
    height: 80px;
    padding: 100px;
    width: 300px;
}
.image .TV, .image .HeadPhone, .image .Laptop {
    height: 300px;
    width: 400px;
}

.image .Camera {
    height: 200px;
    margin: 60px 0;
    width: 300px;
}
        
        .image:hover img{
            transform:scale(1.5);
            transition:.4s;
        }
        .txt-lbl{
            font-weight:bold;
            text-transform:uppercase;
            margin-top:50px;
            font-size:25px;
            color:mediumblue;
            text-align:center;
        }
    </style>
</head>
<body class="theme">
  <div class="bg">
    <header>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <div class="logo">
                <a href="#"><img src="images/Full_Logo.png" alt="Logo">
               </a>
            </div>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="index.aspx">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#products">Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#About">About us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#Contact">Contact us</a>
              </li>
                              
            </ul>
              <a href="login.aspx"><button class="btn btn-success" type="submit">Login / Register</button></a>
              <i class="fa-regular fa-sun"></i>
              <i class="fa-solid fa-moon show"></i>
          </div>
        </div>
       </nav>
    </header>
    <section class="carousel-body">
       <div class="carousel">
       <div class="container-fluid my-2 p-3">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner" >
            <div class="carousel-item active" data-bs-interval="3000">
                <div class="container">
            <div class="row">
              <div class="col-lg-6">
                  <h1 class="furniture_text">2024</h1>
 <h1 class="trends_text">TRENDS</h1>
 <h1 class="furniture_text">FURNITURE</h1>
 <p class="lorem_text">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, </p>

                     </div>
                  <div class="col-lg-6">
                   <img src="images/Chair-Furniture-PNG-Transparent-Image.png"  class="d-block w-100" alt="..." />
               </div>
                </div>  
                 </div>
                </div>
                     <div class="carousel-item" data-bs-interval="3000">
               <div class="container">
           <div class="row">
             <div class="col-lg-6">
                                                    <h1 class="furniture_text">2024</h1>
                                    <h1 class="trends_text">TRENDS</h1>
                                    <h1 class="furniture_text">FURNITURE</h1>
                                    <p class="lorem_text">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, </p>

                    </div>
                 <div class="col-lg-6">
                   <img src="images/Transparent_Victorian_Loveseat_PNG_Clipart_Picture.png">
              </div>
               </div>  
                </div>
               </div>
                    <div class="carousel-item" data-bs-interval="3000">
               <div class="container">
           <div class="row">
             <div class="col-lg-6">
                 <h1 class="furniture_text">2024</h1>
<h1 class="trends_text">TRENDS</h1>
<h1 class="furniture_text">FURNITURE</h1>
<p class="lorem_text">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, </p>

                    </div>
                 <div class="col-lg-6">
                  <img src="images/img-1.png">
              </div>
               </div>  
                </div>
               </div>
                </div>
    
  </div>
</div>
</div>
</section>
</div>
<section id="products">
<div class="container">
<div class="row">
    <label class="txt-lbl">Newly Arrived Products</label>
        <asp:Repeater ID="repeater_product" runat="server">
            <ItemTemplate>
              <div class="col-lg-4 col-md-6 g-4 shadow p-4 mb-1 ">
                  <div class="image">
  <img src="images/Product_image/<%# Eval("product_name") %>/<%# Eval("product_image1") %>" class="card-img-top <%# Eval("product_categories") %>" alt="...">    
                      </div>
  <div class="card-body text-black card_product">
    <h4 class="card-title  text-center p-1"><%# Eval("product_name") %></h4>
    <h5 class="card-text text-center  p-2"><span class="text-black">₹</span><%# Eval("price") %></h5>
      <p class="card-text text-center  p-2"><%# Eval("product_description") %></p>
  </div>
                  </div>
                </ItemTemplate>
            </asp:Repeater>
         </div>
    </div>
       <center><a href="login.aspx"><button class="btn btn-outline-primary" style="width:200px;margin-top:20px" type="submit">View More</button></a></center>
</section>
<section>
  <div class="container" id="About">
    <h2 class="text-center"> ABOUT US</h2>
    <div class="row my-5">
      <div class="col-lg-4 my-2">
  <div class="card" style="width: auto;">
    <img src="images/free.svg" style="width: 150px;padding:20px 0" class="card-img-top mx-auto" alt="...">
    <div class="card-body">
      <p class="card-text text-center">Free Shiping</p>
      <p class="card-text text-center">Get FREE delivery on all orders</p>
    </div>
  </div>
</div>
<div class="col-lg-4  my-2">
<div class="card" style="width: auto;">
  <img src="images/truck.svg" style="width: 150px;padding:20px 0" class="card-img-top  mx-auto" alt="...">
  <div class="card-body">
    <p class="card-text text-center">Fast Delivery</p>
    <p class="card-text text-center">Delivering speed and reliability</p>
  </div>
</div>
</div>
<div class="col-lg-4 my-2">
<div class="card" style="width: auto;">
  <img src="images/high-quality.svg" style="width: 150px;padding:20px 0" class="card-img-top  mx-auto" alt="...">
  <div class="card-body">
    <p class="card-text text-center">Best Quality</p>
    <p class="card-text text-center">Quality is the result of intelligent effort</p>
  </div>
</div>
</div>
    </div>
  </div>
</section>
   
<section>
  <div class="container" id="Contact">
    <h2 class="text-center my-5">CONTACT US</h2>
    <form class="row g-3 needs-validation" validate>
      <div class="col-md-6">
        <label for="validationCustom01" class="form-label">First name</label>
        <input type="text" class="form-control" id="validationCustom01" required>
        <div class="valid-feedback">
          Looks good!
        </div>
      </div>
      <div class="col-md-6">
        <label for="validationCustom02" class="form-label">Last name</label>
        <input type="text" class="form-control" id="validationCustom02" required>
        <div class="valid-feedback">
          Looks good!
        </div>
      </div>
      <div class="col-md-12">
        <label for="validationCustom03" class="form-label">Mail</label>
        <input type="email" class="form-control" id="validationCustom02" placeholder="name@example.com" required>
        <div class="invalid-feedback">
          Please provide a valid Email.
        </div>
      </div>
      <div class="col-md-12 col-12">
        <button class="btn btn-primary" type="submit">Submit</button>
      </div>
    </form>
</section>

<section>
  <footer>
    <a class="to-top" href="#"><i class="fa-solid fa-chevron-up active"></i></a>
    <div class="footerIcon">
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="#"><i class="fa-brands fa-whatsapp"></i></a>
    </div>
    <div class="footer-nav">
        <li><a href="#">Home</a></li>
        <li><a href="#About">About us</a></li>
        <li><a href="#Contact">Contact us</a></li>
        <li><a href="#">Our Team</a></li>
    </div>
    <div class="copyrights">
        <p class="text-center">&copy;2024 Wafa Furn World. All Rights Reserved</p>
    </div>
</footer>
</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</body>
</html>
