function pagination_handler(){ 
    $("body").on("click", ".pagination a", function(e) {
        loading();
        $.get(this.href, $("form#filter-form").serialize(), null, 'script');  
        return false;  
    });  
}  
