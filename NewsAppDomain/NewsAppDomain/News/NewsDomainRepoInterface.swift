//
//  NewsDomainRepoInterface.swift
//  NewsAppDomain
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import Foundation

public protocol NewsDomainRepoInterface {
    func searchForNews(by filter: String?, and page: Int?, handler: @escaping (Result<NewsEntity, NewsAppError>) -> Void)
}
