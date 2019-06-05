//
//  NSLayoutConstraint+FAAutoLayout.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 14/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit

// MARK: - Internal
internal extension NSLayoutConstraint {

    /// Helper method to facilitate the creation of leading space constraints
    class func leadingSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                             multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .leading,
                                                   toAttribute: .leading,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of trailing space constraints
    class func trailingSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                              multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        // in trailing contraints we need to invert the views order so that we don't need to use negative constants
        return NSLayoutConstraint.createConstraint(fromItem: toView,
                                                   toItem: fromView,
                                                   fromAttribute: .trailing,
                                                   toAttribute: .trailing,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c,
                                                   itemUsingAutoLayout: fromView)
    }

    /// Helper method to facilitate the creation of top space constraints
    class func topSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                         multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .top,
                                                   toAttribute: .top,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of bottom space constraints
    class func bottomSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                            multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        // in bottom contraints we need to invert the views order so that we don't need to use negative constants
        return NSLayoutConstraint.createConstraint(fromItem: toView,
                                                   toItem: fromView,
                                                   fromAttribute: .bottom,
                                                   toAttribute: .bottom,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c,
                                                   itemUsingAutoLayout: fromView)
    }

    /// Helper method to facilitate the creation of width constraints
    class func widthConstraint(fromView: UIView, toView: UIView?, relation: NSLayoutConstraint.Relation,
                                      multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        let toAttribute = toView != nil ? NSLayoutConstraint.Attribute.width : NSLayoutConstraint.Attribute.notAnAttribute
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .width,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of height constraints
    class func heightConstraint(fromView: UIView, toView: UIView?, relation: NSLayoutConstraint.Relation,
                                       multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        let toAttribute = toView != nil ? NSLayoutConstraint.Attribute.height : NSLayoutConstraint.Attribute.notAnAttribute
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .height,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of horizontal centering constraints
    class func centerHorizontallyConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                                   multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .centerX,
                                                   toAttribute: .centerX,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of vertical centering constraints
    class func centerVerticallyConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                                 multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .centerY,
                                                   toAttribute: .centerY,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of horizontal spacing constraints
    class func horizontalSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                                multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .leading,
                                                   toAttribute: .trailing,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }

    /// Helper method to facilitate the creation of vertical spacing constraints
    class func verticalSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutConstraint.Relation,
                                              multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .top,
                                                   toAttribute: .bottom,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
}


// MARK: - Private
fileprivate extension NSLayoutConstraint {

    /// Creates the constraint and set the `translatesAutoresizingMaskIntoConstraints` attribute to false on the `fromItem`
     class func createConstraint(fromItem fromView: UIView, toItem toView: UIView?, fromAttribute: NSLayoutConstraint.Attribute, toAttribute: NSLayoutConstraint.Attribute,
                                 relatedBy relation: NSLayoutConstraint.Relation, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
     
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: fromAttribute,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c,
                                                   itemUsingAutoLayout: fromView)
    }

    /// Creates the constraint and set the `translatesAutoresizingMaskIntoConstraints` attribute to false on the `itemUsingAutoLayout`
    class func createConstraint(fromItem fromView: UIView, toItem toView: UIView?, fromAttribute: NSLayoutConstraint.Attribute, toAttribute: NSLayoutConstraint.Attribute,
                                relatedBy relation: NSLayoutConstraint.Relation, multiplier m: CGFloat, constant c: CGFloat, itemUsingAutoLayout: UIView?) -> NSLayoutConstraint {
        
        if let itemUsingAutoLayout = itemUsingAutoLayout {
            itemUsingAutoLayout.translatesAutoresizingMaskIntoConstraints = false
        }
        
        return NSLayoutConstraint(item: fromView,
                                  attribute: fromAttribute,
                                  relatedBy: relation,
                                  toItem: toView,
                                  attribute: toAttribute,
                                  multiplier: m,
                                  constant: c)
    }
}
