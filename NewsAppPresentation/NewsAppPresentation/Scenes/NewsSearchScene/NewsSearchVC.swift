//
//  NewsSearchVC.swift
//  NewsAppPresentation
//
//  Created by Mohammed Abd El-Aty on 09/06/2021.
//

import UIKit
import Combine

public class NewsSearchVC: UIViewController {
    
    public let newsSearchVM: NewsSearchVM
    private var cancellable: AnyCancellable?
    
    private var cancellables: Set<AnyCancellable> = []
    
    var appDI: AppDIInterface
    
    public var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    public init(appDI: AppDIInterface, newsSearchVM: NewsSearchVM) {
        self.appDI = appDI
        self.newsSearchVM = newsSearchVM
        super.init(nibName: "NewsSearchVC", bundle: Bundle(for: NewsSearchVC.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search for the News ..."
        configViewSources()
        bindViewModel()
    }
    
    private func bindViewModel() {
        newsSearchVM.objectWillChange.sink { [weak self] in
            guard let self = self else {
                return
            }
            
            self.spinner.stopAnimating()
            
            if self.newsSearchVM.error != nil {
                self.viewAlert(with: self.newsSearchVM.error)
            } else {
                self.newsSearchVM.isLoading = false
                self.tableView.reloadData()
            }
            
        }.store(in: &cancellables)
    }
    
    public func addSpinner() {
        spinner.color = #colorLiteral(red: 0.03319132701, green: 0.6270697713, blue: 0.9124585986, alpha: 1)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func viewAlert(with error: Error?) {
        let alert = UIAlertController(title: "Error Occured", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func configViewSources() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ArticleCell", bundle: Bundle(for: ArticleCell.self)), forCellReuseIdentifier: ArticleCell.cellIdentifier)
        
        searchBar.delegate = self
    }
}
