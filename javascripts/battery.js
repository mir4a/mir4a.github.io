(function() {
  $(function() {
    var battery, batteryColor, level;
    batteryColor = function(percentage) {
      var b, g, r, yellowEdge;
      r = 250;
      g = 250;
      b = 0;
      yellowEdge = 40;
      if (percentage >= yellowEdge) {
        r = Math.floor((1 - ((percentage - yellowEdge) / (100 - yellowEdge))) * 250);
      } else {
        g = Math.floor((percentage / yellowEdge) * 250);
      }
      return 'rgb(' + r + ',' + g + ',' + b + ')';
    };
    battery = navigator.battery || navigator.webkitBattery || navigator.mozBattery;
    if (battery) {
      level = battery.level * 100;
      $('body').prepend('<battery><charge></charge></battery>').find('charge').css({
        'width': level + '%',
        'background': batteryColor(level)
      });
      return battery.addEventListener('levelchange', function() {
        level = battery.level * 100;
        return $('charge').css({
          'width': level + '%',
          'background': batteryColor(level)
        });
      });
    }
  });

}).call(this);
