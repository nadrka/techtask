import Foundation

enum ApiError: Error {
    case cannotDecodeOutput
    case noData
    case other
}

final class Client {
    func call<O: Decodable>(type: O.Type, endpoint: Endpoint, completion: @escaping (_ result: Result<O, Error>) -> Void ){
        let request = self.createUrlRequest(for: endpoint)

        let session = URLSession(configuration: ClientSettings.sessionConfig)

        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            do {
                let output = try JSONDecoder().decode(O.self, from: data)
                completion(.success(output))
            } catch let jsonError {
                print(jsonError)
                completion(.failure(ApiError.cannotDecodeOutput))

            }
        }

        dataTask.resume()
    }


    private func createUrlRequest(for endpoint: Endpoint) -> URLRequest {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = endpoint.method.rawValue

        return urlRequest
    }


}
