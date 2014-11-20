Titanium.UI.setBackgroundColor '#EEE'

addButtonCreator = require('addButtonClass').AddButton

mainWindow = Ti.UI.createWindow(
    title : 'Characters'
    navTintColor : '#FFEA00'
    backgroundColor : '#EEE'
    layout : 'vertical'
)

mainWindow.addEventListener("open", () ->
    if ! mainWindow.activity
        Ti.API.error "Can't access action bar on a lightweight window."
    else
        actionBar = mainWindow.activity.actionBar

    if actionBar
        # Change to Blank PNG
        actionBar.logo = 'images/plus.png'
)

addButton = new addButtonCreator(
    right : '26dp',
    bottom : '26dp',
    size : '60dp'
)

charactersTableShadow = Ti.UI.createView(
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

charactersTable = Ti.UI.createTableView()

mainWindow.add(charactersTable)
mainWindow.add(charactersTableShadow)
mainWindow.add(addButton.create())


generateView = require('mainViewController').generateView
character_data = require('tempdata').characters
detailsWindow = require('detailsWindowView').detailsWindow

charactersTable.addEventListener('click', (e) ->
    detailsWindow(e.source.details)
)


generateView(character_data, charactersTable)

mainWindow.open()
