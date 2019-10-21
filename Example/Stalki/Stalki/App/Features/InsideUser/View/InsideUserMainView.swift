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
    
    var apiClient: InsideUserService?
    
    convenience init(_ user: User) {
        self.init()
        self.viewModel = InsideUserViewModel(user)
        self.apiClient = InsideUserService(nameUser: user.userName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        bindUI()
    }
    
    fileprivate func bindUI() {
        navigationItem.title = viewModel?.user?.userName ?? "PlaceHolder"
        apiClient?.getEventsFromUser().map({ events in
            return events
        }).bind(to: contentView.tableView.rx.items(cellIdentifier: EventCell.reuseIdentifier)) { index, model, cell in
            guard let cell = cell as? EventCell else {return}
            cell.cardEventView.categorieEvent.text = model.type
        }.disposed(by: disposeBag)
    }
}


