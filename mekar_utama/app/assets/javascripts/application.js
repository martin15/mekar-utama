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
	$("li#list-product").mouseover(function(){
    $("li#list-product").css("background", "linear-gradient(to bottom, #332391 0%, #3a2a9a 21%, #3f2fa7 27%,              #4133b1 41%, #442ec9 71%, #553afb 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)");
		//$("ul#parent-list-product").show().animate({queue:false, duration:400, easing: 'easeOutBounce'})
		$("ul#parent-list-product").fadeIn(1);
	  //alert("aaa");
  });

	//When mouse is removed
	$("li#list-product").mouseleave(function(){
//		$("ul#parent-list-product").stop().animate(
//      {queue:false, duration:600, easing: 'easeInBack'//,
//      //complete: function() {$("span.sub-menu").hide()}
//      }
//    )
		$("ul#parent-list-product").fadeOut(500);
    setTimeout(function () {
        $("li#list-product").css("background", "linear-gradient(to bottom, #ff908a 0%, #f65c54 27%, #dd281c 70%, #dc261c 80%,              #db241c 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)");
    }, 200);
    //$("li#list-product").delay(800).css("background", "#linear-gradient(to bottom, #9aff72 0%, #9afd62 27%, #9aed52 70%, #9add42 80%, #9acd32 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)")
	});


});


function is_best_seller_picture(name, p_id, i_id){
  $("#loader_"+name).show();
  if($("#"+name).is(':checked')){
    var bs = true;
  }else{
    var bs = false;
  }
  $.ajax({
    type: "GET",
    url:    "/admin/products/"+p_id+"/product_images/"+i_id+"/set_best_seller", // should be mapped in routes.rb
    data: {is_best_seller: bs},
    datatype:"html", // check more option
    success: function(data) {
      $("#loader_"+name).hide();
    },
    async:   true
  });
}


function zoom_image(el){
  alert($(this).parent().attr('class'))
  $(this)
    .css({
        "display":"none"
//      "transform": "scale(1.1)",
//      "transition": "all 0.5s ease 0s"
    });
  $(this).find("div.product-info > a")
    .css({
      "color": "#f08364"
    })
}

