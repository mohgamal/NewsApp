//
//  NewsModel.swift
//  NewsAppData
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppDomain

public struct NewsModel: Codable {
    public let status : String?
    public let totalResults : Int?
    public let articles : [Articles]?
    
    func dotNews() -> NewsEntity {
        var articlesList: [NewsEntity.Articles] = []
        
        for article in articles ?? [] {
            articlesList.append(article.dotArticles())
        }
        
        return NewsEntity(status: status, totalResults: totalResults, articles: articlesList)
    }
   
    
    public struct Articles: Codable {
        public let source : Source?
        public let author : String?
        public let title : String?
        public let description : String?
        public let url : String?
        public let urlToImage : String?
        public let publishedAt : String?
        public let content : String?
        
        func dotArticles() -> NewsEntity.Articles {
            return NewsEntity.Articles(source: source?.dotSource(), author: author, title: title, description: description, url: url, urlToImage: urlToImage, publishedAt: publishedAt, content: content)
        }
    }
    
    public struct Source: Codable {
        let id : String?
        let name : String?
        
        func dotSource() -> NewsEntity.Source {
            return NewsEntity.Source(id: id, name: name)
        }
    }
}
