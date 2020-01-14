#version 300 es
precision highp float;
in vec2 a_vertPosition;
in vec2 a_texCoord;
uniform float u_pointSize;
uniform float u_deltaTime;
uniform float u_flame_speed;
uniform float u_noise2_move_speed;
uniform float noise3_distance_from_noise2;

out vec2 v_texCoord;
out vec2 v_uv_anim;
out vec2 v_uv_anim_2;
out vec2 v_uv_anim_3;

void main()
{
  gl_PointSize = u_pointSize;
  
  // "technically" should be using a_texCoord, but a_vertPosition gives me more interesting results!
  v_uv_anim.x = (a_vertPosition.x + (u_deltaTime * u_flame_speed) * 0.025) * 0.25 + 0.65;
  v_uv_anim.y = (a_vertPosition.y - (u_deltaTime * u_flame_speed)) * 0.25;

  // used to be modulated by a second independent speed
  v_uv_anim_2.x = (a_vertPosition.x - (u_deltaTime * u_flame_speed * 0.125)) * 0.25 + 0.65;
  v_uv_anim_2.y = (a_vertPosition.y - (u_deltaTime * u_flame_speed)) * 0.25 + 0.65;

  // used to be modulated by a third independent speed
  v_uv_anim_3.x = (a_vertPosition.x + (u_deltaTime * (u_flame_speed + noise3_distance_from_noise2) * 0.125)) * 0.25 + 0.65;
  v_uv_anim_3.y = (a_vertPosition.y - (u_deltaTime * (u_flame_speed + noise3_distance_from_noise2))) * 0.25 + 0.65;

  v_texCoord = a_texCoord;

  gl_Position = vec4(a_vertPosition, 0.0, 1.0);
}