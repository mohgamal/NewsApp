//
//  ArticleCell.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import NewsAppDomain

class ArticleCell: UITableViewCell {

    static let cellIdentifier = "articleCell"
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleContentLabel: UILabel!
    @IBOutlet weak var articleSourceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with article: NewsEntity.Articles?) {
        articleContentLabel.text = article?.content
        articleImage.layer.cornerRadius = 5
        
        ImageDownloader.shared.downloadImage(with: article?.urlToImage, completionHandler: { (image, result) in
            self.articleImage.image = image
        }, placeholderImage: UIImage(named: "default-image"))
        
        self.articleImage.contentMode = .scaleToFill
    }

    override func prepareForReuse() {
        articleImage.image = UIImage(named: "default-image")
    }
    
}
