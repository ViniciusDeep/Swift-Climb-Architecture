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
    

    func getEventsFromUser() -> Observable<[Event]> {
        return Observable<[Event]>.create({ observer in
            let task = URLSession.shared.dataTask(with: self.baseUrl!) { (data, response, error) in
                do {
                    let events = try JSONDecoder().decode([Event].self, from: data ?? Data())
                    observer.onNext(events)
                } catch let error {
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create{
                task.cancel()
            }
        })
    }
}
