//
//  ReusableScrollView.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 11/9/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit
import SnapKit

protocol ReusableScrollViewDataSource {
    func next(inScrollView scrollView:ReusableScrollView, from view: Reusable?) -> Reusable?
    func previous(inScrollView scrollView:ReusableScrollView, from view: Reusable?) -> Reusable?
}

extension ReusableScrollViewDataSource {
    func defaultView() -> Reusable {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        
        view.snp.makeConstraints { (make) in
            make.height.equalTo(600)
            make.width.equalTo(500)
        }
        
        return view
    }
    
    func next(inScrollView scrollView:ReusableScrollView, from view: Reusable?) -> Reusable? {
        if let view = scrollView.reuseView(withIdentifier: "DefaultIdentifier") {
            return view;
        }
        return defaultView()
    }
    
    func previous(inScrollView scrollView:ReusableScrollView, from view: Reusable?) -> Reusable? {
        if let view = scrollView.reuseView(withIdentifier: "DefaultIdentifier") {
            return view;
        }
        return defaultView()
    }
}

class ReusableScrollView: UIScrollView {
    @IBOutlet var layoutView: UIView?
    
    private lazy var visibleViews = [Reusable]()
    fileprivate lazy var reusableStorage = [Reusable]()
    
    weak private var rightConstraint: Constraint? = nil
    weak private var leftConstraint: Constraint? = nil
    
    private var contentMinWidth: CGFloat {
        return self.frame.width * 3
    }
    
    private var excessOffset: CGFloat {
        return contentMinWidth
    }
    
    
    var dataSource : ReusableScrollViewDataSource? {
        didSet {
            reload()
        }
    }
    
    //# MARK: - Public
    
    func reload() {
        for view in visibleViews {
            view.base.removeFromSuperview()
        }
        visibleViews.removeAll()
        
        setNeedsLayout()
    }
    
    //# MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        adjustContentIfNeeded()
    }
    
    private func adjustContentIfNeeded() {
        addMissingViews()
        removeExcessViews()
    }
    
    //# MARK: - Remove
    
    private func removeExcessViews() {
        if let preLast = visibleViews.dropLast().last?.base {
            if preLast.frame.minX > (self.bounds.maxX + excessOffset) {
                removeRight()
                removeExcessViews()
            }
        }
        if let preFirst = visibleViews.dropFirst().first?.base {
            if preFirst.frame.maxX < (self.bounds.minX - excessOffset) {
                removeLeft()
                removeExcessViews()
            }
        }
    }
    
    private func removeLeft() {
        let viewToRemove = visibleViews.removeFirst().base
        if visibleViews.count > 0 {
            self.contentOffset.x -= viewToRemove.bounds.width
        }
        
        visibleViews.first?.base.snp.makeConstraints { (make) in
            viewToRemove.removeFromSuperview()
            self.leftConstraint = make.left.equalTo(self).constraint
        }
        
        storeView(view: viewToRemove)
    }
    
    private func removeRight() {
        let viewToRemove = visibleViews.removeLast().base
        
        viewToRemove.removeFromSuperview()
        visibleViews.last?.base.snp.makeConstraints { (make) in
            self.rightConstraint = make.right.equalTo(self).constraint
        }
        
        storeView(view: viewToRemove)
    }
    
    //# MARK: - Add
    
    private func addMissingViews() {
        let currentContentWidth = visibleViews.reduce(0,{$0 + $1.base.bounds.size.width})
        if currentContentWidth < contentMinWidth {
            addRight()
        }
        if let last = visibleViews.last?.base {
            if last.frame.maxX < self.bounds.maxX {
                addRight()
            }
        }
        if let first = visibleViews.first?.base {
            if first.frame.minX > self.bounds.minX {
                addLeft()
            }
        }
    }
    
    private func addRight() {
        if let next = dataSource?.next(inScrollView: self, from: visibleViews.last) {
            addRight(view: next)
            layoutSubviews()
            addMissingViews()
        }
    }
    
    private func addRight(view: Reusable) {
        addSubview(view.base)
        
        rightConstraint?.deactivate()
        
        view.base.snp.makeConstraints { (make) in
            if let previousView = visibleViews.last?.base {
                make.left.equalTo(previousView.snp.right)
            }
            else {
                self.leftConstraint = make.left.equalTo(self).constraint
            }
            self.makeHorizontalConstraint(make: make)
            self.rightConstraint = make.right.equalTo(self).constraint
        }
        
        visibleViews.append(view)
    }
    
    private func addLeft() {
        if let next = dataSource?.previous(inScrollView: self, from: visibleViews.first) {
            addLeft(view: next)
            layoutSubviews()
            addMissingViews()
        }
    }
    
    private func addLeft(view: Reusable) {
        addSubview(view.base)
        
        leftConstraint?.deactivate()
        
        view.base.snp.makeConstraints { (make) in
            if let previousView = visibleViews.first?.base {
                make.right.equalTo(previousView.snp.left)
            }
            else {
                self.rightConstraint = make.right.equalTo(self).constraint
            }
            self.makeHorizontalConstraint(make: make)
            self.leftConstraint = make.left.equalTo(self).constraint
        }
        
        if visibleViews.count > 0 {
            view.base.layoutIfNeeded()
            self.contentOffset.x += view.base.bounds.width
        }
        visibleViews.insert(view, at: 0)
    }

    private func makeHorizontalConstraint(make: SnapKit.ConstraintMaker) {
        if let layoutView = layoutView {
            make.bottom.equalTo(layoutView)
        }
        else {
            make.centerY.equalTo(self)
        }
    }
}

//# MARK: -

private typealias ReusableContainer = ReusableScrollView
extension ReusableContainer {
    fileprivate func storeView(view: Reusable) {
        reusableStorage.append(view)
    }
    
    func reuseView(withIdentifier identifier: String) -> Reusable? {
        if let i = reusableStorage.index(where: { $0.identifier == identifier }) {
            return reusableStorage.remove(at: i)
        }
        return nil
    }
}
