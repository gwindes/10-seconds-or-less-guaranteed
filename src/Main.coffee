class Main
  constructor: () ->
    @scene = new THREE.Scene()
    @renderer = new THREE.WebGLRenderer( { antialias: true, alpha: false } )
    @renderer.setClearColor(0xf3f3f3)
    @renderer.setSize(window.innerWidth, window.innerHeight)

    @camera = new PerspectiveCamera( { width:window.innerWidth, height:window.innerHeight } )

    window.addEventListener( 'resize', @onWindowResize, false )

    $("#container").empty()
    $("#container").append(@renderer.domElement)

    return @

  render: () ->
    @scene.updateMatrixWorld()
    @renderer.clear()
    @renderer.render(@scene, @camera)

  onWindowResize: () =>
    console.log "window resize"
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.setSize( window.innerWidth, window.innerHeight )

window.animate = () ->
  requestAnimationFrame(window.animate)
  window.app.render()


window.Main = Main
