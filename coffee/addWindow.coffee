Card = require('cardClass').Card

exports.addWindow = () ->
  addWin = Ti.UI.createWindow
    backgroundColor : "#EEE"
    layout : 'vertical'

  addCard = new Card(
    top : 0, left: 0,
    padding : '20dp'
  )

  charNameInput = Ti.UI.createTextField(
    left : '20dp', right : '20dp'
    hintText : 'Character Name'
    width : Ti.UI.FILL
  )

  charRealmInput = Ti.UI.createTextField(
    left : '20dp', right : '20dp', top : '7dp'
    hintText : 'Character Realm'
    width : Ti.UI.FILL
  )

  addButton = Ti.UI.createButton(
    left : '20dp', right : '20dp', top : '7dp'
    height : Ti.UI.SIZE, width : Ti.UI.FILL
    title : 'Add Character'
  )

  addCard.add(charNameInput)
  addCard.add(charRealmInput)
  addCard.add(addButton)
  addWin.add(addCard.create())

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
