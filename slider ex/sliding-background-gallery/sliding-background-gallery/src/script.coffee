# Inspiration:
# http://coolcarousels.frebsite.nl/c/59/
# & 
# https://css-tricks.com/slider-with-sliding-backgrounds/

$right_arrow = $('#right-arrow')
$left_arrow = $('#left-arrow')

$right_arrow.click (e) ->
  e.preventDefault()
  $('.slide-holder').velocity('finish') # finish any current animations
  animate_next('#slide-right')
  animate_next('#slide-center', 175)
  animate_next('#slide-left', 350)

$left_arrow.click (e) ->
  e.preventDefault()
  $('.slide-holder').velocity('finish') # finish any current animations
  animate_previous('#slide-left')
  animate_previous('#slide-center', 175)
  animate_previous('#slide-right', 350)
  
animate_next = (selector, delay=0, cb=null) ->
  setTimeout ->
    $el = $("#{selector} .slide-holder") # select the elements
    $bg_prev = $el.find('.bg-previous')
    $bg_curr = $el.find('.bg-current')
    $bg_next = $el.find('.bg-next')
    $.Velocity.hook($el, "translateX", "-#{100/3}%") # set transform before animating
    $.Velocity.animate($el, { # animate the transform
      translateX: "-#{200/3}%"
      duration: 350
    }).then (elms) -> # reorder the slide-bg's and recenter the slide-holder
      next_bg_image = $.Velocity.hook($bg_prev, "background-image")
      $.Velocity.hook($bg_prev, "background-image", $.Velocity.hook($bg_curr, "background-image"))
      $.Velocity.hook($bg_curr, "background-image", $.Velocity.hook($bg_next, "background-image"))
      $.Velocity.hook($el, "translateX", "-#{100/3}%")
      $.Velocity.hook($bg_next, "background-image", next_bg_image)
      cb(elms) if typeof cb is 'function'
  , delay
  
animate_previous = (selector, delay, cb) ->
  setTimeout ->
    $el = $("#{selector} .slide-holder") # select the elements
    $bg_prev = $el.find('.bg-previous')
    $bg_curr = $el.find('.bg-current')
    $bg_next = $el.find('.bg-next')
    $.Velocity.hook($el, "translateX", "-#{100/3}%") # set transform before animating
    $.Velocity.animate($el, { # animate the transform
      translateX: "0"
      duration: 350
    }).then (elms) -> # reorder the slide-bg's and recenter the slide-holder
      prev_bg_image = $.Velocity.hook($bg_next, "background-image")
      $.Velocity.hook($bg_next, "background-image", $.Velocity.hook($bg_curr, "background-image"))
      $.Velocity.hook($bg_curr, "background-image", $.Velocity.hook($bg_prev, "background-image"))
      $.Velocity.hook($el, "translateX", "-#{100/3}%")
      $.Velocity.hook($bg_prev, "background-image", prev_bg_image)
      cb(elms) if typeof cb is 'function'
  , delay