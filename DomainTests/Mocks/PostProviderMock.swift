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
    var errorData: Error?

    func getPostList(completion: @escaping ([DataUser]?, Error?) -> Void) {
        if let dataUser = dataUser {
            completion([dataUser, dataUser], nil)
        } else {
            completion(nil, errorData)
        }
    }
}
