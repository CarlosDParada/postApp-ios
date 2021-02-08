//
//  GetPostListUseCase.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public protocol GetPostListUseCaseContract {
    /// Protocol de la ejecucion del GetPostList
    /// - Parameter completion: Array de Post o Error
    func execute(completion: @escaping ([DataUser]?, Error?) -> Void)
}

/// Class GetPostListUseCase
public final class GetPostListUseCase {
    private let provider: PostAppProviderContract
    public init(provider: PostAppProviderContract) {
        self.provider = provider
    }
}

extension GetPostListUseCase: GetPostListUseCaseContract {
    /// Emplementacion del protocolo en la class
    /// - Parameter completion: Array de Post o Error
    public func execute(completion: @escaping ([DataUser]?, Error?) -> Void) {
        provider.getPostList { (list, message) in
            DispatchQueue.main.async {
                completion(list, message)
            }
        }
    }
}
