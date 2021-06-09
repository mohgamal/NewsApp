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
        self.articleContentLabel.text = article?.content
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
