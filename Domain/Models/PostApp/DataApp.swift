//
//  DataApp.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

// MARK: - PostApp
/// Modelo Response inicial
public struct DataApp {
    public var data: [DataUser]?
    public init(data: [DataUser]?) {
        self.data = data
    }
}
