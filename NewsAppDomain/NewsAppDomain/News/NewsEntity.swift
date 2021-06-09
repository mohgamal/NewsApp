//
//  NewsEntity.swift
//  NewsAppDomain
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import Foundation

public struct NewsEntity: Codable {
    public let status : String?
    public let totalResults : Int?
    public var articles : [Articles]?
    
    public init (status: String?, totalResults: Int?, articles : [Articles]?) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
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
        
        public init (source: Source?, author : String?, title : String?, description : String?, url : String?,urlToImage : String?, publishedAt : String?, content : String?) {
            self.source = source
            self.author = author
            self.title = title
            self.description = description
            self.url = url
            self.urlToImage = urlToImage
            self.publishedAt = publishedAt
            self.content = content
        }
    }
    
    public struct Source: Codable {
        let id : String?
        let name : String?
        
        public init (id: String?, name: String?) {
            self.id = id
            self.name = name
        }
    }
}
