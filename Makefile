build:
	swift build -c release -Xswiftc -static-stdlib

debug:
	swift build; .build/debug/Run assets/ -o dest/

