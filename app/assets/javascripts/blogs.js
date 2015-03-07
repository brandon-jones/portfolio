var blogSearch, loadMarkdown;

$(function() {
  textAreaPointer();
  $(".presentation").on("click", loadMarkdown);
  $(".notice").fadeOut(5000);
  return $("#blogs-search").on("keyup", blogSearch);
});

loadMarkdown = function(event) {
  return $.post('/blogs/markdown', {
    blog_title: $("#blog_title").val(),
    blog_tags: $("#blog_tags").val(),
    blog_created_at: $("#blog_created_at").val(),
    blog_body: $("#blog_body").val()
  }, function(data) {
    return $("#markdown-preview").html(data);
  });
};

blogSearch = function(event) {
  return $.post('/blogs/search', {
    blog_search: $("#blogs-search").val()
  }, function(data) {
    return $("#page-content").html(data);
  });
};

textAreaPointer = function(e) {
  console.log('test');
  $("textarea").mousemove(function(e) {
    var myPos = $(this).offset();
    myPos.bottom = $(this).offset().top + $(this).outerHeight();
    myPos.right = $(this).offset().left + $(this).outerWidth();

    if (myPos.bottom > e.pageY && e.pageY > myPos.bottom - 16 && myPos.right > e.pageX && e.pageX > myPos.right - 16) {
        $(this).css({ cursor: "row-resize" });
    }
    else {
        $(this).css({ cursor: "" });
    }
  });
};