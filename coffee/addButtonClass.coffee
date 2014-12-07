class AddButton
  constructor: (button) ->
    @addButton = Ti.UI.createView(
        height : button.size,
        width : button.size,

        # String conversion stuff needs to go here
        borderRadius : '30dp'
        backgroundGradient: {
            type: 'linear',
            startPoint: { x: '0%', y: '0%' },
            endPoint: { x: '0%', y: '100%' },
            colors: [
                { color: '#c00', offset: 0.0},
                { color: '#b00', offset: 1.0 }
            ],
        }
    )
    @border = Ti.UI.createView(
        bottom : button.bottom, right : button.right,

        #More string conversion stuff
        height : '64dp', width : '64dp',
        borderRadius : '32dp',
        backgroundGradient: {
            type: 'linear',
            startPoint: { x: '0%', y: '0%' },
            endPoint: { x: '0%', y: '100%' },
            colors: [
                { color: '#F33', offset: 0.0},
                { color: '#c00', offset: 0.5 }
            ],
        }
    )
    @icon = Ti.UI.createImageView(
        image : 'images/plus.png',
        height : '44dp', width : '44dp'
    )
    @create = () ->
        @addButton.add(@icon)
        @border.add(@addButton)
        @border

    @addEventListener = (type, callback) ->
        @border.addEventListener(type, callback)

exports.AddButton = AddButton
