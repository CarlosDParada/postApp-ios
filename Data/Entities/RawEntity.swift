//
//  RawEntity.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain

public struct RawEntity: DataEntity {
    public let data: DataApp
    
    func toDomain() throws -> DataApp {
        DataApp(data: self.data)
    }
}
