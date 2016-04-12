void main(void)
{
  vec4 texColor = texture2D(u_texture, v_tex_coord);
  float luminance = texColor.r * 0.299 + texColor.g * 0.587 + texColor.b * 0.114;
  gl_FragColor = vec4(luminance, luminance, luminance, 1.0);
}
