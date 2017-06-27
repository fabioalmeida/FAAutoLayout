//
//  UIView+Width.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Width
public extension UIView {

    @discardableResult
    public func constrainWidth(_ constant: CGFloat,
                               relation: NSLayoutRelation = Constants.relation,
                               priority: UILayoutPriority = Constants.priority,
                               multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.widthConstraint(fromView: self, toView: nil, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)

        return constraint;
    }


    @discardableResult
    public func constrainEqualWidth(toView: UIView,
                                    constant: CGFloat = Constants.spacing,
                                    relation: NSLayoutRelation = Constants.relation,
                                    priority: UILayoutPriority = Constants.priority,
                                    multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.widthConstraint(fromView: self, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)

        return constraint;
    }
    

    @discardableResult
    public class func constrainEqualWidth(_ views: [UIView],
                                          constant: CGFloat = Constants.spacing,
                                          relation: NSLayoutRelation = Constants.relation,
                                          priority: UILayoutPriority = Constants.priority,
                                          multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateNumberOfViews(views)
        var constraints = [NSLayoutConstraint]()

        for index in 0..<(views.count-1) {

            let fromView = views[index]
            let toView = views[index+1]

            validateViewHierarchy(fromView)

            let constraint = NSLayoutConstraint.widthConstraint(fromView: fromView, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
            constraints.append(constraint)

            fromView.superview!.addConstraint(constraint)
        }

        return constraints
    }
}
