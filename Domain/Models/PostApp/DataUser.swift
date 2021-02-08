//
//  DataUser.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

/// Model de la informacion de cada post
public struct DataUser {
    public let uidUser: String?
    public let name: String?
    public let email: String?
    public let profilePic: String?
    public let post: Post?
    public init(uidUser: String?,
                name: String?,
                email: String?,
                profilePic: String?,
                post: Post? ) {
        self.uidUser = uidUser
        self.name = name
        self.email = email
        self.profilePic = profilePic
        self.post = post
    }
}
