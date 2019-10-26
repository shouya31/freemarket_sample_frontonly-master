$(function(){

  function empty_warnig(){
    let html = ` <div class="form_warning">
    <p style="color: red;">こちらの項目は必須です</p>
    </div>
   `
   return html
  }

  function too_short_warnig(){
    let html = ` <div class="form_warning">
    <p style="color: red;">６文字以上入力してください</p>
    </div>
   `
   return html
  }

  $(".inputField").one("focusout", function(){
    let form = $(this).val()
    let warning_now = $(this).parent()[0]

    if(form == ""){
      if(!$(warning_now).hasClass("warning_now")){
        $(this).parent().append(empty_warnig)
        $(warning_now).attr("class", "warning_now")
      }
    } 
  })

  $(".inputField").on("keyup", function(){
    let warning_now = $(this).parent()[0]
    if($(warning_now).hasClass("warning_now")){
      $(warning_now).find('.form_warning')[0].remove()
      $(warning_now).removeClass("warning_now")
    }
  })

  $(".too_short_warning").one("focusout", function(){
    let form = $(this).val()
    let warning_now = $(this).parent()[0]
  
    if(form.length < 6 ){
      if(!$(warning_now).hasClass("too_short_warning_now")){
        
        $(this).parent().append(too_short_warnig)
        $(warning_now).attr("class", "too_short_warning_now")
      }
    }
  })

  $(".too_short_warning").on("keyup", function(){
    
    let warning_now = $(this).parent()[0]
    if($(warning_now).hasClass("too_short_warning_now")){
      $(this).parent().find('.form_warning').remove()
      $(warning_now).removeClass("too_short_warning_now")
    }
  })

})