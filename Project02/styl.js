$(document).ready(function() {
  var slideIndex = 0;                                                           /* the slide show function */
  showSlides();
  
  function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 3000); // Change image every 3 seconds
  }
  $("#tog").click(function() {
    myyFunction();
  }
  )
  
});

myFunction();
  function myFunction() {
    
    var x = document.getElementById("myDIV");                                 /*  The show on toggle function */
    if (x.style.display === "none") {
      
      x.style.display = "block";
    } else {
      
      x.style.display = "none";
    }
  }
  myFunction2();
  function myFunction2() {
    
    var y = document.getElementById("myDIV2");
    if (y.style.display === "none") {
      
      y.style.display = "block";
    } else {
      
      y.style.display = "none";
    }
  }





  myyFunction();
  function myyFunction() {                                                          /*  Change theme function */
    var element = document.body;
    var z = document.querySelector(".maroon").classList.toggle("blue");
    element.classList.toggle("dark-mode");
  }