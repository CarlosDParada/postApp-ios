//
//  PostAppProviderContract.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public protocol PostAppProviderContract {
    func getPostList(completion: @escaping ([DataUser]?) -> Void)
}
