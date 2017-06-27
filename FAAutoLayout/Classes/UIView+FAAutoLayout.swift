//
//  UIView+FAAutoLayout.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 16/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

public extension UIView {
    
    // MARK: - Leading

    @discardableResult
    public func constrainLeadingSpaceToContainer(_ constant: CGFloat = Constants.spacing,
                                                 relation: NSLayoutRelation = Constants.relation,
                                                 priority: UILayoutPriority = Constants.priority,
                                                 multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        return constrainLeadingSpace(toContainerView: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }

    @discardableResult
    public func constrainLeadingSpace(toContainerView containerView: UIView,
                                      constant: CGFloat = Constants.spacing,
                                      relation: NSLayoutRelation = Constants.relation,
                                      priority: UILayoutPriority = Constants.priority,
                                      multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.leadingSpaceConstraint(fromView: self, toView: containerView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        containerView.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Trailing
    
    @discardableResult
    public func constrainTrailingSpaceToContainer(_ constant: CGFloat = Constants.spacing,
                                                  relation: NSLayoutRelation = Constants.relation,
                                                  priority: UILayoutPriority = Constants.priority,
                                                  multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        validateViewHierarchy()
        return constrainTrailingSpace(toContainerView: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }
    
    @discardableResult
    public func constrainTrailingSpace(toContainerView containerView: UIView,
                                       constant: CGFloat = Constants.spacing,
                                       relation: NSLayoutRelation = Constants.relation,
                                       priority: UILayoutPriority = Constants.priority,
                                       multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.trailingSpaceConstraint(fromView: self, toView: containerView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        containerView.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Top

    @discardableResult
    public func constrainTopSpaceToContainer(_ constant: CGFloat = Constants.spacing,
                                             relation: NSLayoutRelation = Constants.relation,
                                             priority: UILayoutPriority = Constants.priority,
                                             multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        validateViewHierarchy()
        return constrainTopSpace(toContainerView: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }

    @discardableResult
    public func constrainTopSpace(toContainerView containerView: UIView,
                                  constant: CGFloat = Constants.spacing,
                                  relation: NSLayoutRelation = Constants.relation,
                                  priority: UILayoutPriority = Constants.priority,
                                  multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.topSpaceConstraint(fromView: self, toView: containerView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        containerView.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Bottom

    @discardableResult
    public func constrainBottomSpaceToContainer(_ constant: CGFloat = Constants.spacing,
                                                relation: NSLayoutRelation = Constants.relation,
                                                priority: UILayoutPriority = Constants.priority,
                                                multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        validateViewHierarchy()
        return constrainBottomSpace(toContainerView: superview!, constant: constant, relation: relation, priority: priority, multiplier: multiplier)
    }
    
    @discardableResult
    public func constrainBottomSpace(toContainerView containerView: UIView,
                                     constant: CGFloat = Constants.spacing,
                                     relation: NSLayoutRelation = Constants.relation,
                                     priority: UILayoutPriority = Constants.priority,
                                     multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.bottomSpaceConstraint(fromView: self, toView: containerView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        containerView.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Width
    
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
    
    
    // MARK: - Height

    @discardableResult
    public func constrainHeight(_ constant: CGFloat,
                                relation: NSLayoutRelation = Constants.relation,
                                priority: UILayoutPriority = Constants.priority,
                                multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        validateViewHierarchy()
        let constraint = NSLayoutConstraint.heightConstraint(fromView: self, toView: nil, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)
        
        return constraint;
    }
    
    @discardableResult
    public func constrainEqualHeight(toView: UIView,
                                	constant: CGFloat = Constants.spacing,
                                	relation: NSLayoutRelation = Constants.relation,
                                	priority: UILayoutPriority = Constants.priority,
                                	multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {
        
        validateViewHierarchy()
        let constraint = NSLayoutConstraint.heightConstraint(fromView: self, toView: toView, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        superview!.addConstraint(constraint)
        
        return constraint;
    }
    
    @discardableResult
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
    
    
    // MARK: - Alignment (Horizontal)
    
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
    
    
    // MARK: - Alignment (Vertical)

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


    // MARK: - Alignment (Center)

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


    // MARK: - Fill

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
        topConstraint.priority = priority;
        let bottomConstraint = NSLayoutConstraint.bottomSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        bottomConstraint.priority = priority
        view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

        return [leadingConstraint, trailingConstraint, topConstraint, bottomConstraint];
    }


    // MARK: - Spacing

    @discardableResult
    public func constrainHorizontalSpacing(toView view: UIView,
                                           constant: CGFloat = Constants.spacing,
                                           relation: NSLayoutRelation = Constants.relation,
                                           priority: UILayoutPriority = Constants.priority,
                                           multiplier: CGFloat = Constants.multiplier) -> NSLayoutConstraint {

        validateViewHierarchy()
        let constraint = NSLayoutConstraint.horizontalSpaceConstraint(fromView: self, toView: view, relation: relation, multiplier: multiplier, constant: constant)
        constraint.priority = priority;
        self.superview!.addConstraint(constraint)

        return constraint;
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
        constraint.priority = priority;
        self.superview!.addConstraint(constraint)

        return constraint;
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


// MARK: - Private
fileprivate extension UIView {

    // MARK: Constants

    enum Constants {

        static let spacing : CGFloat = 0.0
        static let multiplier: CGFloat = 1.0
        static let relation: NSLayoutRelation = .equal
        static let priority: UILayoutPriority = UILayoutPriorityRequired
    }

    // MARK: Methods

    func validateViewHierarchy() {

        UIView.validateViewHierarchy(self)
    }

    class func validateViewHierarchy(_ view: UIView) {

        assert(view.superview != nil, "The view does not have a superview. Make sure you add your view to the hierarchy before adding constraints")
    }

    class func validateNumberOfViews(_ views: [UIView]) {

        assert(views.count > 1, "This constraint can only be applied when we have multiple views.")
    }
}
