Card = require('cardClass').Card

exports.addWindow = () ->
  addWin = Ti.UI.createWindow
    backgroundColor : "#EEE"
    layout : 'vertical'

  addCard = new Card(
    top : 0, left: 0,
    padding : '20dp'
  )

  charNameTitle = Ti.UI.createLabel(
    left : '20dp', top : '0dp',
    text : 'Name'
    font :
      fontSize : '14sp'
    opacity : 0
  )

  charNameInput = Ti.UI.createTextField(
    left : '20dp', right : '20dp'
    hintText : 'Character name'
    width : Ti.UI.FILL
  )

  charRealmTitle = Ti.UI.createLabel(
    left : '20dp', top : '16dp',
    text : 'Realm'
    font :
      fontSize : '14sp'
    opacity : 0
  )

  charRealmInput = Ti.UI.createTextField(
    left : '20dp', right : '20dp',
    hintText : 'Character realm'
    width : Ti.UI.FILL
  )

  addButton = Ti.UI.createButton(
    left : '20dp', right : '20dp', top : '21dp'
    height : Ti.UI.SIZE, width : Ti.UI.FILL
    title : 'Add Character'
  )

  addCard.add(charNameTitle)
  addCard.add(charNameInput)
  addCard.add(charRealmTitle)
  addCard.add(charRealmInput)
  addCard.add(addButton)

  addWin.add(addCard.create())

  # Show/Hide Label on Name Input
  charNameInput.addEventListener('change', ()->
    if charNameInput.getValue().length > 0
      showLabel(charNameTitle)
    else
      hideLabel(charNameTitle)
  )

  # Show/Hide Label on Realm Input
  charRealmInput.addEventListener('change', ()->
    if charRealmInput.getValue().length > 0
      showLabel(charRealmTitle)
    else
      hideLabel(charRealmTitle)
  )

  showLabel = (label) ->
    animation = Titanium.UI.createAnimation(
      opacity : 1
      duration : 100
    )
    label.animate(animation);

  hideLabel = (label) ->
    animation = Titanium.UI.createAnimation(
      opacity : 0
      duration : 100
    )
    label.animate(animation);

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
