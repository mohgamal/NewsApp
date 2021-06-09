//
//  NewsSearchVM.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppDomain
import Combine

public class NewsSearchVM: ObservableObject {
    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    var error: Error?
    var page = 1
    var isLoading = false
    var newsResultEntity: NewsEntity = NewsEntity(status: nil, totalResults: nil, articles: [])
    
    private var newsInteractor: NewsInteractor
    
    public init (newsInteractor: NewsInteractor) {
        self.newsInteractor = newsInteractor
    }
    
    func getNewsSearchResult(with text: String, page: Int) {
        newsInteractor.searchForNews(by: text, page: page) { [weak self] newsSearchResult in
            DispatchQueue.main.async {
                switch newsSearchResult {
                case let .success(newsEntity):
                    self?.error = nil
                    if page == 1 {
                        self?.newsResultEntity = newsEntity
                    } else {
                        
                        for item in self?.newsResultEntity.articles ?? [] {
                            self?.newsResultEntity.articles?.append(item)
                        }
                    }
                    self?.objectWillChange.send()
                case let .failure(error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
