//
//  NewsSearchDI.swift
//  NewsApp
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppPresentation
import NewsAppDomain
import NewsAppData

class NewsSearchDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func newsSearchDependencies() -> NewsSearchVM {

        let newsRemoteDataSource = NewsRemoteDataSource(urlString: appEnvironment.baseURL)
        
        let newsSearchDataRepo = NewsDataRepo(newsRemoteDataSource: newsRemoteDataSource)

        let newsInteracrtor = NewsInteractor(newsDomainRepoInterface: newsSearchDataRepo)

        let newsVM = NewsSearchVM(newsInteractor: newsInteracrtor)

        return newsVM
    }
}
