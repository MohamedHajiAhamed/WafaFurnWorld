
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Electronic_Kingdom.registration" %>

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
    #register_submit{
    width: 90%;
    margin: 10px;
    font-size: 20px;
    padding: 5px;
    border: 1px white solid;
    background-color: transparent;
    color: rgb(116, 193, 199);
    box-sizing: border-box;
    border-radius: 10px;
    cursor: pointer;
    }
    form #register_submit:hover {
        background-color: #fff;
        color: black;
    }
     body{
         align-items:center;
         justify-content:center;
         text-align:center;
          background-image: url(/images/art.jpg) !important;
 background-repeat: no-repeat;
 background-size: cover;
 backdrop-filter:blur(10px);
     }

        @media (max-width:680px) {
            fieldset {
                font-size: 15px;
                width: 420px;
            }

            .radio {
                margin-left: 15px;
            }

            .fa-eye-slash, .fa-eye {
                left: 160px;
            }

            .register {
                padding:50px 0;
            }
        }
                @media (max-width:500px) {
                    fieldset {
                        font-size: 15px;
                        width: 320px;
                    }

                    .radio {
                        margin-left: 1px;
                    }

                    .name-row {
                        display: block;
                    }

                    .pwd-row {
                        display: block;
                    }

                    .fa-eye-slash, .fa-eye {
                        left: 260px;
                    }
                }
        
    </style>
</head>
<body class="theme">
    <header>
    <nav class="navbar navbar-expand-lg navbar-dark" id="nav_color">
        <div class="container-fluid">
            <div class="logo">
                <a href="index.aspx"><img src="images/Full_logo.png" alt="Logo">
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
                <a class="nav-link" href="#">Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="index.aspx#About">About us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="index.aspx#Contact">Contact us</a>
              </li>
                              
            </ul>
              <button class="btn btn-success" type="submit">Login / Register</button>
              <i class="fa-regular fa-sun"></i>
              <i class="fa-solid fa-moon show"></i>
          </div>
        </div>
       </nav>
    </header>
 <section class="register">
  <fieldset> 
    <form runat="server" id="form">
        <h3>Registration</h3>
        <div class="name-row">        
            <div class="input-group">
            <label for="fname" class="fname">First Name</label><br>
                <asp:TextBox ID="fname" type="text" class="fname" name="fname" placeholder="Enter Firstname" runat="server"></asp:TextBox>
            <div class="error"></div>

        </div>
        <div class="input-group">
            <label for="lname">Last Name</label><br>
            <asp:TextBox ID="lname" type="text" class="lname" name="lname" placeholder="Enter Lastname" runat="server"></asp:TextBox>
            <div class="error"></div>
        </div></div>
      <div class="name-row">  
        <div class="input-group">
            <label for="dob">Date Of Birth</label><br>
            <asp:TextBox ID="dob" type="date" name="dob" runat="server"></asp:TextBox>
            <div class="error"></div>
        </div>
        <div class="input-group">
            <label for="mobno">Mobile Number</label><br>
            <asp:TextBox ID="mobno" type="tel" name="mobno" placeholder="Enter Mobile Number" runat="server"></asp:TextBox>
            <div class="error"></div>
        </div>
      </div>
        <div class="input-group">
            <label for="email">E-Mail</label><br>
            <asp:TextBox ID="email" type="email" name="email" placeholder="name@example.com" runat="server"></asp:TextBox>
            <div class="error"></div>
        </div>
        <div class="pwd-row">            
            <div class="input-group">
            <label for="pwd" class="pwd">Password</label><br>
                <asp:TextBox ID="pwd" type="password"  name="pwd" class="pwd" placeholder="Password" runat="server"></asp:TextBox>  <i id="eye" onclick="show()" class="fas fa-eye-slash"></i><br>
            <div class="error"></div>
        </div>
        <div class="input-group">
            <label for="cpwd" class="cpwd">Confirm Password</label><br>
            <asp:TextBox ID="cpwd" type="password" name="cpwd" class="cpwd" placeholder="Confim Password" runat="server"></asp:TextBox> <br>
            <div class="error"></div>
        </div></div>

        <!-- <div class="chkbox">
            <input type="checkbox" id="showpwd" onclick="show()"><label>Show Password</label>
        </div> -->
        <div class="input-group">
          <div id="radio" class="radio">
            <span>Gender:</span>
            <div id="radio" class="radio"><asp:RadioButton ID="male" GroupName="gender" value="male" runat="server" /><span style="margin-left:5px;">Male</span></div>
            <div id="radio" class="radio"><asp:RadioButton ID="female" GroupName="gender" value="female" runat="server" /><span style="margin-left:5px;">Female</span></div>
            <div id="radio" class="radio"><asp:RadioButton ID="others" GroupName="gender" value="others" runat="server" /><span style="margin-left:5px;">Others</span> </div>
            
        </div>
        <div style="text-align: center;" class="error"></div>
    </div>
        <span>Already have an account?<a href="login.aspx">Login</a></span>
          <asp:Button ID="register_submit" class="submit" type="submit" runat="server" Text="Register" OnClick="register_submit_Click" />
            <button class="reset" type="reset">Clear</button>
    </form>
  </fieldset>
 </section>   
    <section class="">
   <div class="modal" id="model" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Alert</h5>
      </div>
      <div class="modal-body">
        <p class="text-black">Registered Successfully</p>
      </div>
      <div class="modal-footer">
       <a href="login.aspx"><button type="button" id="model-close"  class="btn btn-danger"  data-bs-dismiss="modal">Close</button></a> 
      </div>
    </div>
  </div>
</div>
    </section>
<section>
  <footer>
    <a class="to-top" href="#"><i class="fa-solid fa-chevron-up active"></i></a>
    <div class="footerIcon">
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href=""><i class="fa-brands fa-instagram"></i></a>
        <a href=""><i class="fa-brands fa-x-twitter"></i></a>
        <a href=""><i class="fa-brands fa-whatsapp"></i></a>
    </div>
    <div class="footer-nav">
        <li><a href="index.aspx">Home</a></li>
        <li><a href="index.aspx#About">About us</a></li>
        <li><a href="index.aspx#Contact">Contact us</a></li>
        <li><a href="">Our Team</a></li>
    </div>
    <div class="copyrights">
        <p class="text-center">&copy;2024 Wafa Furn World. All Rights Reserved</p>
    </div>
</footer>
</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
    <script>
        const model_close = document.querySelector('#model-close')

            model_close.addEventListener('click', () => {
                model_close.parentElement.parentElement.style.display = 'none';
            });
    </script>
</body>
</html>
