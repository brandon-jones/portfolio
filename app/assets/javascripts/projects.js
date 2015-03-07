var listen, projectSearch, reload_preview;

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
  return $("#projects-search").on("keyup", projectSearch);
});

reload_preview = function(event) {
  console.log($("#project_tags").val());
  return $.post('/projects/markdown', {
    project_title: $("#project_title").val(),
    project_tags: $("#project_tags").val(),
    project_link: $("#project_link").val(),
    project_link_text: $("#project_link_text").val(),
    project_description: $("#project_description").val(),
    project_details: $("#project_details").val()
  }, function(data) {
    return $(".markdown-preview").html(data);
  });
};

projectSearch = function(event) {
  return $.post('/projects/search', {
    project_search: $("#project-search").val()
  }, function(data) {
    return $("#page-content").html(data);
  });
};