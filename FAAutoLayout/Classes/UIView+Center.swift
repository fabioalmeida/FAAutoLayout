//
//  UIView+Center.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Center
public extension UIView {

    // MARK: Horizontal

    @discardableResult
    public func centerHorizontallyInContainer(_ constant: CGFloat = Constants.spacing,
                                              relation: NSLayoutRelation = Constants.relation,
                                              priority: UILayoutPriority = Constants.priority,
                                              multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)

        return constraint;
    }


    @discardableResult
    public func centerHorizontally(withView view: UIView,
                                   constant: CGFloat = Constants.spacing,
                                   relation: NSLayoutRelation = Constants.relation,
                                   priority: UILayoutPriority = Constants.priority,
                                   multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        UIView.validateViewHierarchy(view)
        let constraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        view.superview!.addConstraint(constraint)

        return constraint;
    }


    // MARK: Vertical

    @discardableResult
    public func centerVerticallyInContainer(_ constant: CGFloat = Constants.spacing,
                                            relation: NSLayoutRelation = Constants.relation,
                                            priority: UILayoutPriority = Constants.priority,
                                            multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)

        return constraint;
    }


    @discardableResult
    public func centerVertically(withView view: UIView,
                                 constant: CGFloat = Constants.spacing,
                                 relation: NSLayoutRelation = Constants.relation,
                                 priority: UILayoutPriority = Constants.priority,
                                 multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        UIView.validateViewHierarchy(view)
        let constraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        view.superview!.addConstraint(constraint)

        return constraint;
    }


    // MARK: - Center

    @discardableResult
    public func centerInContainer(_ constant: CGFloat = Constants.spacing,
                                  relation: NSLayoutRelation = Constants.relation,
                                  priority: UILayoutPriority = Constants.priority,
                                  multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateViewHierarchy()
        let horizontalConstraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        horizontalConstraint.priority = priority;
        let verticalConstraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        verticalConstraint.priority = priority;
        superview!.addConstraints([horizontalConstraint, verticalConstraint])

        return [horizontalConstraint, verticalConstraint];
    }

    @discardableResult
    public func center(withView view: UIView,
                       constant: CGFloat = Constants.spacing,
                       relation: NSLayoutRelation = Constants.relation,
                       priority: UILayoutPriority = Constants.priority,
                       multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        UIView.validateViewHierarchy(view)
        let horizontalConstraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        horizontalConstraint.priority = priority;
        let verticalConstraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        verticalConstraint.priority = priority;
        view.superview!.addConstraints([horizontalConstraint, verticalConstraint])

        return [horizontalConstraint, verticalConstraint];
    }
}
