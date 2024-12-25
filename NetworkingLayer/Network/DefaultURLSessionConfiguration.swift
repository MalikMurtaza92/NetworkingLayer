//
//  DefaultURLSessionConfiguration.swift
//
//
//  Created by Murtaza Mehmood on 13/09/2024.
//

import Foundation

public class DefaultURLSessionConfiguration: SessionConfigurable {
    
    public init(){}
    public func createURLSession() -> URLSession {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }
}
