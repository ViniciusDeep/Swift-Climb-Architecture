//
//  SearchController.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UISearchController {
    convenience init(navigationController: UINavigationController?, viewController: ListUserMainView) {
        self.init(searchResultsController: nil)
             definesPresentationContext = true
                       navigationController?.navigationBar.tintColor = .actionColor
        viewController.navigationItem.searchController = self
                       navigationItem.hidesSearchBarWhenScrolling = false
                       self.searchBar.delegate = viewController
             self.obscuresBackgroundDuringPresentation = false
                    let textFieldInsideSearchBar = self.searchBar.value(forKey: "searchField") as? UITextField
                    textFieldInsideSearchBar?.textColor = .titleColor
    }
}
