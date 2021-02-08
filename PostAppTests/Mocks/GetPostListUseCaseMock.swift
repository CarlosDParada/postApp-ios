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

    func execute(completion: @escaping ([DataUser]?) -> Void) {
        completion(dataUser)
    }
}
