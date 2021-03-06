// Generated by CoffeeScript 1.8.0
(function() {
  var Card;

  Card = require('cardClass').Card;

  exports.addWindow = function() {
    var addButton, addCard, addWin, charNameInput, charNameTitle, charRealmInput, charRealmTitle, hideLabel, showLabel;
    addWin = Ti.UI.createWindow({
      backgroundColor: "#EEE",
      layout: 'vertical'
    });
    addCard = new Card({
      top: 0,
      left: 0,
      padding: '20dp'
    });
    charNameTitle = Ti.UI.createLabel({
      left: '20dp',
      top: '0dp',
      text: 'Name',
      font: {
        fontSize: '14sp'
      },
      opacity: 0
    });
    charNameInput = Ti.UI.createTextField({
      left: '20dp',
      right: '20dp',
      hintText: 'Character name',
      width: Ti.UI.FILL
    });
    charRealmTitle = Ti.UI.createLabel({
      left: '20dp',
      top: '16dp',
      text: 'Realm',
      font: {
        fontSize: '14sp'
      },
      opacity: 0
    });
    charRealmInput = Ti.UI.createTextField({
      left: '20dp',
      right: '20dp',
      hintText: 'Character realm',
      width: Ti.UI.FILL
    });
    addButton = Ti.UI.createButton({
      left: '20dp',
      right: '20dp',
      top: '21dp',
      height: Ti.UI.SIZE,
      width: Ti.UI.FILL,
      title: 'Add Character'
    });
    addCard.add(charNameTitle);
    addCard.add(charNameInput);
    addCard.add(charRealmTitle);
    addCard.add(charRealmInput);
    addCard.add(addButton);
    addWin.add(addCard.create());
    charNameInput.addEventListener('change', function() {
      if (charNameInput.getValue().length > 0) {
        return showLabel(charNameTitle);
      } else {
        return hideLabel(charNameTitle);
      }
    });
    charRealmInput.addEventListener('change', function() {
      if (charRealmInput.getValue().length > 0) {
        return showLabel(charRealmTitle);
      } else {
        return hideLabel(charRealmTitle);
      }
    });
    showLabel = function(label) {
      var animation;
      animation = Titanium.UI.createAnimation({
        opacity: 1,
        duration: 100
      });
      return label.animate(animation);
    };
    hideLabel = function(label) {
      var animation;
      animation = Titanium.UI.createAnimation({
        opacity: 0,
        duration: 100
      });
      return label.animate(animation);
    };
    addButton.addEventListener('click', function(e) {
      var toast;
      toast = Ti.UI.createNotification({
        message: 'Character has been added.',
        duration: Ti.UI.NOTIFICATION_DURATION_SHORT
      });
      addWin.close();
      return toast.show();
    });
    addWin.addEventListener("open", function() {
      var actionBar;
      if (Ti.Platform.osname = "android") {
        if (!addWin.activity) {
          return Ti.API.error("Can't access action bar on a lightweight window.");
        } else {
          actionBar = addWin.activity.actionBar;
          if (actionBar) {
            actionBar.displayHomeAsUp = true;
            actionBar.title = "Add a New Character";
            return actionBar.onHomeIconItemSelected = function() {
              return addWin.close();
            };
          }
        }
      }
    });
    return addWin.open();
  };

}).call(this);
