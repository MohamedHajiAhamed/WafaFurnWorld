<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Electronic_Kingdom.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Wafa Furn World</title>   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="css/style2.css">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
    <style>
 #login_submit{
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
 form #login_submit:hover {
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
backdrop-filter:blur(10px)
    }
     .fa-eye-slash, .fa-eye{
          left:520px;
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
                left: 360px;
            }
            .register{
                padding:100px 0;
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
          <button class="navbar-toggler"  type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
 <section class="register" >
  <fieldset> 
    <form runat="server" id="form_login" class="">
        <h3>Login</h3>
        <div class="input-group">
            <label for="email">E-Mail</label><br>
            <asp:TextBox ID="email_login" type="email" placeholder="name@example.com" runat="server"></asp:TextBox>
            <div class="error"></div>
        </div>
        <div class="input-group">
            <div class="input-group">
            <label for="pwd" class="pwd">Password</label><br>
                <asp:TextBox ID="pwd_login" type="password" class="pwd" placeholder="Password" runat="server"></asp:TextBox>
            <i id="eye" onclick="show()" class="fas fa-eye-slash"></i><br>
            <div class="error"></div>
        </div></div>
        
           <span style="color: white;">Don't have an account?<a href="registration.aspx">Register</a></span>
            <asp:Button ID="login_submit" class="submit" type="submit" runat="server" Text="Login" OnClick="login_submit_Click1" />
            <button class="reset" type="reset">Clear</button>
        
    </form>
  </fieldset>
 </section>   
        <section>
   <div class="modal" id="model" tabindex="-1" style="display:none">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Alert</h5>
      </div>
      <div class="modal-body">
        <asp:Label ID="lbl_txt" CssClass="text-black" runat="server" Text="Label"></asp:Label>
      </div>
      <div class="modal-footer">
       <button type="button" id="model-close"  class="btn btn-danger" onclick="location.href = 'login.aspx';" >Close</button>
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
        <li><a href="#">Our Team</a></li>
    </div>
    <div class="copyrights">
        <p class="text-center">&copy;2024 Wafa Furn World. All Rights Reserved</p>
    </div>
</footer>
</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- <script src="js/script.js"></script> -->
    <script>
      show=()=>{
    var pwd=document.getElementById("pwd_login")
    var eye=document.getElementById("eye")
    
    if(pwd.type==="password"){
        pwd.type="text";
       
        eye.classList.remove("fa-eye-slash");
        eye.classList.add("fa-eye");

    }
    else{
        pwd.type="password";

        eye.classList.remove("fa-eye");
        eye.classList.add("fa-eye-slash");
    }
}
const body_dark = document.querySelector('.theme');
const dark = document.querySelector('.fa-moon');
const light = document.querySelector('.fa-sun');
const to_top = document.querySelector('.to-top');
dark.addEventListener('click',()=>{
    body_dark.classList.add('dark');
    dark.classList.remove('show');
    light.classList.add('show');
})
light.addEventListener('click',()=>{
    body_dark.classList.remove('dark');
    dark.classList.add('show');
    light.classList.remove('show');
})
window.addEventListener("scroll",()=>{
    if(window.scrollY>50){
       to_top.classList.add("active");
    }else{
      to_top.classList.remove("active");
    }
  })
      const email_login = document.getElementById("email_login");
      const pwd_login = document.getElementById("pwd_login");
      
      function setError(element, message) {
          const inputGroup = element.parentElement;
          const errorElement = inputGroup.querySelector('.error');
          errorElement.innerText = message;
          inputGroup.classList.add('error');
          inputGroup.classList.remove('success');
      }
      
      function setSuccess(element) {
          const inputGroup = element.parentElement;
          const errorElement = inputGroup.querySelector('.error');
          errorElement.innerText = '';
          inputGroup.classList.add('success');
          inputGroup.classList.remove('error');
      }
      
      function validateInputs_login() {
          const emailVal = email_login.value.trim();
          const pwdVal = pwd_login.value.trim();
          let success = true;
      
          if (emailVal === '') {
              success = false;
              setError(email_login, 'E-Mail is Required');
          } else if (!validateEmail(emailVal)) {
              success = false;
              setError(email_login, 'Please Enter Valid E-Mail');
          } else {
              setSuccess(email_login);
          }
      
          if (pwdVal === '') {
              success = false;
              setError(pwd_login, 'Password is Required');
          }
          else{
            setSuccess(pwd_login);
          }
      
          return success;
      }
      
      const validateEmail = (email) => {
          return String(email)
              .toLowerCase()
              .match(
                  /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
              );
      };
      
      const login_form = document.getElementById('form_login');
      
      login_form.addEventListener('submit', (e) => {
          if (!validateInputs_login()) {
              e.preventDefault();
          }
      });
        const model_close = document.querySelector('#model-close')
        
        model_close.addEventListener('click', () => {
            model_close.parentElement.parentElement.classList.remove('show');
            model_close.parentElement.parentElement.style.display = 'none';
        });
    </script>

</body>
</html>
