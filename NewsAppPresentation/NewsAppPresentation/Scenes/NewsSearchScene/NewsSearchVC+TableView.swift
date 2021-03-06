//
//  NewsSearchView+TableView.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit

extension NewsSearchVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.newsSearchVM.newsResultEntity.articles?.count ?? 0 == 0 {
            self.tableView.setEmptyMessage("Search for the news")
        } else {
            self.tableView.restore()
        }
        
        return self.newsSearchVM.newsResultEntity.articles?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellIdentifier, for: indexPath) as! ArticleCell
        cell.articleSourceButton.tag = indexPath.row
        cell.articleSourceButton.addTarget(self, action: #selector(didTapSourceButton), for: .touchUpInside)
        cell.configureCell(with: self.newsSearchVM.newsResultEntity.articles?[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.newsSearchVM.newsResultEntity.articles?.count ?? 0) - 4 && !self.newsSearchVM.isLoading &&
            self.newsSearchVM.page < 5 {
            self.newsSearchVM.isLoading = true
            self.newsSearchVM.page += 1
            self.newsSearchVM.getNewsSearchResult(with: searchBar.text ?? "", page: self.newsSearchVM.page)
        }
    }
    
    @objc
    public func didTapSourceButton(_ sender: UIButton) {
        let source = self.newsSearchVM.newsResultEntity.articles?[sender.tag]
        guard let url = URL(string: source?.url ?? "") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator.goToArticleScreen(article: self.newsSearchVM.newsResultEntity.articles?[indexPath.row])
    }
}
