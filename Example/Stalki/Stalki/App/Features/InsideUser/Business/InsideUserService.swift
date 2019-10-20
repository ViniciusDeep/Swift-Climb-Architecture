//
//  InsideUserService.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxSwift

struct InsideUserService {
    
    fileprivate var baseUrl: URL?
    
    
    init(nameUser: String) {
        let urlAsString = "https://api.github.com/users/\(nameUser)/events"
        guard let url = URL(string: urlAsString) else {return}
        self.baseUrl = url
    }
    
//
//    func getEvents() -> Observable<User> {
//        return Observable<User>.create({ observer in
//            let task = URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
//                do {
//
//                }
//            }
//        })
//    }
    
    
    
}
