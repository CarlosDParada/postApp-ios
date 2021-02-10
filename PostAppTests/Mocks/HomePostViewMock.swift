//
//  HomePostViewMock.swift
//  PostAppTests
//
//  Created by Carlos Parada on 7/02/21.
//

@testable import PostApp
import Foundation

final class HomePostViewMock: HomePostViewContract {
    var models: [PostCellViewModel] = []

    func renderPostList(_ models: [PostCellViewModel]) {
        self.models = models
    }
    func showAlertMesssage(_ message: String) {
        print(message)
    }
}
