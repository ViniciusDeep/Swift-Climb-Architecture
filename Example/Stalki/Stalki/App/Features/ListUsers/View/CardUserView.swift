//
//  CardUserView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import SDWebImage

class CardUserView: UIView {
    
    let profileImage = UIImageView().then {
           $0.layer.cornerRadius = 8
           $0.cBuild(width: 65)
           $0.cBuild(height: 65)
           $0.contentMode = .scaleAspectFit
           $0.sd_imageIndicator = SDWebImageActivityIndicator.gray
           $0.layer.masksToBounds = true
       }
       
       let userName = UILabel().then {
         $0.textAlignment = .center
         $0.textColor = .black
         $0.lineBreakMode = .byWordWrapping
         $0.font = UIFont.italicSystemFont(ofSize: 26)
       }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        customizeSettingAtView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeSettingAtView() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .tableViewColor
    }
    
    
    func buildViewHierarchy() {
        addSubviews([profileImage,userName])
    }
    
    func setupConstraints() {
        profileImage.cBuild(make: .centerYInSuperView)
             
             profileImage.cBuild { (make) in
                 make.leading.equal(to: leadingAnchor, offsetBy: 10)
             }
             
             userName.cBuild { (make) in
                 make.top.equal(to: profileImage.topAnchor, offsetBy: 0)
                 make.leading.equal(to: profileImage.trailingAnchor, offsetBy: 10)
             }
    }
}
