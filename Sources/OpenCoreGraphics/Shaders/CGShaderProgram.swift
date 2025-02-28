// import Foundation
// @preconcurrency import OpenGLAD

// @MainActor
// public class CGShaderProgram {
    
//     nonisolated(unsafe) var program: GLuint = 0
//     var shaders: [CGShader] = []

//     public init() {
//         print("\(Self.self).\(#function)")
//         self.program = glad_glCreateProgram()

//         self.attach(.vertex)
//         self.attach(.fragment)
//         self.link()
//         self.flush()
//     }

//     deinit {
//         print("\(Self.self).\(#function)")
//         glad_glDeleteProgram(program)
//     }
    
//     func attach(_ cgShader: CGShader) {
//         print("\(Self.self).\(#function)")
//         self.shaders.append(cgShader)
//         glad_glAttachShader(program, cgShader.shader)
//     }
    
//     func link() {
//         print("\(Self.self).\(#function)")
//         glad_glLinkProgram(program)
        
//         var success: GLint = 0
//         var infoLog = [GLchar](repeating: 0, count: 512)
//         glad_glGetProgramiv(program, GLenum(GL_LINK_STATUS), &success)
        
//         if success == GL_FALSE {
//             glad_glGetProgramInfoLog(program, 512, nil, &infoLog)
//             print("ERROR::SHADER::PROGRAM::LINKING_FAILED\n", infoLog)
//         }
//     }

//     func flush() {
//         print("\(Self.self).\(#function)")
//         for cgShader in shaders {
//             glad_glDetachShader(program, cgShader.shader)
//         }

//         shaders.removeAll()
//     }
    
//     public func use() {
//         print("\(Self.self).\(#function)")
//         glad_glUseProgram(program)
//     }

//     public func setUniform(_ name: String, _ value: Int) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform1i(glad_glGetUniformLocation(program, name), GLint(value))
//     }
    
//     public func setUniform(_ name: String, _ value: Float) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform1f(glad_glGetUniformLocation(program, name), value)
//     }
    
//     public func setUniform(_ name: String, _ value: CGColor) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform3f(glad_glGetUniformLocation(program, name), GLfloat(value.red), GLfloat(value.green), GLfloat(value.blue))
//     }
    
//     public func setUniform(_ name: String, _ value: [[Float]]) {
//         print("\(Self.self).\(#function)")
//         var v = value[0][0]
//         glad_glUniformMatrix4fv(glad_glGetUniformLocation(program, name), 1, GLboolean(GL_FALSE), &v)
//     }

//     public func setUniform(_ name: String, _ value: CGSize) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform2f(glad_glGetUniformLocation(program, name), GLfloat(value.width), GLfloat(value.height))
//     }
    
//     public func setUniform(_ name: String, _ value: CGPoint) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform2f(glad_glGetUniformLocation(program, name), GLfloat(value.x), GLfloat(value.y))
//     }
    
//     public func setUniform(_ name: String, _ value: CGRect) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform4f(glad_glGetUniformLocation(program, name), GLfloat(value.origin.x), GLfloat(value.origin.y), GLfloat(value.size.width), GLfloat(value.size.height))
//     }
    
//     public func setUniform(_ name: String, _ value: CGImage) {
//         print("\(Self.self).\(#function)")
//         glad_glUniform1i(glad_glGetUniformLocation(program, name), GLint(value.texture))
//     }
// }