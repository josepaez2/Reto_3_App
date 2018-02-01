
  $(document).ready(function() {

   // $('.navbar-burger').on('click', function() {
   $('#body').on('click', '.navbar-burger', function() { 
        $(this).toggleClass('is-active')
        $('.navbar-menu').toggleClass('is-active')
        // $('.done').append(this)
        // location.reload();
    })

    $('#body').on('click', '.refresh', function() { 
        location.reload();
    })

    $('#body').on('click', '.delete', function() { 
        location.reload();
        // $(this).hide
    })

  })


// document.addEventListener('DOMContentLoaded', function () {

//   // Get all "navbar-burger" elements
//   var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

//   // Check if there are any navbar burgers
//   if ($navbarBurgers.length > 0) {

//     // Add a click event on each of them
//     $navbarBurgers.forEach(function ($el) {
//       $el.addEventListener('click', function () {

//         // Get the target from the "data-target" attribute
//         var target = $el.dataset.target;
//         var $target = document.getElementById(target);

//         // Toggle the class on both the "navbar-burger" and the "navbar-menu"
//         $el.classList.toggle('is-active');
//         $target.classList.toggle('is-active');

//         // document.querySelectorAll('.navbar-menu').toggle('is-active');
//       });
//     });
//   };
// });




// document.addEventListener('DOMContentLoaded', function () {


//   // Get all "navbar-menu" elements
//   var $navbarmenus = Array.prototype.slice.call(document.querySelectorAll('.navbar-menu'), 0);

//   // Check if there are any navbar menus
//   if ($navbarmenus.length > 0) {

//     // Add a click event on each of them
//     $navbarmenus.forEach(function ($el) {
//       $el.addEventListener('click', function () {

//         // Get the target from the "data-target" attribute
//         var target = $el.dataset.target;
//         var $target = document.getElementById(target);

//         // Toggle the class on both the "navbar-menu" and the "navbar-menu"
//         $el.classList.toggle('is-active');
//         $target.classList.toggle('is-active');

//       });
//     });
//   }

//   });














