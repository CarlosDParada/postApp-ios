//
//  DataUser.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public struct DataUser {
    let uid: String?
    let name: String?
    let email: String?
    let profilePic: String?
    let post: Post?
    public init(uid: String?,
                name: String?,
                email: String?,
                profilePic: String?,
                post: Post? ) {
        self.uid = uid
        self.name = name
        self.email = email
        self.profilePic = profilePic
        self.post = post
    }
}
