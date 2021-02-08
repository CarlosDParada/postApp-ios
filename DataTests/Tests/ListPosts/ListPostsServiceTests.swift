//
//  ListPostsServiceTests.swift
//  DataTests
//
//  Created by Carlos Parada on 7/02/21.
//

@testable import Data
import XCTest

class ListPostsServiceTests: XCTestCase {
    func testPostListEntityParserSuccess() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "PostList", withExtension: "json") else {
            XCTFail("Could not load json file")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(RawServerResponse<DataUserEntity>.self, from: data)
            XCTAssertEqual(response.data.first!.uidUser, "78b4e41d-c74a-4be0-abe0-5e097a970b53")
        } catch {
            XCTFail("Could not decode PostListEntity")
        }
        XCTAssert(true)
    }

    func testGetListOfPostListesSuccess() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Retrieve list of posteses")
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "PostList", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            XCTFail("Could not load data")
            return
        }
        let urlSession = MockURLSession(data: data, response: nil, error: nil)

        // THEN
        PostAppService.post.execute(session:
                                        urlSession) { (result: Result<RawServerResponse<DataUserEntity>?, Error>) in
            if case let (.success(response)) = result,
               let post = response?.data.first! {
                XCTAssertEqual(post.emailUser, "Fabian.Schumm80@yahoo.com")
                XCTAssertEqual(post.profilePicUser, "https://mock.koombea.io/profile/profile85.jpg")
            } else {
                XCTFail("Could not retrieve list of post")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.5)
    }

    func testGetListOfPostListesFail() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Error fetching posteses")
        let urlSession = MockURLSession(data: nil, response: nil, error: APINetworkError.badResponse)

        // THEN
        PostAppService.post.execute(session:
                                        urlSession) { (result: Result<RawServerResponse<DataUserEntity>?, Error>) in
            if case let(.failure(error)) = result,
               let err = error as? APINetworkError {
                XCTAssertEqual(err, .badResponse)
            } else {
                XCTFail("Invalid error or response")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
}
