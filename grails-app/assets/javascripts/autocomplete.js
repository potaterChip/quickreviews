$(function() {
 
    $("#movieName").autocomplete({
        source: "http://localhost:8080/category/fakeTestJson",
        minLength: 2,
        
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
 
});