//
//  InsideUserContentView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideUserContentView: UIView, ConfigurableView {
  
    let tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(EventCell.self, forCellReuseIdentifier: EventCell.reuseIdentifier)
        $0.backgroundColor = .backgroundColor
        $0.rowHeight = 100
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .backgroundColor
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.sectionHeaderHeight = frame.height * 0.3
    }
}
