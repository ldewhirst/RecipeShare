var masonryContainer = $('#container');

masonryContainer.imagesLoaded(function(){
  masonryContainer.masonry({
    itemSelector: '.box',
    isFitWidth: true,
    columnWidth: 215
  });
});
