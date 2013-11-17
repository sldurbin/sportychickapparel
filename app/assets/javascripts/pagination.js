$(function (){ 
    $("body").on("click", ".pagination a", function(e) {
        $("div.loading").append('<p>Page is loading...</p>');       
        $.get(this.href, $("form#filter-form").serialize(), null, 'script');  
        return false;  
    });  
});  
