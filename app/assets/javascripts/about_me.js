$(document).ready(function() {
  sizeTextArea();
});

sizeTextArea = function(e) {
  var textArea = $('#about_me');
  textArea.height(textArea[0].scrollHeight);
};