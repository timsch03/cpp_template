#version 430 core

// Outputs
out vec4 vColor;

void main()
{
    const vec4 vertices[] = vec4[]
    (
        vec4(0.5, -0.5, 0.0, 1.0),
        vec4(-0.5, -0.5, 0.0, 1.0),
        vec4(0.0, 0.5, 0.0, 1.0)
    );

    const vec4 colors[] = vec4[]
    (
        vec4(1.0f, 0.0f, 0.0f, 1.0f),
        vec4(0.0f, 1.0f, 0.0f, 1.0f),
        vec4(0.0f, 0.0f, 1.0f, 1.0f)
    );

    gl_Position = vertices[gl_VertexID];

    vColor = colors[gl_VertexID];
}
