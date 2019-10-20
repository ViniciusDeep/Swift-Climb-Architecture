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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([profileImage])
      }
      
      func setupConstraints() {
        profileImage.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
        }
        
        profileImage.cBuild(make: .centerXInSuperView)
        
        profileImage.cBuild(width: 100)
        profileImage.cBuild(height: 100)
      }
}
