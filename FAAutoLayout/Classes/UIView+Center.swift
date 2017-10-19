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

    /// Centers the view horizontally in its container view (i.e. the view **superview**).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used for most of the cases you wish to center horizontally your view in relation with
    /// the correspondent container view.
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
    @objc(centerHorizontallyInContainer:relation:priority:multiplier:)
    public func centerHorizontallyInContainer(_ constant: CGFloat = Constants.spacing,
                                              relation: NSLayoutRelation = Constants.relation,
                                              priority: UILayoutPriority = Constants.priority,
                                              multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }


    /// Centers the view horizontally in a container view (e.g. the view **superview** or another view higher in the hierarchy).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to center horizontally your view in relation to a view that is above the direct
    /// container view hierarchy, for instance, `self.superview.superview`.
    /// If you wish to just define a relation between the view and the direct superview, please refer to `centerHorizontallyInContainer()`.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - containerView: The container view for which we want to center horizontally. For example, view.superview.superview.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
    @discardableResult
    @objc(centerHorizontallyWithView:constant:relation:priority:multiplier:)
    public func centerHorizontally(withView view: UIView,
                                   constant: CGFloat = Constants.spacing,
                                   relation: NSLayoutRelation = Constants.relation,
                                   priority: UILayoutPriority = Constants.priority,
                                   multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        UIView.validateViewHierarchy(view)
        let constraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        view.superview!.addConstraint(constraint)

        return constraint
    }


    // MARK: Vertical

    /// Centers the view vertically in its container view (i.e. the view **superview**).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used for most of the cases you wish to center vertically your view in relation with
    /// the correspondent container view.
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
    @objc(centerVerticallyInContainer:relation:priority:multiplier:)
    public func centerVerticallyInContainer(_ constant: CGFloat = Constants.spacing,
                                            relation: NSLayoutRelation = Constants.relation,
                                            priority: UILayoutPriority = Constants.priority,
                                            multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        superview!.addConstraint(constraint)

        return constraint
    }


    /// Centers the view vertically in a container view (e.g. the view **superview** or another view higher in the hierarchy).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to center vertically your view in relation to a view that is above the direct
    /// container view hierarchy, for instance, `self.superview.superview`.
    /// If you wish to just define a relation between the view and the direct superview, please refer to `centerVerticallyInContainer()`.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - containerView: The container view for which we want to center vertically. For example, view.superview.superview.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
    @discardableResult
    @objc(centerVerticallyWithView:constant:relation:priority:multiplier:)
    public func centerVertically(withView view: UIView,
                                 constant: CGFloat = Constants.spacing,
                                 relation: NSLayoutRelation = Constants.relation,
                                 priority: UILayoutPriority = Constants.priority,
                                 multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        UIView.validateViewHierarchy(view)
        let constraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        view.superview!.addConstraint(constraint)

        return constraint
    }


    // MARK: - Center

    /// Centers the view both horizontal and vertically in its container view (i.e. the view **superview**).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used for most of the cases you wish to center your view in relation with
    /// the correspondent container view.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views in the following order: horizontal, vertical
    @discardableResult
    @objc(centerInContainer:relation:priority:multiplier:)
    public func centerInContainer(_ constant: CGFloat = Constants.spacing,
                                  relation: NSLayoutRelation = Constants.relation,
                                  priority: UILayoutPriority = Constants.priority,
                                  multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateViewHierarchy()
        let horizontalConstraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        horizontalConstraint.priority = priority
        let verticalConstraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: superview!, relation: relation, multiplier: multiplier, constant: constant)
        verticalConstraint.priority = priority
        superview!.addConstraints([horizontalConstraint, verticalConstraint])

        return [horizontalConstraint, verticalConstraint]
    }


    /// Centers the view both horizontal and vertically in a container view (e.g. the view **superview** or another
    /// view higher in the hierarchy).
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to center your view in relation to a view that is above the direct
    /// container view hierarchy, for instance, `self.superview.superview`.
    /// If you wish to just define a relation between the view and the direct superview, please refer to `centerInContainer()`.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - containerView: The container view for which we want to center with. For example, view.superview.superview.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views in the following order: horizontal, vertical
    @discardableResult
    @objc(centerWithView:constant:relation:priority:multiplier:)
    public func center(withView view: UIView,
                       constant: CGFloat = Constants.spacing,
                       relation: NSLayoutRelation = Constants.relation,
                       priority: UILayoutPriority = Constants.priority,
                       multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        UIView.validateViewHierarchy(view)
        let horizontalConstraint = NSLayoutConstraint.centerHorizontallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        horizontalConstraint.priority = priority
        let verticalConstraint = NSLayoutConstraint.centerVerticallyConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        verticalConstraint.priority = priority
        view.superview!.addConstraints([horizontalConstraint, verticalConstraint])

        return [horizontalConstraint, verticalConstraint]
    }
}
