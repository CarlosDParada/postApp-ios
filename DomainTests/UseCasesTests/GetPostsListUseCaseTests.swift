//
//  GetPostsListUseCaseTests.swift
//  DomainTests
//
//  Created by Carlos Parada on 7/02/21.
//

@testable import Domain
@testable import Data
import XCTest

class GetPostsListUseCaseTests: XCTestCase {
    func testFetchListSuccess() {
        // GIVEN
        let postList = getPostsList()
        let provider = PostProviderMock()
        provider.dataUser = postList
        let useCase = GetPostListUseCase(provider: provider)

        // THEN
        useCase.execute { (list, _) in
            guard let list = list else {
                XCTFail("Nil value")
                return
            }
            XCTAssertEqual(list.count, 2)
        }
    }

    func testFetchListEmpty() {
        // GIVEN
        let provider = PostProviderMock()
        let useCase = GetPostListUseCase(provider: provider)

        // THEN
        useCase.execute { (list, _) in
            XCTAssert(list == nil)
        }
    }
}

private extension GetPostsListUseCaseTests {
    func getPostsList() -> DataUser? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Post", withExtension: "json") else {
            fatalError("Could not find list post json or load data")
        }
        let data = (try? Data(contentsOf: url))!
        let response = try? JSONDecoder().decode(DataUserEntity.self, from: data)
        return try? response?.toDomain()
    }

}
