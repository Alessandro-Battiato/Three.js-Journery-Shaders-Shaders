uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

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
    modelPosition.z += sin(modelPosition.x * 10.0) * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
}