class SkyBox extends THREE.Mesh
  constructor: (imgUrl) ->
    skyBoxGeometry = new THREE.CubeGeometry(4, 4, 4)
    console.log "imgurl = #{imgUrl}"
    skyBoxMaterial = new THREE.MeshBasicMaterial( {map: THREE.ImageUtils.loadTexture(imgUrl)} ) #, side:THREE.DoubleSide
    # material = new THREE.MeshPhongMaterial({color: 0xff0000, specular:0xf3f3f3, shininess: 100})
    material = new THREE.MeshBasicMaterial({color: 0xF0cf0f})
    THREE.Mesh.call(@, skyBoxGeometry, skyBoxMaterial)

window.SkyBox = SkyBox
