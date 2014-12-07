Card = require('cardClass').Card

exports.addWindow = () ->
  addWin = Ti.UI.createWindow
    backgroundColor : "#EEE"

  addCard = new Card(
    top : 0, left: 0,
    padding : '20dp'
  )

  addButton = Ti.UI.createButton(
    left : '20dp', right : '20dp',
    height : Ti.UI.SIZE, width : Ti.UI.FILL
    title : 'Add Character'
  )

  addWin.add(addButton)

  addButton.addEventListener('click', (e) ->
    toast = Ti.UI.createNotification(
      message : 'Character has been added.'
      duration : Ti.UI.NOTIFICATION_DURATION_SHORT
    )

    addWin.close()

    toast.show();
  )

  addWin.addEventListener("open", () ->
    if Ti.Platform.osname = "android"
      if ! addWin.activity
        Ti.API.error "Can't access action bar on a lightweight window."
      else
        actionBar = addWin.activity.actionBar

        if actionBar
          actionBar.displayHomeAsUp = true
          actionBar.title = "Add a New Character"
          actionBar.onHomeIconItemSelected = () ->
              addWin.close()
  )

  addWin.open()
