//
//  NewsSearchView+TableView.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit

extension NewsSearchVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsSearchVM.newsResultEntity.articles?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellIdentifier, for: indexPath) as! ArticleCell
        cell.configureCell(with: self.newsSearchVM.newsResultEntity.articles?[indexPath.row])
        return cell
    }
}
