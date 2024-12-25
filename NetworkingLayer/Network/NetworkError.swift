//
//  NetworkError.swift
//
//
//  Created by Murtaza Mehmood on 12/09/2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noInternetConnection
    case connectionLost
    case decodingError
    case badResponse(Error)
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return "No internet connection. Please check your network."
        case .connectionLost:
            return "The network connection was lost."
        case .badResponse(let error):
            return "Bad response: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        case .invalidURL:
            return "The provided URL is invalid."
        case .invalidResponse:
            return "The server response is invalid or cannot be processed."
        case .decodingError:
            print(self)
            return "Failed to decode the response data."
        }
    }
}
