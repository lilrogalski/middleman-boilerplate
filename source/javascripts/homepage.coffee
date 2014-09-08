$ ->

  $(window).load ->
    $("body").addClass "loaded"

  $navLink = $(".homepage-header-nav li a")

  # if nav list is current page, don't follow link
  $navLink.on "click", (e) ->
    if $(@).parents("li").hasClass "active"
      e.preventDefault()

  isTouch = ->
    (navigator.platform.indexOf("iPhone") isnt -1) or (navigator.platform.indexOf("iPad") isnt -1)

  # animate header title
  $aboutLink = $(".about-link")

  $(window).on "scroll", (e) ->
    scroll = $(@).scrollTop()

    unless isTouch()

      if scroll < 100
        $animatedTitle.css
          "opacity": 1,
          "-webkit-transform": "scale(1)"

        $aboutLink.css "opacity", 1

      if scroll >= 100
        $animatedTitle.css
          "opacity": "#{1 - (scroll / 300)}",
          "-webkit-transform": "perspective( 600px ) rotateX( -#{scroll/60}deg )"

        $aboutLink.css "opacity", "#{1 - (scroll / 440)}"


  # homepage scroll to about
  $aboutLink.on "click", (e) ->
    e.preventDefault()
    offset = $('#about').offset().top
    $("body, html").animate scrollTop: offset, 400



