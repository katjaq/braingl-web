attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uMVMatrixInvert;
uniform mat4 uPMatrix;
uniform vec3 uLightLocation;

varying vec4 vPosition;
varying vec3 vLightPos;
varying vec3 vNormal;
varying vec3 vColor;
uniform float uAlpha;
varying vec2 vTextureCoord;

varying vec4 vViewDir;
varying vec4 vLightDir;

void main(void) 
{
	vPosition = uPMatrix * uMVMatrix * vec4( aVertexPosition, 1.0);
	vNormal = normalize(aVertexNormal);
	//vColor = aTextureCoord;
	vTextureCoord = aTextureCoord;
	
	vViewDir = uMVMatrixInvert * vec4( 0.0, 0.0, 1.0, 0.0);
    vViewDir.w = 1.0;
    
    vec4 lightPos = vec4( 0.0, 0.0, 1.0, 0.0 );
    vLightDir.xyz = normalize( ( uMVMatrixInvert * lightPos ).xyz );
	
	gl_Position = vPosition;
}