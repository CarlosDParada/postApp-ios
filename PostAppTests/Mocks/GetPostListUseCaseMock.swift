//
//  GetPostListUseCaseMock.swift
//  PostAppTests
//
//  Created by Carlos Parada on 7/02/21.
//

import Foundation
import Domain

final class GetPostListUseCaseMock: GetPostListUseCaseContract {
    var dataUser: [DataUser]?
    var error: Error?

    func execute(completion: @escaping ([DataUser]?) -> Void) {
        completion(dataUser)
    }
    func execute(completion: @escaping ([DataUser]?, Error?) -> Void) {
        completion(dataUser, nil)
    }
}
