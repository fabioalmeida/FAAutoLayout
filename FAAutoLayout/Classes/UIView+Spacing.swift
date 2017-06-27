//
//  UIView+Spacing.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Spacing
public extension UIView {

    @discardableResult
    public func constrainHorizontalSpacing(toView view: UIView,
                                           constant: CGFloat = Constants.spacing,
                                           relation: NSLayoutRelation = Constants.relation,
                                           priority: UILayoutPriority = Constants.priority,
                                           multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.horizontalSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        self.superview!.addConstraint(constraint)

        return constraint
    }


    @discardableResult
    public class func constrainEqualHorizontalSpacing(_ views: [UIView],
                                                      constant: CGFloat = Constants.spacing,
                                                      relation: NSLayoutRelation = Constants.relation,
                                                      priority: UILayoutPriority = Constants.priority,
                                                      multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateNumberOfViews(views)
        var constraints = [NSLayoutConstraint]()

        for index in 0..<(views.count-1) {

            let fromView = views[index+1]
            let toView = views[index]

            validateViewHierarchy(fromView)

            let constraint = NSLayoutConstraint.horizontalSpaceConstraint(fromView: fromView, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
            constraints.append(constraint)

            fromView.superview!.addConstraint(constraint)
        }

        return constraints
    }


    @discardableResult
    public func constrainVerticalSpacing(toView view: UIView,
                                         constant: CGFloat = Constants.spacing,
                                         relation: NSLayoutRelation = Constants.relation,
                                         priority: UILayoutPriority = Constants.priority,
                                         multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.verticalSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        self.superview!.addConstraint(constraint)

        return constraint
    }
    

    @discardableResult
    public class func constrainEqualVerticalSpacing(_ views: [UIView],
                                                    constant: CGFloat = Constants.spacing,
                                                    relation: NSLayoutRelation = Constants.relation,
                                                    priority: UILayoutPriority = Constants.priority,
                                                    multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateNumberOfViews(views)
        var constraints = [NSLayoutConstraint]()

        for index in 0..<(views.count-1) {

            let fromView = views[index+1]
            let toView = views[index]

            validateViewHierarchy(fromView)

            let constraint = NSLayoutConstraint.verticalSpaceConstraint(fromView: fromView, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
            constraints.append(constraint)
            
            fromView.superview!.addConstraint(constraint)
        }
        
        return constraints
    }
}
