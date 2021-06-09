//
//  CoordinatorInterface.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import NewsAppDomain

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set}
    
    func start()
    func goToArticleScreen(article: NewsEntity.Articles?)
}
