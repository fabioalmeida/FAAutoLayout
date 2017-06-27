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

    /// Constrains the view width to a given size.
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a fixed width for your view.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added width constraint.
    @discardableResult
    public func constrainWidth(_ constant: CGFloat,
                               relation: NSLayoutRelation = Constants.relation,
                               priority: UILayoutPriority = Constants.priority,
                               multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.widthConstraint(fromView: self, toView: nil, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }


    /// Constrains the view width to be the same (or related) with others view width.
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a relation between the current view width and the width
    /// of the view sent by argument. If you don't specify arguments they will be exactly the same.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - toView: The view which we want to create an equal width constraint.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added width constraint.
    @discardableResult
    public func constrainEqualWidth(toView: UIView,
                                    constant: CGFloat = Constants.spacing,
                                    relation: NSLayoutRelation = Constants.relation,
                                    priority: UILayoutPriority = Constants.priority,
                                    multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.widthConstraint(fromView: self, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }
    

    /// Constrains all the views width to be the equal.
    ///
    /// These contraints are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used when you wish to define a relation between several views width.
    /// It can be useful, for instance, if you create an array of views dynamically and all should have the same width.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraints are the same as if the constraints were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - views: The array of views to which we want to constrain equal widths.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added width constraints.
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
