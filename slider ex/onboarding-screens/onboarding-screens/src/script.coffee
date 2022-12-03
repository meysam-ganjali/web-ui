$(document).ready ->
  walkthrough =
    index: 0
    
    nextScreen: ->
      if @index < @indexMax()
        @index++
        @updateScreen()

    prevScreen: ->
      if @index > 0
        @index--
        @updateScreen()
        
    updateScreen: ->
      @reset()
      @goTo @index
      @setBtns()
      
    setBtns: ->
      $nextBtn = $('.next-screen')
      $prevBtn = $('.prev-screen')
      $lastBtn = $('.finish')
      
      if walkthrough.index == walkthrough.indexMax()
        $nextBtn.prop('disabled', true);
        $prevBtn.prop('disabled', false);
        $lastBtn.addClass('active').prop('disabled', false);
        
      else if walkthrough.index == 0
        $nextBtn.prop('disabled', false)
        $prevBtn.prop('disabled', true)
        $lastBtn.removeClass('active').prop('disabled', true)
        
      else
        $nextBtn.prop('disabled', false)
        $prevBtn.prop('disabled', false)
        $lastBtn.removeClass('active').prop('disabled', true)


    goTo: (index) ->
      $('.screen').eq(index).addClass 'active'
      $('.dot').eq(index).addClass 'active'

    reset: ->
      $('.screen, .dot').removeClass 'active'

    indexMax: ->
      $('.screen').length - 1

    closeModal: ->
      $('.walkthrough, .shade').removeClass('reveal')
      setTimeout (=>
        $('.walkthrough, .shade').removeClass('show')
        @index = 0
        @updateScreen()
      ), 200

    openModal: ->
      $('.walkthrough, .shade').addClass('show')
      setTimeout (=>
        $('.walkthrough, .shade').addClass('reveal')
      ), 200
      @updateScreen()

  $('.next-screen').click ->
    walkthrough.nextScreen()

  $('.prev-screen').click ->
    walkthrough.prevScreen()

  $('.close').click ->
    walkthrough.closeModal()
    
  $('.open-walkthrough').click ->
    walkthrough.openModal()
    
  walkthrough.openModal()
 
  # Optionally use arrow keys to navigate walkthrough
  $(document).keydown (e) ->
    switch e.which
      when 37
        # left
        walkthrough.prevScreen()
      when 38
        # up
        walkthrough.openModal()
      when 39
        # right
        walkthrough.nextScreen()
      when 40
        # down
        walkthrough.closeModal()
      else
        return
    e.preventDefault()
    return