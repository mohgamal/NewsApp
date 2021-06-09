//
//  AppDI.swift
//  NewsApp
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import NewsAppPresentation

class AppDI: AppDIInterface {
    
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    
    func newsSearchDependencies() -> NewsSearchVM {
        let newsSearchDI = NewsSearchDI(appEnvironment: appEnvironment)
        return newsSearchDI.newsSearchDependencies()
    }
}
