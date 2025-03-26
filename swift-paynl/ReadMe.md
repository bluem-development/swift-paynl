# Read Me First (For Developers)

## To Do List

- DocC!!!!!! (with corresponding links to the docs)

- (Global)
Instead off
```swift
@available(macOS 12.0, iOS 15.0, *)
```
define platform versions in the Package file

- Printing should be only in DEBUG mode in cases like this:
```swift
if let json = prettyPrintedJSON(from : data) {
    print(json)
}
```
- Some of the types need to be public, like this one:
```swift
enum NetworkError: Error {
    case invalidResponse
    case invalidURL
    case decodingFailed(Error)
    case networkFailure(Error)
}
```

- We need a copyright method and a header for the source files (ask also Aviel)

- No hardcoded strings (either constants or config file), e.g. no:
```swift
        let url = URL(string: "https://rest.pay.nl/v2/authenticationtokens")!
```
- All public types should have Paynl namespace 
