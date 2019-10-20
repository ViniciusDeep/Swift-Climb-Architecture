//
//  InsideUserMainView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxSwift
import RxCocoa

class InsideUserMainView: UIViewController {
  
    let contentView = InsideUserContentView()
    
    var viewModel: InsideUserViewModel?
    
    let disposeBag = DisposeBag()
    
    
    
    convenience init(_ user: User) {
        self.init()
        self.viewModel = InsideUserViewModel(user)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        contentView.tableView.rx.setDelegate(self)
        .disposed(by: disposeBag)
    }
}

extension InsideUserMainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return InsideUserHeader()
    }
    
    
}
