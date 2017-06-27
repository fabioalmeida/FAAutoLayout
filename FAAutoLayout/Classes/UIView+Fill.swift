//
//  UIView+Fill.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Fill
public extension UIView {

    @discardableResult
    public func fillContainer(_ constant: CGFloat = Constants.spacing,
                              relation: NSLayoutRelation = Constants.relation,
                              priority: UILayoutPriority = Constants.priority,
                              multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateViewHierarchy()
        return self.fill(view: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }


    @discardableResult
    @objc(fillView:constant:relation:priority:multiplier:)
    public func fill(view: UIView,
                     constant: CGFloat = Constants.spacing,
                     relation: NSLayoutRelation = Constants.relation,
                     priority: UILayoutPriority = Constants.priority,
                     multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        let leadingConstraint = NSLayoutConstraint.leadingSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        leadingConstraint.priority = priority
        let trailingConstraint = NSLayoutConstraint.trailingSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        trailingConstraint.priority = priority
        let topConstraint = NSLayoutConstraint.topSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        topConstraint.priority = priority
        let bottomConstraint = NSLayoutConstraint.bottomSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        bottomConstraint.priority = priority
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

        return [leadingConstraint, trailingConstraint, topConstraint, bottomConstraint]
    }
}

