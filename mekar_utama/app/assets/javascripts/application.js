// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

$(document).ready(function(){
	//Remove outline from links
	$("a").click(function(){
		$(this).blur();
	});

	//When mouse rolls over
	$("li.menu-product").mouseover(function(){
		$("span.sub-menu").show().animate({height:'70px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});

	//When mouse is removed
	$("li.menu-product").mouseleave(function(){
		$("span.sub-menu").stop().animate(
      {height:'20px'},{queue:false, duration:600, easing: 'easeOutBounce'//,
      //complete: function() {$("span.sub-menu").hide()}
      }
    )
		$("span.sub-menu").hide( "fast" );
	});

});

