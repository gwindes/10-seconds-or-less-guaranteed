class Main
  constructor: () ->
    @scene = new THREE.Scene()
    @renderer = new THREE.WebGLRenderer( { antialias: true, alpha: false } )
    # @renderer.setClearColor(0xf3f3f3)
    # @renderer.setClearColor(0x3c3c3c)
    @renderer.setSize(window.innerWidth, window.innerHeight)

    @camera = new PerspectiveCamera( { width:window.innerWidth, height:window.innerHeight } )

    @clock = new THREE.Clock()
    @keyboard = new THREEx.KeyboardState();

    window.addEventListener( 'resize', @onWindowResize, false )

    $("#container").empty()
    $("#container").append(@renderer.domElement)

    return @

  render: () ->
    @scene.updateMatrixWorld()
    # @renderer.clear()
    @renderer.render(@scene, @camera)

  onWindowResize: () =>
    console.log "window resize"
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.setSize( window.innerWidth, window.innerHeight )

  update: () ->
    #To be overridden with scene requirements for updates (physics etc)

window.animate = () ->
  requestAnimationFrame(window.animate)
  window.app.update()
  window.app.render()


window.Main = Main
