$(function(){
  $('li#gallery a').lightBox({
    fixedNavigation:true,
    imageLoading: '/assets/lightbox-ico-loading.gif',
    imageBtnClose: '/assets/lightbox-btn-close.gif',
    imageBtnPrev: '/assets/lightbox-btn-prev.gif',
    imageBtnNext: '/assets/lightbox-btn-next.gif',
    overlayBgColor: '#FFF'
    });
  var Editor = new YAHOO.widget.SimpleEditor('article_body', {
    height: '500px',
    width: '95%',
    dompath: true,
    animate: true
  });
  Editor.on('editorWindowBlur', function() {
    $('#article_body').html(Editor.getEditorHTML());
  });
  Editor.render();  
    
});
