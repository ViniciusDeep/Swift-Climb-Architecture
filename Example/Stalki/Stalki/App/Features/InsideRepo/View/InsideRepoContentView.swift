//
//  InsideRepoContentView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideRepoContentView: UIView, ConfigurableView {
   
    lazy var tableView = UITableView().then {
        $0.rowHeight = 150
        $0.separatorStyle = .none
        $0.backgroundColor = .backgroundColor
        $0.delegate = self
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
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

extension InsideRepoContentView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return InsideRepoHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
}
