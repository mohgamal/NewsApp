//
//  NewsSearchRemoteDataSourceMock.swift
//  NewsAppDataTests
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import Foundation
@testable import NewsAppData
@testable import NewsAppDomain

public class NewsRemoteDataSourceMock: NewsRemoteDataSourceInterface {
    let urlString: String
    
    required public init(urlString: String ) {
        self.urlString = urlString
    }
    
    public func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsModel, NewsAppError>) -> Void) {
        guard let data = Utils.readLocalFile(forName: urlString) else {
            handler(.failure(NewsAppError.NotFound))
            return
        }
        
        guard let result = Utils.parse(jsonData: data) else {
            handler(.failure(NewsAppError.WrongData))
            return
        }

        handler(.success(result))
    }
}
