class GameScene extends Main
  constructor: () ->
    super()

    

    @skybox = new SkyBox('http://i.imgur.com/ip8dEgY.jpg')
    # @scene.add(@skybox)

    editorControls = new THREE.EditorControls(@camera, @renderer.domElement)
    editorControls.enabled = true

    light = new THREE.PointLight(0xffffff, 1, 100)
    light.position.y = 3
    light.position.x = 5
    @scene.add(light)

    @sprite = new Sprite('images/sprites/player.png', 3)

    @sprite.lookAt(@camera.position)
    @scene.add(@sprite)

    light = new ShadowedLight(pos={x:10, y:1, z:0})
    @scene.add(light)

    @camera.lookAt(@scene.position)

    @onWindowResize()

  onWindowResize: () ->
    super()

  update: () ->
    delta = @clock.getDelta()
    @sprite.spriteAnimator.update(delta)

    if(@keyboard.pressed("w"))
      console.log "Pressed Z"

  render: () ->
    # @skybox.rotation.y += 0.01
    # @sprite.lookAt(@camera.position) 
    super()    

window.GameScene = GameScene