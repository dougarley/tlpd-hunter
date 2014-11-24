Titanium.UI.setBackgroundColor '#EEE'

addButtonCreator = require('addButtonClass').AddButton

mainWindow = Ti.UI.createWindow(
    title : 'Characters'
    navTintColor : '#FFEA00'
    backgroundColor : '#EEE'
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

charactersTable = Ti.UI.createTableView()

mainWindow.add(charactersTable)
mainWindow.add(addButton.create())


generateView = require('mainViewController').generateView
character_data = require('tempdata').characters
detailsWindow = require('detailsWindowView').detailsWindow

charactersTable.addEventListener('click', (e) ->
    detailsWindow(e.source.details)
)


generateView(character_data, charactersTable)

mainWindow.open()
