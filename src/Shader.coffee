class Shader
  constructor: () ->
    @uniforms = {
      time: { type: "f", value: 1.0},
      resolution: {type: "v2", value: new THREE.Vector2()}
    }
    material = new THREE.ShaderMaterial( {
      uniforms: @uniforms,
      # vertexShader: $("#vertexShader").textContent,
      # fragmentShader: $("#fragmentShader").textContent
      vertexShader: document.getElementById( 'vertexShader' ).textContent,
      fragmentShader: document.getElementById( 'fragmentShader' ).textContent
    } )
    material.transparent = true
    material.opacity = 0.5

    return material

window.Shader = Shader