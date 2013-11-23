// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

function loading() {
  unleashSpinner();
}

function minimizableMenu() {
  $(".expand").click(function() {
    minimizable_element = $(this).parents("ul.minimizable").find("li.button-holder");
    if( $(minimizable_element).is(":hidden") ) {
      $(this).find("i").removeClass("icon-plus");
      $(this).find("i").addClass("icon-minus");
    }else {
      $(this).find("i").removeClass("icon-minus");
      $(this).find("i").addClass("icon-plus");
    }
    $(minimizable_element).slideToggle();
  });
}

var $currentSpinner = null;
var ready;
ready = function() {

  jQuery.browser={};(function(){jQuery.browser.msie=false;
  jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
  jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();

  $('.dropdown-toggle').dropdown();

  $('.checkable').on('change',
    function() { 
        loading();
        $(this).parents('form:first').submit();
  });
  
  pagination_handler();

  minimizableMenu();

};

$(document).on('page:load', function() {
  twttr.widgets.load();
  FB.XFBML.parse();  
});

$(document).ready(ready);
$(document).on('page:load', ready);
