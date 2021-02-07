//
//  DomainTransformable.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

typealias DataEntity = Codable & DomainTransformable

protocol DomainTransformable {
    associatedtype DomainModel
    func toDomain() throws -> DomainModel
}

extension Array where Element: DomainTransformable {
    func toDomain() throws -> [Element.DomainModel] {
        try map { try $0.toDomain() }
    }
}
