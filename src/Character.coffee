class Character
  constructor: (@type, { name } = {}) ->
    @name = name ?= "Please name me"
    @health = 100.0
    return @

  getName: () ->
    @name

  setName: (newName) ->
    @name = newName

  getHealth: () ->
    @health

  setHealth: (amount) ->
    @health = amount

  getType: () ->
    @type

  setType: (enumType) ->
    @type = enumType

window.Character = Character