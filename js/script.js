const body_dark = document.querySelector('.theme');
const dark = document.querySelector('.fa-moon');
const light = document.querySelector('.fa-sun');
const to_top = document.querySelector('.to-top');
const fname = document.getElementById("fname");
const lname = document.getElementById("lname");
const dob = document.getElementById("dob");
const mobno = document.getElementById("mobno");
const email = document.getElementById("email");
const pwd = document.getElementById("pwd");
const cpwd = document.getElementById("cpwd");
const radio = document.getElementById("radio");
const male = document.querySelector('#male');
const register_submit = document.querySelector('#form');
const female = document.querySelector('#female');
const others = document.querySelector('#others');


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
// const now = new Date();
// const hours = now.getHours();
// if (hours >= 18 || hours <= 6) {
//     body_dark.classList.add('dark');
//     dark.classList.remove('show');
//     light.classList.add('show');
// }
window.addEventListener("scroll",()=>{
    if(window.scrollY>50){
       to_top.classList.add("active");
    }else{
      to_top.classList.remove("active");
    }
  })

show=()=>{
    var pwd=document.getElementById("pwd")
    var cpwd=document.getElementById("cpwd")
    var eye=document.getElementById("eye")
    
    if(pwd.type==="password" && cpwd.type==="password"){
        pwd.type="text";
        cpwd.type="text";
       
        eye.classList.remove("fa-eye-slash");
        eye.classList.add("fa-eye");

    }
    else{
        pwd.type="password";
        cpwd.type="password";

        eye.classList.remove("fa-eye");
        eye.classList.add("fa-eye-slash");
    }
}

// const form = document.getElementById("form");

// console.dir(fname);



function setError(element,message){
    const inputGroup = element.parentElement;
    const errorElement = inputGroup.querySelector('.error');
    // console.log(inputGroup);
    errorElement.innerText = message;
    inputGroup.classList.add('error')
    inputGroup.classList.remove('success');
}
function setSuccess(element){
    const inputGroup = element.parentElement;
    const errorElement = inputGroup.querySelector('.error');
    // console.log(errorElement);
    errorElement.innerText = '';
    inputGroup.classList.add('success');
    inputGroup.classList.remove('error');
}

function validateInputs(){

    const fnameVal = fname.value.trim();
    const lnameVal = lname.value.trim();
    const dobVal = dob.value.trim();
    const mobnoVal = mobno.value.trim();
    const emailVal = email.value.trim();
    const pwdVal = pwd.value.trim();
    const cpwdVal = cpwd.value.trim();
    let success = true;
    // console.log(mobnoVal.type);

    if(fnameVal===''){
        success = false;
        setError(fname,'First Name is Required');
    }
    else{
        setSuccess(fname);
    }


    if(lnameVal===''){
        success = false;
        setError(lname,'Last Name is Required');
    }
    else{
        setSuccess(lname);
    }


    if(dobVal===''){
        success = false;
        setError(dob,'Date Of Birth is Required')
    }
    else{
        setSuccess(dob);
    }


    if(mobnoVal===''){
        success = false;
        setError(mobno,'Mobile Number is Required');
    }
    else if(!validatemob(mobnoVal)){
        success = false;
        setError(mobno,'Please Enter Valid Mobile Number');
    }
    else{
        setSuccess(mobno);
    }


    if(emailVal===''){
        success = false;
        setError(email,'E-Mail is Required');
    }
    else if(!validateEmail(emailVal)){
        success = false;
        setError(email,'Please Enter Valid E-Mail');
    }
    else{
        setSuccess(email);
    }


    if(pwdVal===''){
        success = false;
        setError(pwd,'Password is Required');
    }
    else if(pwdVal.length<8){
        success = false;
        setError(pwd,'Password must be atleast 8 characters long');
    }
    else{
        setSuccess(pwd);
    }


    if(cpwdVal===''){
        success = false;
        setError(cpwd,'Confirm Password is Required');
    }
    else if(cpwdVal!==pwdVal){
        success = false;
        setError(cpwd,'Password & Confirm Password Must be Same');
    }
    else{
        setSuccess(cpwd)
    }
    if(!male.checked && !female.checked && !others.checked){
        success = false;
        setError(radio,'Choose The Gender');
    }
    else{
        setSuccess(radio);
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
const validatemob = (mobno) => {
    return String(mobno)
    .match(
        /^[6-9]\d{9}$/      
    );
  };

  register_submit.addEventListener('submit',(e)=>{
    
    if(!validateInputs()){
        e.preventDefault();
    }
});



