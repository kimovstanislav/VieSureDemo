//
//  ApiTest.swift
//  VieSureDemoTests
//
//  Created by Stanislav Kimov on 25.11.22.
//

import XCTest
@testable import VieSureDemo
import Combine

final class ApiTest: XCTestCase {
    var mockApiClient: IVSAPI = MockAPIClient()
    
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    // TODO: async/await is better here. An option to wrap around - https://medium.com/geekculture/from-combine-to-async-await-c08bf1d15b77
    // TODO: OR, to change APIClient to async/await too, as local data
    func testDecodeData() throws {
        mockApiClient.articlesList().sink { completion in
            switch completion {
            case let .failure(error):
                XCTFail(error.message)
            case .finished:
                break
            }
        } receiveValue: { articles in
            XCTAssert(articles.count == 60)
        }.store(in: &cancellables)
    }
}