//
//  NewsSearchTests.swift
//  NewsAppDataTests
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import XCTest

@testable import NewsAppDomain

class NewsSearchTests: XCTestCase {

    var newsSearchRemoteDataSource: NewsRemoteDataSourceMock?
    
    override func setUpWithError() throws {
        self.newsSearchRemoteDataSource = NewsRemoteDataSourceMock(urlString: "news-list-test")
    }

    override func tearDownWithError() throws {
        self.newsSearchRemoteDataSource = nil
    }
    
    func testCanDecodeData() {
        let requestExpectation = expectation(description: "Request should finish")
        
        self.newsSearchRemoteDataSource?.searchForNews(by: "Bitcoin", page: 1, handler: { (result) -> Void in
            switch result {
            case .success(let resultModel):
                XCTAssertTrue(resultModel.articles?.count ?? 0 > 0)
                requestExpectation.fulfill()
            case .failure(_): break
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
