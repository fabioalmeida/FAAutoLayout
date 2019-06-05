//
//  UIView+Leading.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Leading
public extension UIView {

    /// Constrains the view leading space to its container view (i.e. the view **superview**).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used for most of the cases you wish to define a leading space relation between a view
    /// and the correspondent container view.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
    @discardableResult
    @objc(constrainLeadingSpaceToContainer:relation:priority:multiplier:)
    func constrainLeadingSpaceToContainer(_ constant: CGFloat = Constants.spacing,
                                          relation: NSLayoutConstraint.Relation = Constants.relation,
                                          priority: UILayoutPriority = Constants.priority,
                                          multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        return constrainLeadingSpace(toContainerView: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }
    

    /// Constrains the view leading space to a container view (e.g. the view **superview** or another view higher in the hierarchy).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a leading space relation to a view that is above the direct
    /// container view hierarchy, for instance, `self.superview.superview`.
    /// If you wish to just define a relation between the view and the direct superview, please refer to `constrainLeadingSpaceToContainer()`.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - containerView: The container view for which we want to create the leading space relation. For example, view.superview.superview.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
    @discardableResult
    @objc(constrainLeadingSpaceToContainerView:constant:relation:priority:multiplier:)
    func constrainLeadingSpace(toContainerView containerView: UIView,
                               constant: CGFloat = Constants.spacing,
                               relation: NSLayoutConstraint.Relation = Constants.relation,
                               priority: UILayoutPriority = Constants.priority,
                               multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.leadingSpaceConstraint(fromView: self, toView: containerView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        containerView.addConstraint(constraint)

        return constraint
    }
}
