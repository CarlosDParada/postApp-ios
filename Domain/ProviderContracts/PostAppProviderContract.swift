//
//  PostAppProviderContract.swift
//  Domain
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

public protocol PostAppProviderContract {
    /// Protocol para la obtencion de la lista de post
    /// - Parameter completion: Lista de post o error si existiese
    func getPostList(completion: @escaping ([DataUser]?, Error?) -> Void)
}
