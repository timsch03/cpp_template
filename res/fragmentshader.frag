#version 430 core

// Inputs from vertexshader
in vec4 vColor;

// Output color
out vec4 fragColor;

void main()
{
    fragColor = vColor;
}
