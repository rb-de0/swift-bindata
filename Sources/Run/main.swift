import Foundation

import Guaka
import SwiftBinData

let flags = [
    Flag(shortName: "o", longName: "output", type: String.self, description: "output dir path", required: false)
]

let command = Command(usage: "", flags: flags) { flags, args in
    
    let relativeSearchPath = args.count > 1 ? args[1] : "/assets"
    let destinationPath = flags.getString(name: "output") ?? FileManager.default.currentDirectoryPath
    
    do {
        try SwiftBinData(relativeSearchPath: relativeSearchPath, destinationPath: destinationPath).generate()
    } catch {
        print(error)
        exit(1)
    }
}

command.execute()
