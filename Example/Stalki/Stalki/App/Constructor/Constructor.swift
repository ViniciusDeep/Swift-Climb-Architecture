//
//  Constructor.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

struct Constructor {
 
    static func getWindow(windowScene: UIWindowScene) -> UIWindow {
        let navigation = UINavigationController(rootViewController: ListUserMainView())
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        return window
    }
}
