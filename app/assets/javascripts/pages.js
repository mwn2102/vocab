// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
// jQuery.fn.submitOnClick = function(){
//     this.find('input[type=radio]').on('click',function(){
//         console.log('clicked!');
//         $(this).parent('form').submit();
//     });
// };

// $(function() {
//     $('.edit_page').submitOnClick();
// });

$(function() {
    $('.edit_page input[type=radio]').on('click',function(){
        $(this).parent('form').submit();
    });
    
    $('#hide').on('click',function(){
       $(".display_learned").toggle(); 
       $(this).text($(this).text() == 'Show' ? 'Hide' : 'Show');
    //   if ($('#hide').text == "Hide") {
    //       $('#hide').text("Show");
    //   }
    //   else {
    //       $('#hide').text("Hide");
    //   }
      
       
    });
    
    
});

// Same code also worked in update.js file. 