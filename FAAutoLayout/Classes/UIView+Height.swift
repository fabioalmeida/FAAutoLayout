//
//  UIView+Height.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Height
public extension UIView {

    /// Constrains the view height to a given size.
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a fixed height for your view.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added height constraint.
    @discardableResult
    @objc(constrainHeight:relation:priority:multiplier:)
    public func constrainHeight(_ constant: CGFloat,
                                relation: NSLayoutRelation = Constants.relation,
                                priority: UILayoutPriority = Constants.priority,
                                multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.heightConstraint(fromView: self, toView: nil, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }


    /// Constrains the view height to be the same (or related) with others view height.
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a relation between the current view height and the height
    /// of the view sent by argument. If you don't specify arguments they will be exactly the same.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - toView: The view which we want to create an equal height constraint.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added height constraint.
    @discardableResult
    @objc(constrainEqualHeightToView:constant:relation:priority:multiplier:)
    public func constrainEqualHeight(toView: UIView,
                                     constant: CGFloat = Constants.spacing,
                                     relation: NSLayoutRelation = Constants.relation,
                                     priority: UILayoutPriority = Constants.priority,
                                     multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.heightConstraint(fromView: self, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }
    

    /// Constrains all the views height to be the equal.
    ///
    /// These contraints are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used when you wish to define a relation between several views height.
    /// It can be useful, for instance, if you create an array of views dynamically and all should have the same height.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraints are the same as if the constraints were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - views: The array of views to which we want to constrain equal heights.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added height constraints.
    @discardableResult
    @objc(constrainEqualHeight:constant:relation:priority:multiplier:)
    public class func constrainEqualHeight(_ views: [UIView],
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

            let constraint = NSLayoutConstraint.heightConstraint(fromView: fromView, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
            constraints.append(constraint)

            fromView.superview!.addConstraint(constraint)
        }

        return constraints
    }
}
