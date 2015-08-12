package;
import openfl.display.Shader;

/**
 * ...
 * @author MrCdK
 */
class VhsShader extends Shader {

	// from https://www.shadertoy.com/view/4dBGzK
	@fragment var fragment = [
'uniform float uMagnitude;',
'uniform float iGlobalTime;',
'',
'float rand(vec2 co)',
'{',
    'float a = 12.9898;',
    'float b = 78.233;',
    'float c = 43758.5453;',
    'float dt= dot(co.xy ,vec2(a,b));',
    'float sn= mod(dt,3.14);',
    'return fract(sin(sn) * c);',
'}',
'',
'void main(void)',
'{',
'	vec2 uv = ${Shader.vTexCoord};',
'	',
'	float magnitude = uMagnitude / 1000;',
'	',
'	',
'	// Set up offset',
	'vec2 offsetRedUV = uv;',
	'offsetRedUV.x = uv.x + rand(vec2(iGlobalTime*0.03,uv.y*0.42)) * 0.001;',
	'offsetRedUV.x += sin(rand(vec2(iGlobalTime*0.2, uv.y)))*magnitude;',
'	',
'	vec2 offsetGreenUV = uv;',
	'offsetGreenUV.x = uv.x + rand(vec2(iGlobalTime*0.004,uv.y*0.002)) * 0.004;',
	'offsetGreenUV.x += sin(iGlobalTime*9.0)*magnitude;',
'	',
'	vec2 offsetBlueUV = uv;',
	'offsetBlueUV.x = uv.y;',
	'offsetBlueUV.x += rand(vec2(cos(iGlobalTime*0.01),sin(uv.y)));',
'	',
'	// Load Texture',
	'float r = texture2D(${Shader.uSampler}, offsetRedUV).r;',
	'float g = texture2D(${Shader.uSampler}, offsetGreenUV).g;',
	'float b = texture2D(${Shader.uSampler}, uv).b;',
'	',
'	gl_FragColor = vec4(r,g,b,1.);',
'	',
'}',
'',

	];
	
	
	public function new() {
		super();
	}
	
}