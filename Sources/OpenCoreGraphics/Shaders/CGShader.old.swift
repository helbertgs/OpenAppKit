// import Foundation
// @preconcurrency import OpenGLAD

// /// A shader object that specifies the shader program to use for rendering.
// @MainActor
// class CGShaderOld {

//     var code: String
//     var shader: GLuint

//     init(_ code: String, _ shaderType: ShaderType) {
//         print("\(Self.self).\(#function)")
//         self.code = code

//         self.shader = glad_glCreateShader(GLenum(shaderType.rawValue))
//         code.withCString { (pointer: UnsafePointer<Int8>) in
//             let shaderSource = UnsafePointer<GLchar>(pointer) // Conversão explícita para `GLchar`
//             var shaderSourcePointer: UnsafePointer<GLchar>? = shaderSource
//             glad_glShaderSource(shader, 1, &shaderSourcePointer, nil)
//         }

//         glad_glCompileShader(shader)

//         var success: GLint = 0;
//         var infoLog = [GLchar](repeating: 0, count: 512)
//         glad_glGetShaderiv(shader, GLenum(GL_COMPILE_STATUS), &success)
        
//         if (success == GL_FALSE)
//         {
//             glad_glGetShaderInfoLog(shader, 512, nil, &infoLog)
//             print("ERROR::SHADER::\(shaderType == .vertex ? "VERTEX" : "FRAGMENT")::COMPILATION_FAILED\n", infoLog)
//         }
//     }

//     deinit {
//         print("\(Self.self).\(#function)")
//         glad_glDeleteShader(shader)
//     }

//     static var vertex: CGShader {
//         return CGShader("""
//         #version 330 core
//         layout(location = 0) in vec3 aPos;
//         void main() {
//             gl_Position = vec4(aPos, 1.0);
//         }
//         """, .vertex)
//     }

//     // static var fragment: CGShader {
//     //     return CGShader("""
//     //     #version 330
//     //     uniform vec4 color;
//     //     out vec4 FragColor;
//     //     void main() {
//     //         FragColor = color;
//     //     }
//     //     """, .fragment)
//     // }

//      static var fragment: CGShader {
//         return CGShader("""
//         #version 330 core
//         out vec4 FragColor;
//         uniform vec3 backgroundColor;
//         uniform vec3 borderColor;
//         uniform float borderWidth;
//         uniform vec2 rectPosition;
//         uniform vec2 rectSize;

//         void main() {
//             // Calculate the relative position of the fragment within the rectangle
//             vec2 fragCoord = gl_FragCoord.xy;
//             vec2 rectTopLeft = rectPosition;
//             vec2 rectBottomRight = rectPosition + rectSize;

//             // Determine if the fragment is inside the border region
//             bool isBorder = fragCoord.x < rectTopLeft.x + borderWidth ||
//                             fragCoord.x > rectBottomRight.x - borderWidth ||
//                             fragCoord.y < rectTopLeft.y + borderWidth ||
//                             fragCoord.y > rectBottomRight.y - borderWidth;

//             // Output color based on whether it's a border or not
//             if (isBorder) {
//                 FragColor = vec4(borderColor, 1.0);
//             } else {
//                 FragColor = vec4(backgroundColor, 1.0);
//             }
//         }
//         """, .fragment)
//     }
// }

// extension CGShader {
//     enum ShaderType: RawRepresentable, Equatable, Hashable {

//         typealias RawValue = Int32
        
//         case vertex
//         case fragment
//         case none

//         var rawValue: Int32 {
//             switch self {
//             case .vertex:
//                 return GL_VERTEX_SHADER
//             case .fragment:
//                 return GL_FRAGMENT_SHADER
//             default: 
//                 return Int32()
//             }
//         }

//         init?(rawValue: Int32) {
//             switch rawValue {
//             case GL_VERTEX_SHADER:
//                 self = .vertex
//             case GL_FRAGMENT_SHADER:
//                 self = .fragment
//             default:
//                 self = .none
//             }
//         }
//     }
// }