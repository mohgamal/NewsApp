//
//  MainCoordinator.swift
//  NewsApp
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import NewsAppPresentation

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newsSearchVC = NewsSearchVC( appDI: AppDI.shared, newsSearchVM: AppDI.shared.newsSearchDependencies())
        navigationController.pushViewController(newsSearchVC, animated: false)
    }
}
