import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

struct Endpoint {
    let method: Method
    let path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        guard let url = URL(string: ClientSettings.baseURLString + path)else {
            preconditionFailure("Invalid URL")
        }
        return url
    }
}


