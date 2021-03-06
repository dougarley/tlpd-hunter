// Generated by CoffeeScript 1.8.0
(function() {
  var AddButton;

  AddButton = (function() {
    function AddButton(button) {
      this.addButton = Ti.UI.createView({
        height: button.size,
        width: button.size,
        borderRadius: '30dp',
        backgroundGradient: {
          type: 'linear',
          startPoint: {
            x: '0%',
            y: '0%'
          },
          endPoint: {
            x: '0%',
            y: '100%'
          },
          colors: [
            {
              color: '#c00',
              offset: 0.0
            }, {
              color: '#b00',
              offset: 1.0
            }
          ]
        }
      });
      this.border = Ti.UI.createView({
        bottom: button.bottom,
        right: button.right,
        height: '64dp',
        width: '64dp',
        borderRadius: '32dp',
        backgroundGradient: {
          type: 'linear',
          startPoint: {
            x: '0%',
            y: '0%'
          },
          endPoint: {
            x: '0%',
            y: '100%'
          },
          colors: [
            {
              color: '#F33',
              offset: 0.0
            }, {
              color: '#c00',
              offset: 0.5
            }
          ]
        }
      });
      this.icon = Ti.UI.createImageView({
        image: 'images/plus.png',
        height: '44dp',
        width: '44dp'
      });
      this.create = function() {
        this.addButton.add(this.icon);
        this.border.add(this.addButton);
        return this.border;
      };
      this.addEventListener = function(type, callback) {
        return this.border.addEventListener(type, callback);
      };
    }

    return AddButton;

  })();

  exports.AddButton = AddButton;

}).call(this);
