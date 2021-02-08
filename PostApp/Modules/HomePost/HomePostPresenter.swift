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

    func fetchData() {
        getPostListUseCase.execute { [weak self] postList, errorData in
            if errorData !=  nil {
                self?.view?.showAlertMesssage(errorData?.localizedDescription ?? "🔥")
            } else {
                self?.postList = postList ?? []
                let viewModels = self?.generateListViewModels(with: postList ?? [])
                self?.view?.renderPostList(viewModels ?? [])
            }
        }
    }
    func userDidCancelSearch() {
        let viewModels = generateListViewModels(with: postList)
        view?.renderPostList(viewModels)
    }
}

private extension HomePostPresenter {
    func generateListViewModels(with posts: [DataUser]) -> [PostCellViewModel] {
        return posts.map { pst -> PostCellViewModel in
            return PostCellViewModel(dataUser: pst)
        }
    }
}
