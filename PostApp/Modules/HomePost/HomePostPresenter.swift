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
    private var postListt: [DataUser] = []
    
    // MARK: - Initializer
    init(view: HomePostViewContract,
         getPostListUseCase: GetPostListUseCaseContract) {
        self.view = view
        self.getPostListUseCase = getPostListUseCase
    }
}
