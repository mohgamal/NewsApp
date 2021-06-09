//
//  MainCoordinator.swift
//  NewsApp
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import NewsAppPresentation
import NewsAppDomain

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newsSearchVC = NewsSearchVC( appDI: AppDI.shared, newsSearchVM: AppDI.shared.newsSearchDependencies(), coordinator: self)
        navigationController.pushViewController(newsSearchVC, animated: false)
    }
    
    func goToArticleScreen(article: NewsEntity.Articles?) {
        let articleVC = ArticleVC(article: article)
        navigationController.pushViewController(articleVC, animated: true)
    }

}
