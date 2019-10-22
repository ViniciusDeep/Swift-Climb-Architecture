//
//  InsideRepoHeaderView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideRepoHeaderView: UIView, ConfigurableView {
   
    let headerRepoImage = UIImageView().then{
        $0.image = #imageLiteral(resourceName: "Screen Shot 2019-10-22 at 15.37.54")
        $0.contentMode = .scaleAspectFit
        $0.cBuild(width: 50)
        $0.cBuild(height: 50)
    }
    
    let nameRepo = UILabel().then {
        $0.text = "Vagas"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .titleColor
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let descriptionRepo = UILabel().then {
        $0.text = "🔬 Espaço para divulgação de vagas para front-enders."
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .titleColor
        $0.font = .italicSystemFont(ofSize: 14)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .gitColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([headerRepoImage, nameRepo, descriptionRepo])
    }
       
    func setupConstraints() {
        headerRepoImage.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 20)
        }
        
        headerRepoImage.cBuild(make: .centerXInSuperView)
        
        
        nameRepo.cBuild { (make) in
            make.top.equal(to: headerRepoImage.bottomAnchor, offsetBy: 20)
            make.centerX.equal(to: headerRepoImage.centerXAnchor, offsetBy: 0)
        }
        
        descriptionRepo.cBuild { (make) in
            make.top.equal(to: nameRepo.bottomAnchor, offsetBy: 5)
            make.leading.equal(to: leadingAnchor, offsetBy: 30)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
        }
        
        
        
    }
    
    
    
}
