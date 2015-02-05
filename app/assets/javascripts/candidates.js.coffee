$ ->
  if $('.new_candidate').length > 0
    # Get our s3params from our endpoint
    $.get '/pspost', ((s3params) ->
      # Attach the upload functionality to any file input
      $('.new_candidate').find('input:file').each (i, elem) ->
        fileInput = $(elem)
        form = $(fileInput.parents('form:first'))
        submitButton = form.find('input[type="submit"]')
        progressBar = $('<div class=\'progress-bar progress-bar-warning progress-bar-striped active\'></div>')
        barContainer = $('<div class=\'progress hidden\'></div>').append(progressBar)
        fileInput.after barContainer
        fileInput.fileupload
          fileInput: fileInput
          url: '//' + s3params.url.host
          type: 'POST'
          autoUpload: true
          formData: s3params.fields
          paramName: 'file'
          dataType: 'XML'
          replaceFileInput: false
          progressall: (e, data) ->
            progress = parseInt(data.loaded / data.total * 100, 10)
            progressBar.css 'width', progress + '%'
            return
          start: (e) ->
            submitButton.prop 'disabled', true
            barContainer.removeClass 'hidden'
            progressBar.css('display', 'block').css 'width', '0%'
            return
          done: (e, data) ->
            submitButton.prop 'disabled', false
            progressBar.addClass 'done'
            progressBar.removeClass 'progress-bar-striped'
            barContainer.fadeOut 'slow'
            # extract key and generate URL from response
            location = $(data.jqXHR.responseXML).find('Location').text()
            # create hidden field
            input = $('<input />',
              type: 'hidden'
              name: fileInput.attr('name')
              value: location)
            form.append input
            return
          fail: (e, data) ->
            submitButton.prop 'disabled', false
            progressBar.css 'background', 'red'
            return
        return
      return
    ), 'json'
  return
