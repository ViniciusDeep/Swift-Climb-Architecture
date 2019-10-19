//
//  ListUsersMainView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxCocoa
import RxSwift

class ListUserMainView: UIViewController {
    
    var searchController = UISearchController(searchResultsController: nil)
    
    let contentView = ListUserContentView()
    
    let apiClient = APIClient()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setupNavigationBar()
        bindUI()
    }
    
    fileprivate func bindUI() {
       searchController.searchBar.rx.text.asObservable()
       .map { ($0 ?? "").lowercased() }
       .map { UniversityRequest(name: $0) }
       .flatMap { request -> Observable<[User]> in
         return self.apiClient.send(apiRequest: request)
       }
       .bind(to: contentView.tableView.rx.items(cellIdentifier: "cellId")) { index, model, cell in
        cell.textLabel?.text = model.login
       }
       .disposed(by: disposeBag)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupNavigationBar() {
                  navigationController?.navigationBar.barStyle = .black
                  definesPresentationContext = true
                           navigationController?.navigationBar.tintColor = .actionColor
                           navigationItem.searchController = self.searchController
                           navigationItem.hidesSearchBarWhenScrolling = false
                           searchController.searchBar.delegate = self
                        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
                        textFieldInsideSearchBar?.textColor = .titleColor

    }
}

extension ListUserMainView: UISearchBarDelegate {
    
    
}
