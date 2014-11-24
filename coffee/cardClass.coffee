class Card
  constructor: (card) ->
    ## Character Details content wrapper
    @main = Ti.UI.createView(
        width: '100%', height: Ti.UI.SIZE
        layout : 'vertical'
    )

    @wrapper = Ti.UI.createView(
        backgroundColor : '#fafafa'
        width: '100%', height: Ti.UI.SIZE
    )

    ## Character Details content element with padding
    @content = Ti.UI.createView(
        width: '100%', height : Ti.UI.SIZE
        top: '20dp', bottom: '20dp'
        layout : 'vertical'
    )

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
    @elements = []
    @add = (element) ->
        @elements.push(element)

    @create = () ->
        for element in @elements
            @content.add(element)

        @wrapper.add(@content)
        @main.add(@wrapper)
        @main.add(@dropshadow)
        @main

exports.Card = Card
