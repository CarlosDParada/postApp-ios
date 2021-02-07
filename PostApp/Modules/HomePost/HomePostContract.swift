//
//  HomePostContract.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain

protocol HomePostContract {
    typealias View = HomePostViewContract
    typealias Presenter = HomePostPresenterContract
}

protocol HomePostViewContract: AnyObject {
    func renderPokemonList(_ models: [PostCellViewModel])
}

protocol  HomePostPresenterContract {
    func fetchData()
    func searchPost(with name: String)
    func userDidCancelSearch()
}
