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
    func renderPostList(_ models: [PostCellViewModel])
    func showAlertMesssage(_ message: String)
}

protocol  HomePostPresenterContract {
    func fetchData()
    func userDidCancelSearch()
}
