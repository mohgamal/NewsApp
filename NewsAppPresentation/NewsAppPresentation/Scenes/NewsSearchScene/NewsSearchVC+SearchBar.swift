//
//  NewsSearchView+SearchBar.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit


extension NewsSearchVC: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchtext = searchBar.text else { return }
        
        if searchtext != "" {
            self.tableView.setContentOffset(.zero, animated:true)
            self.addSpinner()
        }
        
        self.newsSearchVM.getNewsSearchResult(with: searchtext, page: 1)
        
        self.searchBar.resignFirstResponder()
    }
}
