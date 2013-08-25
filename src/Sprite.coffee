class Sprite extends THREE.Mesh
  constructor: (imgUrl, numSlides) ->
    spriteTexture = new THREE.ImageUtils.loadTexture(imgUrl)
    @spriteAnimator = new TextureAnimator(spriteTexture, numSlides, 1, numSlides, 75)
    spriteMaterial = new THREE.MeshBasicMaterial({map: spriteTexture, side:THREE.DoubleSide;})
    spriteGeometry = new THREE.PlaneGeometry(50, 50, 1, 1)
    THREE.Mesh.call(@, spriteGeometry, spriteMaterial)

window.Sprite = Sprite