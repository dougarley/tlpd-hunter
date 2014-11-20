exports.feed = (feed) ->
  characterFeed = Ti.UI.createView(
    backgroundColor : '#fafafa'
    width: '100%', height: Ti.UI.SIZE
    top : '10dp'
    layout : 'vertical'
  )

  for item in feed
    characterFeedRow = Ti.UI.createView(
      height :'80dp'
      backgroundColor : '#FAFAFA'
    )

    characterFeedVyragosaKill = Ti.UI.createLabel(
      text: 'Vyragosa looted',
      font:
          fontSize:'16sp',
      height:'auto',
      left:'20dp',
      top:'20dp',
      color:'#000',
      touchEnabled:false
    )

    characterFeedVyragosaTimestamp = Ti.UI.createLabel(
      text: item + ' at 11:59PM EST',
      font:
          fontSize:'12sp',
      height:'auto',
      left:'20dp',
      bottom:'20dp',
      color:'#757575',
      touchEnabled:false
    )

    divider = Ti.UI.createView(
        height: '2dp',
        width: '100%',
        backgroundColor : '#eee',
        left: 0, bottom: 0
    )

    characterFeedRow.add(characterFeedVyragosaKill)
    characterFeedRow.add(characterFeedVyragosaTimestamp)
    characterFeedRow.add(divider)
    characterFeed.add(characterFeedRow)

  return characterFeed

# exports.actionBar = (window) ->
# if Ti.Platform.osname = "android"
#     if ! window.activity
#       Ti.API.error "Can't access action bar on a lightweight window."
#     else
#       actionBar = window.activity.actionBar

#       if actionBar
#         actionBar.displayHomeAsUp = true
#         actionBar.title = character.name
#         actionBar.subtitle = character.realm
#         actionBar.onHomeIconItemSelected = () ->
#             window.close()

#         window.activity.onCreateOptionsMenu = (e) ->
#           menu = e.menu
#           EditButton = menu.add(
#             title: "Edit",
#             # icon:  "item1.png",
#             showAsAction: Ti.Android.SHOW_AS_ACTION_IF_ROOM
#           )

#           deleteButton = menu.add(
#             title: "Delete",
#             # icon:  "item1.png",
#             showAsAction: Ti.Android.SHOW_AS_ACTION_IF_ROOM
#           )

#           deleteButton.addEventListener("click", (e) ->
#             Ti.API.debug "I was clicked"
#           )
