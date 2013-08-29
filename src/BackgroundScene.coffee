class BackgroundScene extends THREE.Scene
  constructor: (imgUrl) ->
    backgroundTexture = new THREE.ImageUtils.loadTexture(imgUrl)
    plane = new THREE.PlaneGeometry(2, 2, 0)
    material = new THREE.MeshBasicMaterial({map: backgroundTexture})

    mesh = new THREE.Mesh(plane, material)
    mesh.material.depthTest = false
    mesh.material.depthWrite = false

    THREE.Scene.call(@)
    @camera = new THREE.Camera
    @.add(@camera)
    @.add(mesh)

    return @


window.BackgroundScene = BackgroundScene