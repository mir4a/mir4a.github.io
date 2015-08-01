---
---

$ ->
  batteryColor = (percentage) ->
    r = 250
    g = 250
    b = 0
    yellowEdge = 40
    if percentage >= yellowEdge
      r = Math.floor((1 - (((percentage - yellowEdge))/(100 - yellowEdge))) * 250)
    else
      g = Math.floor(((percentage)/(yellowEdge)) * 250)

    'rgb(' + r + ',' + g + ',' + b + ')'

  battery = navigator.battery || navigator.webkitBattery || navigator.mozBattery
  if battery
    level = battery.level * 100
    $('body')
      .prepend('<battery><charge></charge></battery>')
      .find('charge')
      .css(
        'width': level + '%',
        'background': batteryColor(level)
      )

    battery.addEventListener('levelchange', ->
      level = battery.level * 100
      $('charge').css(
        'width': level + '%',
        'background': batteryColor(level)
      )
    )
