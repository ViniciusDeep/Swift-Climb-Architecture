//
//  EventCell.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import SDWebImage

class EventCell: UITableViewCell {
    
    private weak var shadowView: UIView?
    
    let cardEventView = CardEventView()
       
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
        addSubviews([cardEventView])
    }
    
    func setupConstraints() {
        cardEventView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 16)
            make.leading.equal(to: leadingAnchor, offsetBy: 16)
            make.bottom.equal(to: bottomAnchor, offsetBy: -16)
            make.trailing.equal(to: trailingAnchor, offsetBy: -16)
        }
    }
    
    private func configureShadow(){
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: cardEventView.frame.origin.x, y: cardEventView.frame.origin.y, width: cardEventView.frame.width + 5  , height: cardEventView.frame.height + 5))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        self.applyShadow(width: CGFloat(5), height: CGFloat(5))
    }
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: cardEventView.bounds, cornerRadius: 10)
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

