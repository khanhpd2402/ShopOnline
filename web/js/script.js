window.onscroll = function() {mySticky();myTopBtn();};
window.resize= function() {mySticky();};
window.onload= function() {mySticky();};
// Get the navbar

//var logo= document.getElementById("logo");
// Get the offset position of the navbar
var sticky = 300;
var myTopBtnOffset = 500;
var width = window.screen.width;
navbar = document.getElementById("navbar1");
if (width < 992){
  navbar.classList.add('sticky');
}
// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function mySticky() {
  var navbar = document.getElementById("navbar2");
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky");
  } else {
    navbar.classList.remove("sticky");
  }
  var width = window.screen.width;
  var height = window.screen.height;
  navbar = document.getElementById("navbar1");
  if (width < 992){
      navbar.classList.add('sticky');
  }
  else{
      navbar.classList.remove('sticky');
  }
}
myTBTN = document.getElementById("myTBTN");
function myTopBtn() {
  if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
    myTBTN.style.display = "block";
  } else {
    myTBTN.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
//--------------------------------------- PRODUCT ------------------------------------
const bigImg = document.querySelector(".product-content-left-big-img img")
const smalImg = document.querySelectorAll(".product-content-left-small-img img")
smalImg.forEach(function(imgItem,X){
    imgItem.addEventListener("click",function(){
        bigImg.src = imgItem.src
    })
})
const baoquan = document.querySelector(".baoquan")
const chitiet = document.querySelector(".chitiet")
if(baoquan){
    baoquan.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-baoquan").style.display = "block"
    })
}
if(chitiet){
    chitiet.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "block"
        document.querySelector(".product-content-right-bottom-content-baoquan").style.display = "none"
    })
}
const butTon = document.querySelector(".product-content-right-bottom-top")
if(butTon){
    butTon.addEventListener("click", function(){
        document.querySelector(".product-content-right-bottom-content-big").classList.toggle("activeB")
    })
}