//
//  SessionConfigurable.swift
//
//
//  Created by Murtaza Mehmood on 13/09/2024.
//

import Foundation

public protocol SessionConfigurable {
    func createURLSession() -> URLSession
}
