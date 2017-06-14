//
//  NSLayoutConstraint+FAAutoLayout.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 14/06/2017
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Internal
extension NSLayoutConstraint {
    
    public class func leadingSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
                                             multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .leading,
                                                   toAttribute: .leading,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func trailingSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
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
    
    public class func topSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
                                         multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .top,
                                                   toAttribute: .top,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func bottomSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
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
    
    public class func widthConstraint(fromView: UIView, toView: UIView?, relation: NSLayoutRelation,
                                      multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        let toAttribute = toView != nil ? NSLayoutAttribute.width : NSLayoutAttribute.notAnAttribute
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .width,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func heightConstraint(fromView: UIView, toView: UIView?, relation: NSLayoutRelation,
                                       multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        let toAttribute = toView != nil ? NSLayoutAttribute.height : NSLayoutAttribute.notAnAttribute
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .height,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c
                )
    }
    
    public class func centerHorizontallyConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
                                                   multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .centerX,
                                                   toAttribute: .centerX,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func centerVerticallyConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
                                                 multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .centerY,
                                                   toAttribute: .centerY,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func horizontalSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
                                                multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: .leading,
                                                   toAttribute: .trailing,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c)
    }
    
    public class func verticalSpaceConstraint(fromView: UIView, toView: UIView, relation: NSLayoutRelation,
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

     class func createConstraint(fromItem fromView: UIView, toItem toView: UIView?, fromAttribute: NSLayoutAttribute, toAttribute: NSLayoutAttribute,
                                 relatedBy relation: NSLayoutRelation, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {
     
        return NSLayoutConstraint.createConstraint(fromItem: fromView,
                                                   toItem: toView,
                                                   fromAttribute: fromAttribute,
                                                   toAttribute: toAttribute,
                                                   relatedBy: relation,
                                                   multiplier: m,
                                                   constant: c,
                                                   itemUsingAutoLayout: fromView)
    }
    
    class func createConstraint(fromItem fromView: UIView, toItem toView: UIView?, fromAttribute: NSLayoutAttribute, toAttribute: NSLayoutAttribute,
                                relatedBy relation: NSLayoutRelation, multiplier m: CGFloat, constant c: CGFloat, itemUsingAutoLayout: UIView?) -> NSLayoutConstraint {
        
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
