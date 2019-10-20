//
//  ListUserCellViewModel.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct ListUserCellViewModel {
   
    let user: User?
    
    init(user: User) {
        self.user = user
    }
}
