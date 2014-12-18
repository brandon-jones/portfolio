# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#presentation").on "click", loadMarkdown

loadMarkdown = (event) ->
  console.log($("#blog_body").text())
  $.get '/blogs/markdown', 
    blog_title: $("#blog_title").val()
    blog_tags: $("#blog_tags").val()
    blog_created_at: $("#blog_created_at").val()
    blog_body: $("#blog_body").val()
    (data) -> $("#markdown-preview").html(data)