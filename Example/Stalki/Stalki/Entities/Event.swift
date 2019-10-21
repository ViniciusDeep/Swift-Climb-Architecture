//
//  Event.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let type: String
    let repo: Repo
    let timeStamp: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case repo
        case timeStamp = "created_at"
    }
}


struct Repo: Decodable {
    let name: String
    let url: String
}
