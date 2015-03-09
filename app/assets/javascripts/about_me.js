$(document).ready(function() {
  sizeTextArea();
});

sizeTextArea = function(e) {
  var textArea = $('#about_me');
  if (textArea.length > 0) {
  	textArea.height(textArea[0].scrollHeight);
  }
};