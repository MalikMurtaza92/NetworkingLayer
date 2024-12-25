//
//  NetworkRequest.swift
//
//
//  Created by Murtaza Mehmood on 12/09/2024.
//

import Foundation

public protocol NetworkRequest {
    var baseURL: URL { get }
    var endpoint: String? { get set }
    var httpMethod: HTTPMethod? { get set }
    var httpBody: Data? { get set }
    var queryParameter: [String: Any]? { get set }
    var fieldHeaders: [String: Any]? { get set }
}

extension NetworkRequest {
    public func createURLRequest() throws -> URLRequest {
        var url: URL = baseURL
        if let path = self.endpoint {
            if #available(iOS 16.0, *) {
                url = baseURL.appending(path: path)
            } else {
                url = baseURL.appendingPathComponent(path)
            }
        }
        if let parameters = self.queryParameter {
            var component = URLComponents(url: url, resolvingAgainstBaseURL: false)
            component?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            guard let urlComponent = component?.url else { throw NetworkError.invalidURL }
            url = urlComponent
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod?.rawValue ?? HTTPMethod.get.rawValue
        request.httpBody = httpBody
        request.allHTTPHeaderFields = createHttpHeader()
        return request
    }
    
    private func createHttpHeader() -> [String: String] {
        var header: [String: String] = [:]
        self.fieldHeaders?.forEach { header[$0.key] = "\($0.value)"}
        return header
    }
}
