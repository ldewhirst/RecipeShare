
var $container = $('#container');

$container.imagesLoaded( function(){
  $container.masonry({
    itemSelector: '.box',
    isFitWidth: true,
    columnWidth: 215,
  });
});
