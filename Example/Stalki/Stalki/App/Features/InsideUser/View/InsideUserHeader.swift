//
//  InsideUserHeader.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideUserHeader: UIView, ConfigurableView {
  
    let profileImage = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "devxoul")
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    let userName = UILabel().then{
        $0.text = "DevXoul"
        $0.lineBreakMode = .byWordWrapping
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([profileImage, userName])
      }
      
      func setupConstraints() {
        profileImage.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
        }
        
        profileImage.cBuild(make: .centerXInSuperView)
        
        profileImage.cBuild(width: 100)
        profileImage.cBuild(height: 100)
        
        userName.cBuild { (make) in
            make.top.equal(to: profileImage.bottomAnchor, offsetBy: 5)
            make.centerX.equal(to: profileImage.centerXAnchor)
        }
       
        
        
        
      }
}
