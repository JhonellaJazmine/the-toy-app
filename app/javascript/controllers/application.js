import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

$(function() {
    $('#micropost_image').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      // here's the file size
      console.log(image.size);
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;
        $('#target').html(img);
      }
      reader.readAsDataURL(image);
      console.log(files);
    });
  });
  $(function() {
    $('#post_image').on('change', function(e) {
      var reader = new FileReader(); // create a new FileReader object
      reader.onload = function(event) {
        $('#preview-image').removeAttr('class'); // remove class 'hidden'
        $('#preview-image').attr('src', event.target.result); // set source of image tag
      }
      reader.readAsDataURL(e.target.files[0]); // read selected file and convert it to base64 encoded string
    });
  });


  function previewImages() {
    var previewContainer = $('#image-preview');
    previewContainer.empty();
    var files = $('#micropost_additional_images')[0].files;
    if (files.length > 0) {
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var reader = new FileReader();
        reader.onload = function(event) {
          var previewUrl = event.target.result;
          var previewImage = $('<img>').addClass('preview-image').attr('src', previewUrl);
          previewContainer.append(previewImage);
        }
        reader.readAsDataURL(file);
      }
    }
  }