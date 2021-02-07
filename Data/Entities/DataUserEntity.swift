//
//  DataPostEntity.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain

struct DataUserEntity: DataEntity {
    let uidUser: String?
    let nameUser: String?
    let emailUser: String?
    let profilePicUser: String?
    var postUser: PostEntity?
    enum CodingKeys: String, CodingKey {
        case uidUser = "uid"
        case nameUser = "name"
        case emailUser = "email"
        case profilePicUser = "profile_pic"
        case postUser = "post"
    }

    func toDomain() throws -> DataUser {
        DataUser(uid:  self.uidUser,
                 name: self.nameUser,
                 email: self.emailUser,
                 profilePic: self.profilePicUser,
                 post: try? self.postUser?.toDomain())
    }
}
