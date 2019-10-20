//
//  ListUsersContentView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListUserContentView: UIView {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListUserCell.self, forCellReuseIdentifier: ListUserCell.reuseIdentifier)
        tableView.rowHeight = 100
        tableView.backgroundColor = .backgroundColor
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.cBuild(make: .fillSuperview)
    }
}
