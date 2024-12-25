//
//  URLSessionNetworking.swift
//
//
//  Created by Murtaza Mehmood on 13/09/2024.
//

import Foundation


public class URLSessionNetworking: Networking, CancelableNetwork {

    private let sessionConfig: SessionConfigurable
    private var sessionDataTask: URLSessionDataTask?
    
    public init(sessionConfig: SessionConfigurable = DefaultURLSessionConfiguration()) {
        self.sessionConfig = sessionConfig
    }
    
    public func fetch(request: NetworkRequest, completion: @escaping NetworkingCompletion) {
        do {
            let request = try request.createURLRequest()
            let session = sessionConfig.createURLSession()
            sessionDataTask = session.dataTask(with: request) { data, response, error in
                
                if let requestError = error {
                    let nsError = requestError as NSError
                    switch nsError.code {
                        case -1009:
                        DispatchQueue.main.async { completion(.failure(NetworkError.noInternetConnection)) }
                        case -1005:
                        DispatchQueue.main.async { completion(.failure(NetworkError.connectionLost)) }
                    default:
                        DispatchQueue.main.async { completion(.failure(NetworkError.badResponse(requestError))) }
                    }
                    
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async { completion(.failure(NetworkError.unknownError)) }
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    DispatchQueue.main.async { completion(.failure(NetworkError.invalidResponse)) }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success((data,httpResponse)))
                }
            }
            
            sessionDataTask?.resume()
            
        } catch {
            DispatchQueue.main.async { completion(.failure(NetworkError.invalidURL)) }
        }
    }
    
    public func cancel() {
        sessionDataTask?.cancel()
        sessionDataTask = nil
        print("Networking request cancelled")
    }
}
