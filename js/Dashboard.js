const btn_dashoard = document.getElementById("btn-dashboard");
const btn_order = document.getElementById("btn-order");
const btn_product = document.getElementById("btn-add-product");
const btn_customer = document.getElementById("btn-customer");
const btn_user_details = document.getElementById("btn-user-details");

var title = document.head.innerText;

document.addEventListener("DOMContentLoaded", function () {
    var title = document.title;
    if (title === 'Dashboard') {
        btn_dashoard.classList.add('active');
        btn_order.classList.remove('active');
        btn_product.classList.remove('active');
        btn_customer.classList.remove('active');
        btn_user_details.classList.remove('active');
    }
    else if (title === 'Orders') {
        btn_order.classList.add('active');
        btn_dashoard.classList.remove('active');
        btn_product.classList.remove('active');
        btn_customer.classList.remove('active');
        btn_user_details.classList.remove('active');
    }
    else if (title === 'Add Products') {
        btn_product.classList.add('active');
        btn_dashoard.classList.remove('active');
        btn_customer.classList.remove('active');
        btn_user_details.classList.remove('active');
        btn_order.classList.remove('active');
    }
    else if (title === 'View Products') {
        btn_customer.classList.add('active');
        btn_dashoard.classList.remove('active');
        btn_user_details.classList.remove('active');
        btn_order.classList.remove('active');
        btn_product.classList.remove('active');
    }
    else if (title === 'User Details') {
        btn_user_details.classList.add('active');
        btn_dashoard.classList.remove('active');
        btn_order.classList.remove('active');
        btn_product.classList.remove('active');
        btn_customer.classList.remove('active');
    }
});

