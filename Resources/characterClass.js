// Generated by CoffeeScript 1.8.0
(function() {
  var Character;

  Character = (function() {
    function Character(character) {
      Ti.API.debug("Creating new character");
      this.name = character.name;
      this.realm = character.realm;
      this.validate = function() {
        return Ti.API.debug("Validating Character Data");
      };
      this.findOne = function() {
        return Ti.API.debug("Retrieving One Character");
      };
      this.findAll = function() {
        return Ti.API.debug("Retrieving All Characters");
      };
      this.save = function() {
        return Ti.API.debug("Saving Character Data");
      };
      this["delete"] = function() {
        return Ti.API.debug("Deleting Character");
      };
    }

    return Character;

  })();

}).call(this);
