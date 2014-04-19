$ ->
  battery = navigator.battery || navigator.webkitBattery || navigator.mozBattery
  if battery
    level = battery.level * 100
    $('body').prepend('<battery><charge></charge></battery>').find('charge').css('width', level + '%')
    battery.addEventListener('levelchange', ->
      level = battery.level * 100
      $('charge').css('width', level + '%')
    )
