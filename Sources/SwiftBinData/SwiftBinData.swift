import Foundation

public final class SwiftBinData {
    
    struct Consts {
        static let assetsClassName = "Assets"
    }
    
    let searchPath: String
    let destinationPath: String
    
    public init(relativeSearchPath: String, destinationPath: String) {
        self.searchPath = FileManager.default.currentDirectoryPath + "/" + relativeSearchPath
        self.destinationPath = destinationPath
    }
    
    public func generate() throws {
        
        var assetsCode = ""
        
        for content in try FileManager.default.contentsOfDirectory(atPath: searchPath) {
            
            let assetPath = searchPath + "/" + content
            let data = try Data(contentsOf: URL(fileURLWithPath: assetPath))

            guard let assetName = content.components(separatedBy: ".").first?
                .components(separatedBy: "-")
                .reduce("", { $0 + $1.capitalizedFirstLetter() }) else {
                continue
            }
            
            let assetCode = codeFor(assetName: assetName, data: data)
            assetsCode += assetCode
        }
        
        let code = codeForContainer(assetsCode: assetsCode)
        let assetsCodePath = destinationPath + "/" + Consts.assetsClassName + ".swift"
        try code.write(to: URL(fileURLWithPath: assetsCodePath), atomically: true, encoding: .utf8)
    }
    
    private func adjustedAssetName(fromRaw raw: String) -> String {
        
        let compornent = raw.components(separatedBy: "-")
        return compornent.reduce("") { $0 + $1.capitalizedFirstLetter() }
    }
    
    private func codeForContainer(assetsCode: String) -> String {
        
        let code =
        "struct \(Consts.assetsClassName) {\n\n" +
        "\(assetsCode)" +
        "}\n"
        
        return code
    }
    
    private func codeFor(assetName: String, data: Data) -> String {
        
        let bytes = [UInt8](data)
        let bytesLiteral = "[" + bytes.map { String($0) }.joined(separator: ", ") + "]"
        
        let code =
        "    struct \(assetName) {\n" +
        "        static func makeData() -> [UInt8] {\n" +
        "            return \(bytesLiteral)\n" +
        "        }\n" +
        "    }\n\n"
        
        return code
    }
}
