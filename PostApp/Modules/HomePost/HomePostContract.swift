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

/// Contract for View and Contract
protocol HomePostViewContract: AnyObject {
    func renderPostList(_ models: [PostCellViewModel])
    func showAlertMesssage(_ message: String)
}

/// Contract for presenter and contract
protocol  HomePostPresenterContract {
    func fetchData()
    func userDidCancelSearch()
}
