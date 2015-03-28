class Character
  constructor: (character) ->
    Ti.API.debug "Creating new character"

    @name = character.name
    @realm = character.realm

    @validate = () ->
      Ti.API.debug "Validating Character Data"

    @findOne = () ->
      Ti.API.debug "Retrieving One Character"

    @findAll = () ->
      Ti.API.debug "Retrieving All Characters"

    @save = () ->
      Ti.API.debug "Saving Character Data"

    @delete = () ->
      Ti.API.debug "Deleting Character"
