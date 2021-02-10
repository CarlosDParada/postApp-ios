//
//  HomePostPresenter.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain
import UIKit

final class HomePostPresenter {
    private let getPostListUseCase: GetPostListUseCaseContract
    private weak var view: HomePostViewContract?
    private var postList: [DataUser] = []
    // MARK: - Initializer
    init(view: HomePostViewContract,
         getPostListUseCase: GetPostListUseCaseContract) {
        self.view = view
        self.getPostListUseCase = getPostListUseCase
    }
}

extension HomePostPresenter: HomePostPresenterContract {

    /// Get Post list
    func fetchData() {
        getPostListUseCase.execute { [weak self] postList, errorData in
            if errorData !=  nil {
                self?.view?.showAlertMesssage(errorData?.localizedDescription ?? "🔥")
            }
            if postList?.count != 0 && postList != nil {
                self?.postList = postList ?? []
                let viewModels = self?.generateListViewModels(with: postList ?? [])
                self?.view?.renderPostList(viewModels ?? [])
            }
        }
    }
    /// Cancel load - This has not implementation
    func userDidCancelSearch() {
        let viewModels = generateListViewModels(with: postList)
        view?.renderPostList(viewModels)
    }
}

private extension HomePostPresenter {
    /// Generate list view model for cell view model
    /// - Parameter posts: arary post
    /// - Returns: array cell model post
    func generateListViewModels(with posts: [DataUser]) -> [PostCellViewModel] {
        return posts.map { pst -> PostCellViewModel in
            return PostCellViewModel(dataUser: pst)
        }
    }
}
