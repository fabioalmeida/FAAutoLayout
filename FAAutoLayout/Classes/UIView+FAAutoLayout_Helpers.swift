//
//  UIView+FAAutoLayout_Helpers.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 27/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Public Helpers
public extension UIView {

    // MARK: Constants

    /// The constants used for default values on the constraint's parameters
    enum Constants {

        public static let spacing : CGFloat = 0.0
        public static let multiplier: CGFloat = 1.0
        public static let relation: NSLayoutConstraint.Relation = .equal
        public static let priority: UILayoutPriority = .required
    }
}

// MARK: - Internal Helpers
internal extension UIView {

    // MARK: Methods

    /// Validates if the view was already added to superview.
    /// This is needed because we are unable to add constraints before the view being added to view hierarchy.
    ///
    /// This code performs a traditional C-style assert to make sure that in can catch bad view hierarchies in debug.
    func validateViewHierarchy() {

        UIView.validateViewHierarchy(self)
    }

    /// Validates if the view was already added to superview.
    /// This is needed because we are unable to add constraints before the view being added to view hierarchy.
    ///
    /// This code performs a traditional C-style assert to make sure that in can catch bad view hierarchies in debug.
    ///
    /// - Parameter view: The view we want to validate the hierarchy.
    class func validateViewHierarchy(_ view: UIView) {

        assert(view.superview != nil, "The view does not have a superview. Make sure you add your view to the hierarchy before adding constraints")
    }

    /// Validates if the number of views is enough to add the desired constraint.
    /// This method is needed because if we want for instance to define that views have equal width,
    /// we need to be sure that the number of views is greater than 1, or else the code will do nothing.
    ///
    /// - Parameter view: The views we want to validate.
    class func validateNumberOfViews(_ views: [UIView]) {

        assert(views.count > 1, "This constraint can only be applied when we have multiple views.")
    }
}
