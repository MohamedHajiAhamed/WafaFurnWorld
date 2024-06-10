<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="profile_admin.aspx.cs" Inherits="Electronic_Kingdom.profile_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label,.radio{
            color:coral !important;
        }
     .submit{
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
 form .submit:hover {
     background-color: #fff;
     color: black;
 }
    body{
        align-items:center;
        justify-content:center;
        text-align:center;
        
    }
     @media (max-width:680px) {
     fieldset {
         font-size: 15px;
         width: 420px;
     }

     .radio {
         margin-left: 15px;
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

         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <section class="register">
  <fieldset> 
    <form runat="server" id="form">
        <h3>My Profile</h3>
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
            <asp:TextBox ID="dob" TextMode="Date" name="dob" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="pwd" type="text"  name="pwd" class="pwd" placeholder="Password Must Be 8 characters Long" runat="server"></asp:TextBox><br>
            <div class="error"></div>
        </div>
        <div class="input-group">
            <label for="cpwd" class="cpwd">Confirm Password</label><br>
            <asp:TextBox ID="cpwd" type="text"  name="cpwd" class="cpwd" placeholder="Confirm Password" runat="server"></asp:TextBox> <br>
            <div class="error"></div>
        </div></div>

        <div class="input-group">
          <div id="radio" class="radio">
            <span>Gender:</span>
            <div id="radio" class="radio"><asp:RadioButton ID="male" GroupName="gender" value="male" runat="server" /><span style="margin-left:5px;">Male</span></div>
            <div id="radio" class="radio"><asp:RadioButton ID="female" GroupName="gender" value="female" runat="server" /><span style="margin-left:5px;">Female</span></div>
            <div id="radio" class="radio"><asp:RadioButton ID="others" GroupName="gender" value="others" runat="server" /><span style="margin-left:5px;">Others</span> </div>
            
        </div>
        <div style="text-align: center;" class="error"></div>
    </div>
          <asp:Button ID="update_submit" class="submit" type="submit" runat="server" Text="Submit" OnClick="update_submit_Click" />
            <button class="reset" type="reset">Clear</button>
        </div>
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
        <p class="text-black">Profile Updated Successfully</p>
      </div>
      <div class="modal-footer">
       <a href="profile_admin.aspx"><button type="button" id="model-close"  class="btn btn-danger"  data-bs-dismiss="modal">Close</button></a> 
      </div>
    </div>
  </div>
</div>
    </section>
     
</asp:Content>
