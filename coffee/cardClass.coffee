class Card
  constructor: (card) ->
    # Elements array to for elements to be added to card
    @elements = []

    # Checking for padding otherwise none
    @padding = card.padding or 0

    # Main card container
    @main = Ti.UI.createView(
        width: '100%', height: Ti.UI.SIZE
        layout : 'vertical'
    )

    # Card wrapper to provide padding
    @wrapper = Ti.UI.createView(
        backgroundColor : '#fafafa'
        width: '100%', height: Ti.UI.SIZE
    )

    # Card content area with padding is available
    @content = Ti.UI.createView(
        width: '100%', height : Ti.UI.SIZE
        top: @padding, bottom: @padding
        layout : 'vertical'
    )

    # Card dropshadow element
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
        @elements.push(element)

    # Create method, renders card element
    @create = () ->
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
