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


class Card
  constructor: (card) ->
    Ti.API.debug 'Creating Card'

    # Elements array to for elements to be added to card
    @elements = []

    # Main card container
    Ti.API.debug 'Creating main card container'
    @main = Ti.UI.createView(
        top : 0, left : 0
        width: '100%', height: Ti.UI.SIZE
        layout : 'vertical'
    )


    # Checking for padding otherwise none
    Ti.API.debug 'Checking for arguments'
    if card
        @padding = card.padding or 0
        @main.top = card.top or undefined
        @main.left = card.left or undefined
        @main.right = card.right or undefined
        @main.bottom = card.bottom or undefined

    # Card wrapper to provide padding
    Ti.API.debug 'Creating card wrapper'
    @wrapper = Ti.UI.createView(
        backgroundColor : '#fafafa'
        width: '100%', height: Ti.UI.SIZE
    )

    # Card content area with padding is available
    Ti.API.debug 'Creating content area'
    @content = Ti.UI.createView(
        width: '100%', height : Ti.UI.SIZE
        top: @padding, bottom: @padding
        layout : 'vertical'
    )

    # Card dropshadow element'
    Ti.API.debug 'Creating dropshadow'
    @dropshadow = Ti.UI.createView(
        width: '100%', height : '3dp',
        opacity : 0.26
        backgroundGradient :
            type : 'linear',
            startPoint: { x : '0%', y : '0%' },
            endPoint: { x : '0%', y:  '100%' },
            colors: [
                { color: '#000', offset: 0.0},
                { color: '#eee', offset: 0.5 }
            ]
    )

    # Card add method, adds elements at the elements array
    @add = (element) ->
        Ti.API.debug 'Adding element ' + JSON.stringify(element)
        @elements.push(element)

    # Create method, renders card element
    @create = () ->
        Ti.API.debug 'Rendering card'
        # Loops through elements and adds them to the card content
        for element in @elements
            @content.add(element)

        # Combine other parent element
        @wrapper.add(@content)
        @main.add(@wrapper)
        @main.add(@dropshadow)

        # Return main rendered card
        @main

exports.Card = Card
exports.AddButton = AddButton
