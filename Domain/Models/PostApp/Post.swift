//
//  Post.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public struct Post {
    public var idPost: Int?
    public var datePost: String?
    public var picsPost: [String]?
    public init(idPost: Int?,
                datePost: String?,
                picsPost: [String]?) {
        self.idPost = idPost
        self.datePost = datePost
        self.picsPost = picsPost
    }
}
