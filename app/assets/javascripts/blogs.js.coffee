# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".presentation").on "click", loadMarkdown

  $(".notice").fadeOut(5000);

  $("#blogs-search").on "keyup", blogSearch

loadMarkdown = (event) ->
  $.post '/blogs/markdown', 
    blog_title: $("#blog_title").val()
    blog_tags: $("#blog_tags").val()
    blog_created_at: $("#blog_created_at").val()
    blog_body: $("#blog_body").val()
    (data) -> $("#markdown-preview").html(data)

blogSearch = (event) ->
  $.post '/blogs/search',
    blog_search: $("#blogs-search").val()
    (data) -> $("#page-content").html(data)