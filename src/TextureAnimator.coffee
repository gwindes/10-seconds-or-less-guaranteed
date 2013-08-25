##################
# Original file from SRC:
# Src: stemkoski.github.io/Three.js/Texture-Animation.html
# All rights belong to stemkoski
# 
# I converted it to Coffeescript
##################


class TextureAnimator
  constructor: (@texture, tilesHorz, tilesVert, numTiles, tileDispDuration) ->

    # note: texture passed by reference, will be updated by the update function.
      
    @tilesHorizontal = tilesHorz
    @tilesVertical = tilesVert
    # how many images does this spritesheet contain?
    #  usually equals tilesHoriz * tilesVert, but not necessarily,
    #  if there at blank tiles at the bottom of the spritesheet. 
    @numberOfTiles = numTiles
    @texture.wrapS = @texture.wrapT = THREE.RepeatWrapping 
    @texture.repeat.set( 1 / @tilesHorizontal, 1 / @tilesVertical )

    # how long should each image be displayed?
    @tileDisplayDuration = tileDispDuration

    # how long has the current image been displayed?
    @currentDisplayTime = 0

    # which image is currently being displayed?
    @currentTile = 0

    return @
      
  update: ( milliSec ) ->
    milliSec *= 1000
    # console.log "milliSec = #{milliSec}"
  
    @currentDisplayTime += milliSec
    while (@currentDisplayTime > @tileDisplayDuration)
    
      @currentDisplayTime -= @tileDisplayDuration
      @currentTile++
      if (@currentTile == @numberOfTiles)
        @currentTile = 0
      currentColumn = @currentTile % @tilesHorizontal
      @texture.offset.x = currentColumn / @tilesHorizontal
      currentRow = Math.floor( @currentTile / @tilesHorizontal )
      @texture.offset.y = currentRow / @tilesVertical

window.TextureAnimator = TextureAnimator