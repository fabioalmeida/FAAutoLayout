//
//  FAAutoLayoutTests_Spacing.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 12/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests_Spacing: FAAutoLayoutTests {

    // MARK: - Spacing (2 views)
    
    func testTwoViewsHorizontalSpacing() {

        let leftView = UIView()
        let rightView = UIView()

        self.view.addSubview(leftView)
        self.view.addSubview(rightView)

        let viewSize: CGFloat = 10.0
        let leftViewPadding: CGFloat = 5.0
        let rightViewTopPadding: CGFloat = 12.0
        let viewsHorizontalSpacing: CGFloat = 44.0

        leftView.constrainWidth(viewSize)
        leftView.constrainHeight(viewSize)
        leftView.constrainLeadingSpaceToContainer(leftViewPadding)
        leftView.constrainTopSpaceToContainer(leftViewPadding)

        rightView.constrainWidth(viewSize)
        rightView.constrainHeight(viewSize)
        rightView.constrainTopSpaceToContainer(rightViewTopPadding)

        rightView.constrainHorizontalSpacing(toView: leftView, constant: viewsHorizontalSpacing)

        self.view.layoutIfNeeded()

        // leftView frame: (5 5; 10 10)
        XCTAssertEqual(leftView.frame.origin.x, leftViewPadding)
        XCTAssertEqual(leftView.frame.origin.y, leftViewPadding)
        XCTAssertEqual(leftView.frame.size.width, viewSize)
        XCTAssertEqual(leftView.frame.size.height, viewSize)

        // rightView frame: (59 12; 10 10)
        XCTAssertEqual(rightView.frame.origin.x, leftView.frame.origin.x + viewSize + viewsHorizontalSpacing)
        XCTAssertEqual(rightView.frame.origin.y, rightViewTopPadding)
        XCTAssertEqual(rightView.frame.size.width, viewSize)
        XCTAssertEqual(rightView.frame.size.height, viewSize)
    }

    func testTwoViewsVerticalSpacing() {

        let topView = UIView()
        let bottomView = UIView()

        self.view.addSubview(topView)
        self.view.addSubview(bottomView)

        let viewSize: CGFloat = 10.0
        let topViewPadding: CGFloat = 5.0
        let bottomViewLeftPadding: CGFloat = 12.0
        let viewsVerticalSpacing: CGFloat = 44.0

        topView.constrainWidth(viewSize)
        topView.constrainHeight(viewSize)
        topView.constrainLeadingSpaceToContainer(topViewPadding)
        topView.constrainTopSpaceToContainer(topViewPadding)

        bottomView.constrainWidth(viewSize)
        bottomView.constrainHeight(viewSize)
        bottomView.constrainLeadingSpaceToContainer(bottomViewLeftPadding)

        bottomView.constrainVerticalSpacing(toView: topView, constant: viewsVerticalSpacing)

        self.view.layoutIfNeeded()

        // topView frame: (5 5; 10 10)
        XCTAssertEqual(topView.frame.origin.x, topViewPadding)
        XCTAssertEqual(topView.frame.origin.y, topViewPadding)
        XCTAssertEqual(topView.frame.size.width, viewSize)
        XCTAssertEqual(topView.frame.size.height, viewSize)

        // bottomView frame: (12 59; 10 10)
        XCTAssertEqual(bottomView.frame.origin.x, bottomViewLeftPadding)
        XCTAssertEqual(bottomView.frame.origin.y, topView.frame.origin.y + viewSize + viewsVerticalSpacing)
        XCTAssertEqual(bottomView.frame.size.width, viewSize)
        XCTAssertEqual(bottomView.frame.size.height, viewSize)
    }


    // MARK: Spacing (multiple views)

    func testHorizontalSpacingMultipleViews() {

        let dynamicNumberOfViews = 3
        var dynamicViews = [UIView]()

        let width: CGFloat = 30.0
        let height: CGFloat = 40.0
        let leadingSpacing: CGFloat = 15.0
        let topSpacing: CGFloat = 10.0
        let viewsHorizontalSpacing: CGFloat = 23.0

        for _ in 0..<dynamicNumberOfViews {

            let newView = UIView()

            dynamicViews.append(newView)
            self.view.addSubview(newView)

            newView.constrainWidth(width)
            newView.constrainHeight(height)

            newView.constrainTopSpaceToContainer(topSpacing)
        }

        dynamicViews.first?.constrainLeadingSpaceToContainer(leadingSpacing)

        UIView.constrainEqualHorizontalSpacing(dynamicViews, constant: viewsHorizontalSpacing)

        self.view.layoutIfNeeded()

        // dynamicViews[0] frame: (15 10; 30 40)
        XCTAssertEqual(dynamicViews[0].frame.origin.x, leadingSpacing)
        XCTAssertEqual(dynamicViews[0].frame.origin.y, topSpacing)
        XCTAssertEqual(dynamicViews[0].frame.size.width, width)
        XCTAssertEqual(dynamicViews[0].frame.size.height, height)

        // dynamicViews[1] frame: (68 10; 30 40)
        XCTAssertEqual(dynamicViews[1].frame.origin.x, dynamicViews[0].frame.origin.x + width + viewsHorizontalSpacing)
        XCTAssertEqual(dynamicViews[1].frame.origin.y, topSpacing)
        XCTAssertEqual(dynamicViews[1].frame.size.width, width)
        XCTAssertEqual(dynamicViews[1].frame.size.height, height)

        // dynamicViews[2] frame: (121 10; 30 40)
        XCTAssertEqual(dynamicViews[2].frame.origin.x, dynamicViews[1].frame.origin.x + width + viewsHorizontalSpacing)
        XCTAssertEqual(dynamicViews[2].frame.origin.y, topSpacing)
        XCTAssertEqual(dynamicViews[2].frame.size.width, width)
        XCTAssertEqual(dynamicViews[2].frame.size.height, height)
    }

    func testVerticalSpacingMultipleViews() {

        let dynamicNumberOfViews = 3
        var dynamicViews = [UIView]()

        let width: CGFloat = 30.0
        let height: CGFloat = 40.0
        let leadingSpacing: CGFloat = 15.0
        let topSpacing: CGFloat = 10.0
        let viewsVerticalSpacing: CGFloat = 23.0

        for _ in 0..<dynamicNumberOfViews {

            let newView = UIView()

            dynamicViews.append(newView)
            self.view.addSubview(newView)

            newView.constrainWidth(width)
            newView.constrainHeight(height)

            newView.constrainLeadingSpaceToContainer(leadingSpacing)
        }

        dynamicViews.first?.constrainTopSpaceToContainer(topSpacing)

        UIView.constrainEqualVerticalSpacing(dynamicViews, constant: viewsVerticalSpacing)

        self.view.layoutIfNeeded()

        // dynamicViews[0] frame: (15 10; 30 40)
        XCTAssertEqual(dynamicViews[0].frame.origin.x, leadingSpacing)
        XCTAssertEqual(dynamicViews[0].frame.origin.y, topSpacing)
        XCTAssertEqual(dynamicViews[0].frame.size.width, width)
        XCTAssertEqual(dynamicViews[0].frame.size.height, height)

        // dynamicViews[1] frame: (15 73; 30 40)
        XCTAssertEqual(dynamicViews[1].frame.origin.x, leadingSpacing)
        XCTAssertEqual(dynamicViews[1].frame.origin.y, dynamicViews[0].frame.origin.y + height + viewsVerticalSpacing)
        XCTAssertEqual(dynamicViews[1].frame.size.width, width)
        XCTAssertEqual(dynamicViews[1].frame.size.height, height)

        // dynamicViews[2] frame: (15 136; 30 40)
        XCTAssertEqual(dynamicViews[2].frame.origin.x, leadingSpacing)
        XCTAssertEqual(dynamicViews[2].frame.origin.y, dynamicViews[1].frame.origin.y + height + viewsVerticalSpacing)
        XCTAssertEqual(dynamicViews[2].frame.size.width, width)
        XCTAssertEqual(dynamicViews[2].frame.size.height, height)
    }
}
