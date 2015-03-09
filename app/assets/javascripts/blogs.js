$(function() {

   // Start the timer when the page loads

  textAreaPointer();
  loadMarkdown();
  $(".notice").fadeOut(5000);
  return;
});

loadMarkdown = function(event) {
  if ($('#blog_body').length > 0) {
    var title, tags, created_at, body;
    title = $("#blog_title").val();
    tags = $("#blog_tags").val();
    created_at = $("#blog_created_at").val();
    body = $("#blog_body").val();
    if (title.length > 0 || tags.length > 0 || created_at.length > 0 || body.length > 0 ) {
      return $.ajax({
        type: 'POST',
        url: '/blogs/markdown',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
          blog: {
            title: title,
            tags: tags,
            created_at: created_at,
            body: body
          }
        },
        success: function(data, textStatus) {
          keypress = false;
          return $('.markdown-preview').html(data);
        }
      });
    }
  }
};

textAreaPointer = function(e) {
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