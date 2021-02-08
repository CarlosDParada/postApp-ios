//
//  RawServerResponse.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

/// Reponse principal
public struct RawServerResponse<T: Codable>: Codable {
    public let data: [T]
}
