//
//  PostApp.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public struct PostApp {
    public let name: String
    public let url: URL?
    public init(name: String, url: URL?) {
        self.name = name
        self.url = url
    }
}
