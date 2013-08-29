class Sprite extends THREE.Mesh
  constructor: (imgUrl, numSlides, width, height, speed) ->
    spriteTexture = new THREE.ImageUtils.loadTexture(imgUrl)
    @spriteAnimator = new TextureAnimator(spriteTexture, numSlides, 1, numSlides, speed)
    spriteMaterial = new THREE.MeshBasicMaterial({map: spriteTexture, side:THREE.DoubleSide; transparent: true})
    spriteGeometry = new THREE.PlaneGeometry(width, height, 1, 1)
    THREE.Mesh.call(@, spriteGeometry, spriteMaterial)

window.Sprite = Sprite