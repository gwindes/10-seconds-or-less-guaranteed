class GameScene extends Main
  constructor: () ->
    super()

    @skybox = new SkyBox('http://i.imgur.com/ip8dEgY.jpg')
    # @scene.add(@skybox)

    @bgScene = new BackgroundScene('./images/bg.png')


    editorControls = new THREE.EditorControls(@camera, @renderer.domElement)
    editorControls.enabled = true

    light = new THREE.PointLight(0xffffff, 1, 100)
    light.position.y = 3
    light.position.x = 5
    @scene.add(light)

    @playerSprite = new Sprite('images/sprites/pelican.png', 4, 64, 64, 100)
    @playerSprite.lookAt(@camera.position)
    @scene.add(@playerSprite)

    # @platform = new Sprite('images/sprites/platform.png', 60, 100, 64, 75)
    # @platform.lookAt(@camera.position)
    # @platform.position.y -= 50
    # @scene.add(@platform)

    light = new ShadowedLight(pos={x:10, y:1, z:0})
    @scene.add(light)

    @camera.lookAt(@scene.position)

    @onWindowResize()

  onWindowResize: () ->
    super()

  update: () ->
    delta = @clock.getDelta()
    @playerSprite.spriteAnimator.update(delta)
    # @platform.spriteAnimator.update(delta)

    # val = if  > 0 else 
    # @playerSprite.position.y = Math.max 0.0, Math.sin(10 * @clock.getElapsedTime())
    # console.log "player pos.y = #{@playerSprite.position.y}"


    if(@keyboard.pressed("w"))
      console.log "Pressed Z"

  render: () ->
    @renderer.autoClear = false
    @renderer.clear()
    @renderer.render(@bgScene, @bgScene.camera)
    # @skybox.rotation.y += 0.01
    # @playerSprite.lookAt(@camera.position) 
    super()    

window.GameScene = GameScene