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

    /// Constrains all the view margins to its container view (i.e. the view **superview**).
    ///
    /// These contraint are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used for most of the cases you wish to define one equal space relation between a view
    /// and the correspondent container view on all sides (e.g. the view should fill the container, or fill it with
    /// some given padding at all sides).
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraint are the same as if the they were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraints between the two views in the following order: leading, trailing, top, bottom
    @discardableResult
    @objc(fillContainer:relation:priority:multiplier:)
    public func fillContainer(_ constant: CGFloat = Constants.spacing,
                              relation: NSLayoutRelation = Constants.relation,
                              priority: UILayoutPriority = Constants.priority,
                              multiplier: CGFloat = Constants.multiplier) -> [NSLayoutConstraint] {

        validateViewHierarchy()
        return self.fill(view: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }


    /// Constrains all the view margins to a container view (e.g. the view **superview** or another view higher in the hierarchy).
    ///
    /// These contraint are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used when you wish to define one equal space relation to a view that is above the direct
    /// container view hierarchy, for instance, `self.superview.superview`. 
    /// It will add constraints on all sides (e.g. the view should fill the container, or fill it with some given padding).
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraint are the same as if the they were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - view: The container view for which we want to create the fill relation. For example, view.superview.superview.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraints between the two views in the following order: leading, trailing, top, bottom
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
