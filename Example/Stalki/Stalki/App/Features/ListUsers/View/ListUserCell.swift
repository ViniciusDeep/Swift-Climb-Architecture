//
//  ListUserCell.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import SDWebImage

class ListUserCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    let profileImage = UIImageView().then {
        $0.layer.cornerRadius = 8
        $0.cBuild(width: 65)
        $0.cBuild(height: 65)
        $0.contentMode = .scaleAspectFit
        $0.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
    
    let userName = UILabel().then {
      $0.textAlignment = .center
      $0.textColor = .black
      $0.lineBreakMode = .byWordWrapping
      $0.font = UIFont.italicSystemFont(ofSize: 26)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            make.top.equal(to: profileImage.topAnchor, offsetBy: -10)
            make.leading.equal(to: profileImage.trailingAnchor, offsetBy: 10)
        }
        
        
    }
    
    
}
