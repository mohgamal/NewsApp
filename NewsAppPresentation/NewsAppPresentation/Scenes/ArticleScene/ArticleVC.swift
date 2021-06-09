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
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    public init(article: NewsEntity.Articles?) {
        self.article = article
        super.init(nibName: "ArticleVC", bundle: Bundle(for: ArticleVC.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewData()
    }
    
    private func configureViewData() {
        if let article = article {
            self.title = article.title
            self.titleLabel.text = article.title
            self.dateLabel.text = article.publishedAt
            self.authorLabel.text = article.author
            self.descriptionLabel.text = article.description
            self.contentLabel.text = article.content
            self.sourceLabel.text = article.source?.name ?? ""
            
            ImageDownloader.shared.downloadImage(with: article.urlToImage, completionHandler: { (image, result) in
                self.articleImage.image = image
            }, placeholderImage: UIImage(named: "default-image"))
            
            self.articleImage.contentMode = .scaleToFill
        }
    }
    
    @IBAction func goTotSOurceButtonPressed(_ sender: Any) {
        guard let url = URL(string: article?.url ?? "") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
