var listen, reload_preview;

listen = function(el, event, handler) {
  if (el.addEventListener) {
    return el.addEventListener(event, handler);
  } else {
    return el.attachEvent('on' + event, function() {
      return handler.call(el);
    });
  }
};

$(function() {
  $(".rerender-on-keyup").on("keyup", reload_preview);
  return;
});

reload_preview = function(event) {
  return $.ajax({
    type: 'POST',
    url: '/projects/markdown',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {
      project_title: $("#project_title").val(),
      project_tags: $("#project_tags").val(),
      project_link: $("#project_link").val(),
      project_link_text: $("#project_link_text").val(),
      project_description: $("#project_description").val(),
      project_details: $("#project_details").val()
    },
    success: function(data, textStatus) {
      keypress = false;
      return $('.markdown-preview').html(data);
    }
  });
};