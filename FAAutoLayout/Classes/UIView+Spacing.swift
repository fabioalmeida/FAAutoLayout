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

    /// Constrains the view horizontal spacing to other view that is on the same hierarchy level
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a horizontal space relation to a view that is on the same
    /// hierarchy level (i.e share the same superview).
    ///
    /// To use positive constant values, this methods should be used by adding the relation from the second view to the
    /// first which means that the `toView` argument should be a view that sits physically on the left in relation with the
    /// view were you are calling this method on.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - toView: The view for which we want to create the horizontal space relation. For positive `constant` values, should be on the left.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
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


    /// Spaces out all the views horizontally with the same space between all of them.
    ///
    /// These contraints are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used when you wish to space several views horizontally with the same dimension.
    /// It can be useful, for instance, if you create an array of views dynamically and the horizontal space between
    /// them should be the same.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraints are the same as if the constraints were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - views: The array of views to which we want to horizontally space.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added horizontal space constraints.
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


    /// Constrains the view vertical spacing to other view that is on the same hierarchy level
    ///
    /// This contraint is added directly to the container view and is returned for future manipulation (if needed).
    /// This method should be used when you wish to define a vertical space relation to a view that is on the same
    /// hierarchy level (i.e share the same superview).
    ///
    /// To use positive constant values, this methods should be used by adding the relation from the second view to the
    /// first which means that the `toView` argument should be a view that sits physically above in relation with the
    /// view were you are calling this method on.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for this contraint are the same as if the constraint was created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - toView: The view for which we want to create the vertical space relation. For positive `constant` values, should be above.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint. The default value is 0.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added constraint between the two views.
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
    

    /// Spaces out all the views vertically with the same space between all of them.
    ///
    /// These contraints are added directly to the container view and are returned for future manipulation (if needed).
    /// This method should be used when you wish to space several views vertically with the same dimension.
    /// It can be useful, for instance, if you create an array of views dynamically and the vertical space between
    /// them should be the same.
    ///
    /// The arguments should only be changed when the desired value is not the default value, to simplify the method readability.
    /// All the **default values** for these contraints are the same as if the constraints were created on the Interface Builder.
    ///
    /// - Parameters:
    ///   - views: The array of views to which we want to vertically space.
    ///   - constant: The constant added to the multiplied second attribute participating in the constraint.
    ///   - relation: The relation between the two attributes in the constraint (e.g. =, >, >=, <, <=). The default relation is Equal.
    ///   - priority: The priority of the constraint. The default value is 1000 (required).
    ///   - multiplier: The multiplier applied to the second attribute participating in the constraint. The default value is 1.
    /// - Returns: The added vertical space constraints.
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
