//
//  Networking.swift
//
//
//  Created by Murtaza Mehmood on 13/09/2024.
//

import Foundation

public typealias NetworkingCompletion = (Result<(data: Data,response: HTTPURLResponse),NetworkError>)->Void

public protocol Networking {
    func fetch(request: NetworkRequest,completion: @escaping NetworkingCompletion)
}

public protocol CancelableNetwork {
    func cancel()
}
