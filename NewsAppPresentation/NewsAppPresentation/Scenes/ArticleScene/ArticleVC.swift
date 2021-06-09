//
//  ArticleVC.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import NewsAppDomain

public class ArticleVC: UIViewController {
    
    var article: NewsEntity.Articles?

    public init(article: NewsEntity.Articles?) {
        self.article = article
        super.init(nibName: "ArticleVC", bundle: Bundle(for: ArticleVC.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        if let article = article {
            self.title = article.author
        }
        
    }
    
}
