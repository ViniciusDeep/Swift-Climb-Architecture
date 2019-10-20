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
    
    private weak var shadowView: UIView?
    
    var viewModel: ListUserCellViewModel! {
           didSet {
            cardUserView.userName.text = viewModel.user?.userName
            guard let imageUrl = URL(string: viewModel.user?.imageUrl ?? "") else {return}
            cardUserView.profileImage.sd_setImage(with: imageUrl)
           }
       }
    
    let cardUserView = CardUserView()
       
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .backgroundColor
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([cardUserView])
    }
    
    func setupConstraints() {
        cardUserView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 16)
            make.leading.equal(to: leadingAnchor, offsetBy: 16)
            make.bottom.equal(to: bottomAnchor, offsetBy: -16)
            make.trailing.equal(to: trailingAnchor, offsetBy: -16)
        }
    }
    
    private func configureShadow(){
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: cardUserView.frame.origin.x, y: cardUserView.frame.origin.y, width: cardUserView.frame.width + 5  , height: cardUserView.frame.height + 5))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        self.applyShadow(width: CGFloat(5), height: CGFloat(5))
    }
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: cardUserView.bounds, cornerRadius: 10)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 3
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureShadow()
    }

    
}
