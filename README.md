# swift-bindata

A simple tool that generates Swift byte array from any asset. Inspired by [go-bindata](https://github.com/jteeuwen/go-bindata). You can include assets in binary by using this tool.

[![apm](https://img.shields.io/apm/l/vim-mode.svg)]()
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## Installation

### Homebrew Tap

```bash
$ brew tap rb-de0/homebrew-tap
$ brew install swift-bindata
```

## Usage

swift-bindata converts all assets in the specified directory to binary and outputs it to one file.

```bash
$ swift-bindata assets/ -o dest/
```

The generated code is as follows.

```Swift
struct Assets {

    struct Index {
        static func makeData() -> [UInt8] {
            return [60, 33, 68, 79, 67, 84, 89, 80]
        }
    }
    
}
```

## Future Improvement

- Multiple asset directories support

## LICENSE

swift-bindata is available under the MIT license. See the LICENSE file for more info.


