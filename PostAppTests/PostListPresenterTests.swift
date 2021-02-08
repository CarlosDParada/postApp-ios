//
//  PostListPresenterTests.swift
//  PostAppTests
//
//  Created by Carlos Parada on 7/02/21.
//

@testable import PostApp
@testable import Data
import Domain
import XCTest

class PostListPresenterTests: XCTestCase {
    func testFetchAndRenderDataSuccess() {
        guard let dataUser = getPosts() else {
            XCTFail("Could not load post")
            return
        }

        let view = HomePostViewMock()
        let usecase = GetPostListUseCaseMock()
        usecase.dataUser = [dataUser, dataUser]
        let presenter = HomePostPresenter(view: view, getPostListUseCase: usecase)

        presenter.fetchData()
        XCTAssertEqual(view.models.first!.dataUser?.name, "Mr. Jacques Aufderhar")
    }

    func testDidCancelSearchSuccess() {
        guard let dataUser = getPosts() else {
            XCTFail("Could not load post")
            return
        }

        let view = HomePostViewMock()
        let usecase = GetPostListUseCaseMock()
        usecase.dataUser = [dataUser, dataUser]
        let presenter = HomePostPresenter(view: view, getPostListUseCase: usecase)

        presenter.fetchData()
        presenter.userDidCancelSearch()
        XCTAssertEqual(view.models.first!.dataUser?.profilePic, "https://mock.koombea.io/profile/profile85.jpg")
    }
}

private extension PostListPresenterTests {
    func getPosts() -> DataUser? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Post", withExtension: "json") else {
            fatalError("Could not find post list json or load data")
        }
        let data = (try? Data(contentsOf: url))!
        let response = try? JSONDecoder().decode(DataUserEntity.self, from: data)
        return try? response?.toDomain()
    }
}
