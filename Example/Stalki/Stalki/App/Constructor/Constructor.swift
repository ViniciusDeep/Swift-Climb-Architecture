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
        navigation.navigationBar.isTranslucent = false
            navigation.navigationBar.barTintColor = .gitColor
            navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.titleColor]
            navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.titleColor]
            navigation.view.backgroundColor =  .gitColor
        navigation.navigationBar.tintColor = .white
        
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        return window
    }
}
