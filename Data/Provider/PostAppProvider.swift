//
//  PostAppProvider.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain

public final class PostAppProvider {
    public init () {}
}

extension PostAppProvider: PostAppProviderContract {
    public func getPostList(completion: @escaping ([DataUser]?, Error?) -> Void) {
        PostAppService.post.execute { (result: Result<RawServerResponse<DataUserEntity>?, Error>) in
            if case let .success(response) = result,
               let entities = response?.data {
                let models = entities.compactMap { try? $0.toDomain() }
                completion(models, nil)
            } if case let .failure(failError) = result {
                 completion(nil, failError)
             } else {
                completion(nil, nil)
            }
        }
    }
}
