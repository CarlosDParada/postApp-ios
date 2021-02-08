//
//  PostProviderMock.swift
//  DomainTests
//
//  Created by Carlos Parada on 7/02/21.
//

import Foundation
import Domain

final class PostProviderMock: PostAppProviderContract {
    var dataUser: DataUser?

    func getPostList(completion: @escaping ([DataUser]?) -> Void) {
        if let dataUser = dataUser {
            completion([dataUser, dataUser])
        } else {
            completion(nil)
        }
    }
}
