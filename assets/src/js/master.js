(function($) {

   // Can also be used with $(document).ready()
    $(function() {

        if( $('.flexslider').length ) {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        };

      $('.fancybox-single').fancybox();

      if( $('body.multimedia .sidebar-wrap').length ) {
          $('body.multimedia .sidebar-wrap').animate({'opacity': 0.5});
          $('body.multimedia .sidebar-wrap').mouseover(function(e) {
            $(this).animate({'opacity': 1});
          }).mouseleave(function(e) {
            $(this).animate({'opacity': 0.5});
          });
      }

      if( $('.flexslider').length ) {
        $('.flexslider').flexslider({
          animation: "slide",
          controlNav: "thumbnails",
          start: function(slider){
            $('body').removeClass('loading');
          }
        });
      }

    });

})(jQuery);

