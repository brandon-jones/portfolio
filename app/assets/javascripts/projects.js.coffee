# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".rerender-on-keyup").on "keyup", reload_preview

reload_preview = (event) ->
	console.log($("#project_tags").val())
	$.post '/projects/markdown', 
    project_title: $("#project_title").val()
    project_tags: $("#project_tags").val()
    project_link: $("#project_link").val()
    project_link_text: $("#project_link_text").val()
    project_description: $("#project_description").val()
    project_details: $("#project_details").val()
    (data) -> $(".markdown-preview").html(data)