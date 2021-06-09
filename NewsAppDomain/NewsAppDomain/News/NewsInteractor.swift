//
//  NewsInteractor.swift
//  NewsAppDomain
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import Foundation

public protocol NewsInteractorInterface {
    func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsEntity, NewsAppError>) -> Void)
}

public class NewsInteractor: NewsInteractorInterface {
    
    var newsDomainRepoInterface: NewsDomainRepoInterface?
    
    public init (newsDomainRepoInterface: NewsDomainRepoInterface?) {
        self.newsDomainRepoInterface = newsDomainRepoInterface
    }
    
    public func searchForNews(by filter: String?, page: Int?, handler: @escaping (Result<NewsEntity, NewsAppError>) -> Void) {
        newsDomainRepoInterface?.searchForNews(by: filter, page: page) { newsDomainModel in
            handler(newsDomainModel)
        }
    }
}
