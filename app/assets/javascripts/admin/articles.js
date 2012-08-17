$(function(){
  $('li#gallery a').lightBox({
    fixedNavigation:true,
    imageLoading: '/assets/lightbox-ico-loading.gif',
    imageBtnClose: '/assets/lightbox-btn-close.gif',
    imageBtnPrev: '/assets/lightbox-btn-prev.gif',
    imageBtnNext: '/assets/lightbox-btn-next.gif',
    overlayBgColor: '#FFF'
    });

  $("#article_tags").tokenInput("tags.json", {
    prePopulate:       $("#article_tags").data("pre"),
    preventDuplicates: true,
    theme: "facebook",
    noResultsText: "No result, hit space to create a new tag",
    animateDropdown:   false});
  
  bkLib.onDomLoaded(function() { 
    new nicEditor({iconsPath : '/assets/nicEditorIcons.gif', fullPanel : true}).panelInstance('article_body');
    new nicEditor({iconsPath : '/assets/nicEditorIcons.gif', fullPanel : true}).panelInstance('article_excerpt'); 
    });


});
