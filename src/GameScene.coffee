class GameScene extends Main
  constructor: () ->
    super()

    @skybox = new SkyBox('http://i.imgur.com/ip8dEgY.jpg')
    @scene.add(@skybox)

    editorControls = new THREE.EditorControls(@camera, @renderer.domElement)
    editorControls.enabled = true

    light = new THREE.PointLight(0xffffff, 1, 100)
    light.position.y = 3
    light.position.x = 5
    @scene.add(light)

    @shader = new Shader()
    plane = new THREE.Mesh(new THREE.PlaneGeometry(1, 1), @shader)
    @scene.add(plane)

    light = new ShadowedLight(pos={x:10, y:1, z:0})
    @scene.add(light)

    @camera.lookAt(@scene.position)

    @composer = new THREE.EffectComposer (@renderer)
    @composer.addPass(new THREE.RenderPass(@scene, @camera))

    # effect = new THREE.ShaderPass(THREE.DotScreenShader)
    # effect.uniforms['scale'].value = 4
    # @composer.addPass(effect)

    @dotScreen = new THREE.ShaderPass( MyDotShader );
    @dotScreen.uniforms[ 'scale' ].value = 4;
    @dotScreen.renderToScreen = true
    @composer.addPass( @dotScreen );

    # effect = new THREE.ShaderPass(THREE.RGBShiftShader)
    # effect.uniforms['amount'].value = 0.0015
    # effect.renderToScreen = true
    # @composer.addPass(effect)

    @onWindowResize()

  onWindowResize: () ->
    @shader.uniforms.resolution.value.x = window.innerWidth;
    @shader.uniforms.resolution.value.y = window.innerHeight;
    super()

  render: () ->
    @shader.uniforms.time.value += 0.05;
    @dotScreen.uniforms['scale'].value += 0.1
    # console.log "dotscren scale = #{@dotScreen.uniforms['scale'].value} "
    # @skybox.rotation.y += 0.01
    super()
    @composer.render()
    

window.GameScene = GameScene