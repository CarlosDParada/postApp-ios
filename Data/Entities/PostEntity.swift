//
//  PostEntity.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain

/// Entity para el detalle del post
struct PostEntity: DataEntity {
    let idPost: Int?
    let datePost: String?
    let picsPost: [String]?
    enum CodingKeys: String, CodingKey {
        case idPost = "id"
        case datePost = "date"
        case picsPost = "pics"
    }
    func toDomain() throws -> Post {
        Post(idPost: self.idPost,
             datePost: self.datePost,
             picsPost: self.picsPost)
    }
}
