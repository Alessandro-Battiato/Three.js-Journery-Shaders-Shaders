uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency; // uFrequency defined in the Script
uniform float uTime;

attribute vec3 position;
attribute vec2 uv;
attribute float aRandom;

varying vec2 vUv;
varying float vElevation;

// varying float vRandom;

/*
    float loremIpsum(float a, float b) {
        return a + b;
    }
*/

void main()
{    
    /*
        float result = loremIpsum(1.0, 2.0);

        float a = 1.0;
        float b = 2.0;
        float c = a / b;

        int foo = 123;
        int bar = - 1;
        float d = a * float(bar);

        bool fooBar = true;
        bool barFoo = false;

        vec2 testVec2 = vec2(1.0, - 2.0);

        testVec2.x = 1.0;
        testVec2.y = 2.0;

        testVec2 *= 2.0;

        vec3 testVec3 = vec3(0.0);
        vec3 anotherTestVec3 = vec3(1.0, 2.0, 3.0);
        anotherTestVec3.z = 4.0;

        vec3 purpleColor = vec3(0.0);
        purpleColor.r = 0.5;
        purpleColor.b = 1.0;

        vec2 anotherTestVec2 = vec2(1.0, 2.0);
        vec3 yetAnotherTestVec3 = vec3(anotherTestVec2, 1.0);

        vec4 testVec4 = vec4(1.0, 2.0, 3.0, 4.0);
        float swizzle = testVec4.w;
    */
    
    //gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.z += elevation;

    // modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1; // wobbly plane
    // modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1; // wobbly plane
    // modelPosition.z += aRandom * 0.1; spikey plane

    // modelPosition.y += uTime;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vUv = uv; // this value will be interpolated
    vElevation = elevation;

    // vRandom = aRandom;
}