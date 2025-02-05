import Foundation
import OpenSTB

/// An abstraction for data-reading tasks that eliminates the need to manage a raw memory buffer.
public class CGDataProvider {

    // MARK: - Getting Data from a Data Provider

    package var width: Int32 = 0
    package var height: Int32 = 0
    package var colorSpace: Int32 = 0

    /// Returns a copy of the provider’s data.
    public private(set) var data: Data?

    // MARK: - Instance Properties
    
    nonisolated(unsafe) 
    public private(set) var info: UnsafeMutablePointer<UInt8>?

    // MARK: - Creating Direct-Access Data Providers

    /// Creates a direct-access data provider that uses a URL to supply data.
    /// - Parameter url: A URL object for the URL that you want to read the data from.
    public init?(url: URL) {
        stbi_set_flip_vertically_on_load(1)
        guard let info = stbi_load(url.absoluteString, &width, &height, &colorSpace, 0) else {
            return nil
        }

        self.info = info
    }

    /// Creates a data provider that reads from a Data object.
    /// - Parameter data: The Data object to read from.
    public init?(data: Data) {
        guard data.count % MemoryLayout<UInt8>.size == 0 else {
            return nil
        }

        let array: [UInt8] = data.withUnsafeBytes { pointer in
            Array(UnsafeBufferPointer<UInt8>(start: pointer.baseAddress!.assumingMemoryBound(to: UInt8.self), count: data.count / MemoryLayout<UInt8>.size))
        }

        guard let info = stbi_load_from_memory(array, Int32(data.count), &width, &height, &colorSpace, Int32(0)) else {
            return nil
        }

        self.info = info
        self.data = data
    }

    deinit { 
        stbi_image_free(info)
    }
}