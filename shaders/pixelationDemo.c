#define pixSize iResolution.xy
void main(void)
{
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  float dist = 0.9 * sin(abs(iChannelTime[0]));
  vec2 mouseUV = iMouse.xy / iResolution.xy;
  dist = iMouse.y * 0.1;
  vec2 divs = vec2(pixSize * mouseUV.xy);
  uv = floor(uv * divs)/ divs;
  gl_FragColor = texture2D(iChannel0, uv);
}