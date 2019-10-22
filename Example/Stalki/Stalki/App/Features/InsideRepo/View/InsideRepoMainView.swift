//
//  InsideRepoMainView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxCocoa
import RxSwift

class InsideRepoMainView: UIViewController {
    
    let contentView = InsideRepoContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
}
