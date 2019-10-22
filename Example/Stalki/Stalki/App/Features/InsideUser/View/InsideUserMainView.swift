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
        contentView.tableView.rx.setDelegate(self).disposed(by: disposeBag)
        bindUI()
    }
    
    fileprivate func bindUI() {
        navigationItem.title = viewModel?.user?.userName ?? "PlaceHolder"
        apiClient?.getEventsFromUser().map({ events in
            return events
        }).bind(to: contentView.tableView.rx.items(cellIdentifier: EventCell.reuseIdentifier)) { index, model, cell in
            guard let cell = cell as? EventCell else {return}
            cell.viewModel = EventCellViewModel(model)
            
            let gestureToLabel = UITapGestureRecognizer()
            let gestureToCard = UITapGestureRecognizer()
            
            cell.cardEventView.repositorieEvent.addGestureRecognizer(gestureToLabel)
            
            cell.cardEventView.addGestureRecognizer(gestureToCard)
            
            gestureToLabel.rx.event.bind(onNext: {_ in
                self.navigationController?.pushViewController(InsideRepoMainView(), animated: true)
                
            }).disposed(by: self.disposeBag)
            
            
            gestureToCard.rx.event.bind(onNext: {_ in
               // Show completed event
            }).disposed(by: self.disposeBag)
            
            
        }.disposed(by: disposeBag)
    }
}

extension InsideUserMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = InsideUserHeader()
        header.viewModel = self.viewModel
        return header
    }
}


