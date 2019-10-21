//
//  CardEventView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import SDWebImage

class CardEventView: UIView, ConfigurableView {
    
    let profileImage = UIImageView().then {
           $0.layer.cornerRadius = 8
           $0.cBuild(width: 40)
           $0.cBuild(height: 40)
           $0.contentMode = .scaleAspectFit
           $0.layer.masksToBounds = true
       }
       
       let categorieEvent = UILabel().then {
         $0.textAlignment = .center
         $0.lineBreakMode = .byWordWrapping
         $0.font = UIFont.italicSystemFont(ofSize: 14)
         $0.textColor = .lightGray
       }
    
    let repositorieEvent = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        customizeSettingAtView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeSettingAtView() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .tableViewColor
    }
    
    
    func buildViewHierarchy() {
        addSubviews([profileImage,categorieEvent, repositorieEvent])
    }
    
    func setupConstraints() {
        profileImage.cBuild(make: .centerYInSuperView)
             
             profileImage.cBuild { (make) in
                 make.leading.equal(to: leadingAnchor, offsetBy: 10)
             }
             
             categorieEvent.cBuild { (make) in
                 make.top.equal(to: profileImage.topAnchor, offsetBy: 0)
                 make.leading.equal(to: profileImage.trailingAnchor, offsetBy: 2)
             }
        
        repositorieEvent.cBuild { (make) in
            make.top.equal(to: categorieEvent.topAnchor, offsetBy: 0)
            make.leading.equal(to: categorieEvent.trailingAnchor, offsetBy: 2)
            
        }
        
        
    }
}
