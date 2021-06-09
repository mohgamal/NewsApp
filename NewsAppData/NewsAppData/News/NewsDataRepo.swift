//
//  NewsDataRepo.swift
//  NewsAppData
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppDomain

public class NewsDataRepo: NewsDomainRepoInterface {

    let newsRemoteDataSource: NewsRemoteDataSourceInterface
    
    public init (newsRemoteDataSource: NewsRemoteDataSourceInterface) {
        self.newsRemoteDataSource = newsRemoteDataSource
    }
    
    public func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsEntity, NewsAppError>) -> Void) {
        newsRemoteDataSource.searchForNews(by: filter, page: page) { newResultModel in
            switch newResultModel {
            case .success(let newsModel):
                handler(.success(newsModel.dotNews()))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
