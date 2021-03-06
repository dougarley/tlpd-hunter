Titanium.UI.setBackgroundColor '#EEE'

RoundButton = require('addButtonClass').AddButton
Card = require('cardClass').Card

mainWindow = Ti.UI.createWindow(
  title : 'Characters'
  navTintColor : '#FFEA00'
  backgroundColor : '#EEE'
)

mainScroll = Ti.UI.createScrollView(
  width : Ti.UI.SIZE
  height : Ti.UI.FILL
  contentHeight : 'auto'
)

mainContent = Ti.UI.createView(
  width: Ti.UI.SIZE
  left : 0, top : 0,
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

addButton = new RoundButton(
  right : '26dp',
  bottom : '26dp',
  size : '60dp'
)

# Recent Kill
recentKillHeader = Ti.UI.createLabel(
  text : 'Recent Activity'
  font :
    fontSize : '16sp'
    fontWeight : 'bold'
  color : '#9E9E9E'
  top : '7sp', left : '20dp'
)

recentKillCard = new Card(
  top : '10dp', left : 0
  padding : '20dp'
)

recentDataTemp = Ti.UI.createLabel(
  text : 'No recent activity.'
  font :
    fontSize : '16sp'
  left: '20dp', top : 0
  color : '#000'
)

recentKillCard.add(recentDataTemp)

# Characters List
charactersTableHeader = Ti.UI.createLabel(
  text : 'Characters'
  font :
    fontSize : '16sp'
    fontWeight : 'bold'
  color : '#9E9E9E'
  top : '7sp', left : '20dp'
)

charactersTable = Ti.UI.createTableView()

charactersTableCard = new Card(
  top : '10dp', left : 0
)

charactersTableCard.add(charactersTable)

mainContent.add(recentKillHeader)
mainContent.add(recentKillCard.create())
mainContent.add(charactersTableHeader)
mainContent.add(charactersTableCard.create())

mainWindow.add(mainContent)
mainWindow.add(addButton.create())


generateView = require('mainViewController').generateView
character_data = require('tempdata').characters
detailsWindow = require('detailsWindowView').detailsWindow
addWindow = require('addWindow').addWindow

charactersTable.addEventListener('click', (e) ->
  detailsWindow(e.source.details)
)

addButton.addEventListener('click', (e) ->
  addWindow()
)

generateView(character_data, charactersTable)

mainWindow.open()
