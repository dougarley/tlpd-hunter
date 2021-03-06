
Card = require('cardClass').Card

exports.detailsWindow = (character) ->
  detailsController = require('detailsWindowController')

  detailsWin = Ti.UI.createWindow(
    backgroundColor : '#c00'
    backgroundImage : 'images/horde.png'
  )

  # Overall Window Scroll View
  characterDetailsScroll = Ti.UI.createScrollView
    width : Ti.UI.SIZE
    height : Ti.UI.FILL
    contentHeight : 'auto'

  characterImage = Ti.UI.createImageView(
    image : character.thumbnail
    height : '60dp',
    width : '60dp',
    backgroundColor : '#ccc',
    borderRadius : '30dp'
    left : '20dp', top: '60dp'
    zIndex : 2
  )

  # Character Details Card
  characterDetailsMain = Ti.UI.createView(
    width: Ti.UI.SIZE
    left : 0, bottom : 0,
    top: '100dp',
    backgroundColor : '#eee'
    layout : 'vertical'
  )

  characterDetails = new Card(
    padding : '20dp'
  )

  # Character Details elements
  characterName = Ti.UI.createLabel(
    text : character.name
    font:
      fontSize:'24sp'
      fontWeight: 'bold'
    height:'auto'
    left:'20dp', top: '10dp'
    color:'#000'
  )

  characterRealm = Ti.UI.createLabel(
    text : character.realm
    font:
      fontSize:'16sp'
    height:'auto'
    left:'20dp', top: 0
    color:'#757575'
  )

  characterInfo = Ti.UI.createLabel(
    text : 'Level ' + character.level + ', ' + character.race + ' ' + character.class
    font :
      fontSize : '16sp'
    left: '20dp', top : '20dp'
    color : '#000'
  )

  characterVyragosaDetails = Ti.UI.createLabel(
    text : detailsController.vyragosa_loot(character.feed)
    font :
      fontSize : '16sp'
    left: '20sp', top : '20dp'
    color : '#000'
  )

  # Character Feed
  characterFeedHeader = Ti.UI.createLabel(
    text : 'Feed'
    font :
      fontSize : '16sp'
      fontWeight : 'bold'
    color : '#9E9E9E'
    top : '7dp', left : '20dp'
  )

  ## Character Feed content wrapper
  characterFeed = detailsController.feed(character.feed)

  # Character Details elements
  characterDetails.add(characterName)
  characterDetails.add(characterRealm)
  characterDetails.add(characterInfo)
  characterDetails.add(characterVyragosaDetails)
  characterDetailsMain.add(characterDetails.create())

  # Character Feed
  characterDetailsMain.add(characterFeedHeader)
  characterDetailsMain.add(characterFeed.create())

  # Details Window
  characterDetailsScroll.add(characterImage)
  characterDetailsScroll.add(characterDetailsMain)
  detailsWin.add(characterDetailsScroll)


  detailsWin.addEventListener("open", () ->

    if Ti.Platform.osname = "android"
      if ! detailsWin.activity
        Ti.API.error "Can't access action bar on a lightweight window."
      else
        actionBar = detailsWin.activity.actionBar

        if actionBar
          actionBar.displayHomeAsUp = true
          actionBar.title = character.name
          actionBar.subtitle = character.realm
          actionBar.onHomeIconItemSelected = () ->
              detailsWin.close()

          detailsWin.activity.onCreateOptionsMenu = (e) ->
            menu = e.menu
            EditButton = menu.add(
              title: "Edit",
              # icon:  "item1.png",
              showAsAction: Ti.Android.SHOW_AS_ACTION_IF_ROOM
            )

            deleteButton = menu.add(
              title: "Delete",
              # icon:  "item1.png",
              showAsAction: Ti.Android.SHOW_AS_ACTION_IF_ROOM
            )

            deleteButton.addEventListener("click", (e) ->
              Ti.API.debug "I was clicked"
            )
  )

  detailsWin.open()
