//
//  CBuilder.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 19/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//


import UIKit

extension UIView {
    /// This method add arrange of view in view
    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    func cBuild(_ make : (LayoutProxy) -> ()) {
        translatesAutoresizingMaskIntoConstraints = false
        make(LayoutProxy(view: self))
    }
    
    /// This constraints with you respective constant, always anchor following with you constant
    func cBuild(top: NSLayoutYAxisAnchor?, costantTop: CGFloat = 0, bottom: NSLayoutYAxisAnchor?, constantBottom: CGFloat = 0, left: NSLayoutXAxisAnchor?, constantLeft: CGFloat = 0,  right: NSLayoutXAxisAnchor?, constantRight: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let tope = top {
            topAnchor.constraint(equalTo: tope, constant: costantTop).isActive = true
        }
        
        if let bott = bottom {
             bottomAnchor.constraint(equalTo: bott, constant: constantBottom).isActive = true
        }
        
        if let leading = left {
            leadingAnchor.constraint(equalTo: leading, constant: constantLeft).isActive = true
        }
        
        if let trailing = right {
            trailing.constraint(equalTo: trailing, constant: constantRight).isActive = true
        }
    }
    
    
    func cBuild(to anchor: TypeAnchor, with priotity: CGFloat) {
        switch anchor {
        case .top:
            break
        default:
            break
        }
        

        }
    
    /// This method is calling to set all constraints in to respective anchors
    func cBuild(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let tope = top {
            topAnchor.constraint(equalTo: tope).isActive = true
        }
        
        if let bott = bottom {
            bottomAnchor.constraint(equalTo: bott).isActive = true
        }
        
        if let leading = left {
            leadingAnchor.constraint(equalTo: leading).isActive = true
        }
        
        if let trailing = right {
            trailing.constraint(equalTo: trailing).isActive = true
        }
    }
    
    /// Define width from anchor with constant
    func cBuild(width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    /// Define with from anchor with NSLayoutDimension
    func cBuild(width: NSLayoutDimension) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: width).isActive = true
    }
    
    /// Define height from anchor with constant
    func cBuild(height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    /// Define height from anchor with NSLayoutDimension
    func cBuild(height: NSLayoutDimension) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: height).isActive = true
    }
    
    /// Method calling when you to consider your view equal to
    func cBuild(make: ViewAction) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch make {
        case .fillSuperview:
            equalToSuperView()
        case .centerInSuperView:
            equalToSuperView()
        case .centerXInSuperView:
            centerXInSuperView()
        case .centerYInSuperView:
            centerYInSuperView()
        }
    }
    
    
    func cBuild(make: ConstraintAction) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch make {
        case .desactiveAllConstraints:
            constraints.forEach { (constraint) in
                constraint.isActive = false
            }
        }
    }
    
    fileprivate func centerInSuperView() {
        centerXInSuperView()
        centerYInSuperView()
    }
    
    fileprivate func centerXInSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: spView.centerXAnchor),
            ])
    }
    
    fileprivate func centerYInSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: spView.centerYAnchor),
            ])
    }
    
    fileprivate func equalToSuperView() {
        guard let spView = superview else {return}
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: spView.topAnchor),
            leadingAnchor.constraint(equalTo: spView.leadingAnchor),
            trailingAnchor.constraint(equalTo: spView.trailingAnchor),
            bottomAnchor.constraint(equalTo: spView.bottomAnchor)
        ])
    }
}

enum ViewAction {
    case fillSuperview
    case centerInSuperView
    case centerXInSuperView
    case centerYInSuperView
}


enum ConstraintAction {
    case desactiveAllConstraints
}

enum TypeAnchor {
    case top
    case leading
    case trailing
    case bottom
}

// Operator overloading

// SUM
func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, sum: CGFloat) {
    return (lhs, rhs)
}

func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, sum: CGFloat) {
    return (lhs, -rhs)
}


//MULTIPLICATON
func *<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, mult: CGFloat) {
    return (lhs, rhs)
}

func /<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, mult: CGFloat) {
    return (lhs, 1/rhs)
}

//EQUALITY

func ==<A: DimensionAnchor>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

func ==<A: DimensionAnchor>(lhs: LayoutDimensionProperty<A>, rhs: (A, mult: CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.mult)
}

func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>, rhs: (A, sum: CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.sum)
}

func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, sum: CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.sum)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

//GREATHER THEN

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

//LESS THEN

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

protocol DimensionAnchor: LayoutAnchor {
    func constraint(equalTo anchor: Self, multiplier: CGFloat) -> NSLayoutConstraint
    func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}

extension NSLayoutDimension: DimensionAnchor {}


/// Represents a property assigned to a Anchor
protocol LayoutPropertyProtocol {
    associatedtype Anchor: LayoutAnchor
    
    var anchor: Anchor { get set }
    init(anchor: Anchor)
}

extension LayoutPropertyProtocol where Anchor: LayoutAnchor {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
}

extension LayoutPropertyProtocol where Anchor: DimensionAnchor {
    func equal(to otherAnchor: Anchor, multiplier: CGFloat) {
        anchor.constraint(equalTo: otherAnchor, multiplier: multiplier).isActive = true
    }
    
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
}

struct LayoutProperty<Anchor: LayoutAnchor>: LayoutPropertyProtocol {
    var anchor: Anchor
}

struct LayoutDimensionProperty<Anchor: DimensionAnchor>: LayoutPropertyProtocol {
    var anchor: Anchor
}

class LayoutProxy {
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)
    lazy var centerX = property(with: view.centerXAnchor)
    lazy var centerY = property(with: view.centerYAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    private func property<A: DimensionAnchor>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}
