import Foundation
@preconcurrency import OpenGLAD

@MainActor
public class CGShader {

    public private(set) var program: UInt32

    public convenience init() {
        let vs = """
        #version 330 core
        layout(location = 0) in vec3 aPos;
        void main() {
            gl_Position = vec4(aPos, 1.0);
        }
        """

        let fs = """
        #version 330 core
        out vec4 FragColor;
        uniform vec3 backgroundColor;
        uniform vec3 borderColor;
        uniform float borderWidth;
        uniform vec2 rectPosition;
        uniform vec2 rectSize;

        void main() {
            // Calculate the relative position of the fragment within the rectangle
            vec2 fragCoord = gl_FragCoord.xy;
            vec2 rectTopLeft = rectPosition;
            vec2 rectBottomRight = rectPosition + rectSize;

            // Determine if the fragment is inside the border region
            bool isBorder = fragCoord.x < rectTopLeft.x + borderWidth ||
                            fragCoord.x > rectBottomRight.x - borderWidth ||
                            fragCoord.y < rectTopLeft.y + borderWidth ||
                            fragCoord.y > rectBottomRight.y - borderWidth;

            // Output color based on whether it's a border or not
            if (isBorder) {
                FragColor = vec4(borderColor, 1.0);
            } else {
                FragColor = vec4(backgroundColor, 1.0);
            }
        }
        """

        self.init(vs, fs)
    }

    public init(_ vs: String, _ fs: String, _ gs: String? = nil) {
        program = glad_glCreateProgram()
        let vertex = compile(.vertex(vs))
        let fragment = compile(.fragment(fs))
        let geometry = compile(.geometry(gs))

        attach(vertex)
        attach(fragment)
        attach(geometry)

        link()

        flush(vertex)
        flush(fragment)
        flush(geometry)
    }

    deinit {
        print("\(Self.self).\(#function)")
        glad_glDeleteProgram(program)
    }

    private func attach(_ shader: UInt32?) {
        print("\(Self.self).\(#function)")
        if let shader {
            glad_glAttachShader(program, shader)
        }
    }
    
    private func flush(_ shader: UInt32?) {
        print("\(Self.self).\(#function)")
        if let shader {
            glad_glDetachShader(program, shader)
        }
    }
    
    private func link() {
        print("\(Self.self).\(#function)")
        glad_glLinkProgram(program)
        
        var success: GLint = 0
        var infoLog = [GLchar](repeating: 0, count: 512)
        glad_glGetProgramiv(program, GLenum(GL_LINK_STATUS), &success)
        
        if success == GL_FALSE {
            glad_glGetProgramInfoLog(program, 512, nil, &infoLog)
            print("ERROR::SHADER::PROGRAM::LINKING_FAILED\n", infoLog)
        }
    }
    
    private func compile(_ s: ShaderSource) -> UInt32? {
        guard let sourceCode = s.source else {
            return nil
        }

        let shader = glad_glCreateShader(GLenum(s.kind))
        sourceCode.withCString { (pointer: UnsafePointer<Int8>) in
            let shaderSource = UnsafePointer<GLchar>(pointer)
            var shaderSourcePointer: UnsafePointer<GLchar>? = shaderSource
            glad_glShaderSource(shader, 1, &shaderSourcePointer, nil)
            glad_glCompileShader(shader)
        }

        return shader
    }

    private func debug(_ shader: UInt32?) {
        guard let shader = shader else {
            return
        }

        var success: GLint = 0;
        var infoLog = [GLchar](repeating: 0, count: 512)
        glad_glGetShaderiv(shader, GLenum(GL_COMPILE_STATUS), &success)
        
        if (success == GL_FALSE)
        {
            glad_glGetShaderInfoLog(shader, 512, nil, &infoLog)
            print(String(cString: infoLog, encoding: .utf8) ?? "")
        }
    }
    
    public func use() {
        print("\(Self.self).\(#function)")
        glad_glUseProgram(program)
    }

    public func setUniform(_ name: String, _ value: Int) {
        print("\(Self.self).\(#function)")
        glad_glUniform1i(glad_glGetUniformLocation(program, name), GLint(value))
    }
    
    public func setUniform(_ name: String, _ value: Float) {
        print("\(Self.self).\(#function)")
        glad_glUniform1f(glad_glGetUniformLocation(program, name), value)
    }
    
    public func setUniform(_ name: String, _ value: CGColor) {
        print("\(Self.self).\(#function)")
        glad_glUniform3f(glad_glGetUniformLocation(program, name), GLfloat(value.red), GLfloat(value.green), GLfloat(value.blue))
    }
    
    public func setUniform(_ name: String, _ value: [[Float]]) {
        print("\(Self.self).\(#function)")
        var v = value[0][0]
        glad_glUniformMatrix4fv(glad_glGetUniformLocation(program, name), 1, GLboolean(GL_FALSE), &v)
    }

    public func setUniform(_ name: String, _ value: CGSize) {
        print("\(Self.self).\(#function)")
        glad_glUniform2f(glad_glGetUniformLocation(program, name), GLfloat(value.width), GLfloat(value.height))
    }
    
    public func setUniform(_ name: String, _ value: CGPoint) {
        print("\(Self.self).\(#function)")
        glad_glUniform2f(glad_glGetUniformLocation(program, name), GLfloat(value.x), GLfloat(value.y))
    }
    
    public func setUniform(_ name: String, _ value: CGRect) {
        print("\(Self.self).\(#function)")
        glad_glUniform4f(glad_glGetUniformLocation(program, name), GLfloat(value.origin.x), GLfloat(value.origin.y), GLfloat(value.size.width), GLfloat(value.size.height))
    }
    
    public func setUniform(_ name: String, _ value: CGImage) {
        print("\(Self.self).\(#function)")
        glad_glUniform1i(glad_glGetUniformLocation(program, name), GLint(value.texture))
    }
}

extension CGShader {
    enum ShaderSource {
        case vertex(String)
        case fragment(String)
        case geometry(String?)

        var source: String? {
            return switch self {
                case let .vertex(code): code
                case let .fragment(code): code
                case let .geometry(code): code
            }
        }

        var kind: Int32 {
            return switch self {
                case .vertex: GL_VERTEX_SHADER
                case .fragment: GL_FRAGMENT_SHADER
                case .geometry:  GL_GEOMETRY_SHADER
            }
        }

        var description: String {
            return switch self {
                case .vertex: "Vertex"
                case .fragment: "Fragment"
                case .geometry:  "Geometry"
            }
        }
    }
}