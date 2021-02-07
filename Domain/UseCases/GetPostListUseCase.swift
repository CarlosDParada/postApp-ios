//
//  GetPostListUseCase.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public protocol GetPostListUseCaseContract {
    func execute(completion: @escaping ([DataUser]?) -> Void)
}

public final class GetPostListUseCase {
    private let provider: PostAppProviderContract
    public init(provider: PostAppProviderContract) {
        self.provider = provider
    }
}

extension GetPostListUseCase: GetPostListUseCaseContract {
    public func execute(completion: @escaping ([DataUser]?) -> Void) {
        provider.getPostList { list in
            DispatchQueue.main.async {
                completion(list)
            }
        }
    }
}
