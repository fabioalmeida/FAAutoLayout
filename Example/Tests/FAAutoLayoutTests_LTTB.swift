//
//  FAAutoLayoutTests_LTTB.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 03/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests_LTTB: FAAutoLayoutTests {

    // MARK: - Leading, Trailing, Top, Bottom

    func testAroundContainerBase() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let leading: CGFloat = 5.0
        let padding: CGFloat = 15.0

        view1.constrainLeadingSpaceToContainer(leading)
        view1.constrainTrailingSpaceToContainer(padding)
        view1.constrainTopSpaceToContainer(padding)
        view1.constrainBottomSpaceToContainer(padding)

        self.view.layoutIfNeeded()

        // view1 frame: (5 15; 300 570) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, leading)
        XCTAssertEqual(view1.frame.origin.y, padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - leading - padding)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - padding*2)
    }

    func testAroundOtherContainerBase() {

        let outerView = UIView()
        let innerView = UIView()

        outerView.addSubview(innerView)
        self.view.addSubview(outerView)

        let outerPadding: CGFloat = 20.0
        let innerPadding: CGFloat = 10.0

        outerView.fillContainer(outerPadding)

        innerView.constrainLeadingSpace(toContainerView: self.view, constant: innerPadding)
        innerView.constrainTrailingSpace(toContainerView: self.view, constant: innerPadding)
        innerView.constrainTopSpace(toContainerView: self.view, constant: innerPadding)
        innerView.constrainBottomSpace(toContainerView: self.view, constant: innerPadding)

        self.view.layoutIfNeeded()

        // outerView frame: (20 20; 280 560) - it is only relative to superview
        XCTAssertEqual(outerView.frame.origin.x, outerPadding)
        XCTAssertEqual(outerView.frame.origin.y, outerPadding)
        XCTAssertEqual(outerView.frame.size.width, self.view.frame.size.width - outerPadding*2)
        XCTAssertEqual(outerView.frame.size.height, self.view.frame.size.height - outerPadding*2)

        // innerView frame: (-10 -10; 300 580) - it is only relative to superview
        XCTAssertEqual(innerView.frame.origin.x, -innerPadding)
        XCTAssertEqual(innerView.frame.origin.y, -innerPadding)
        XCTAssertEqual(innerView.frame.size.width, self.view.frame.size.width - innerPadding*2)
        XCTAssertEqual(innerView.frame.size.height, self.view.frame.size.height - innerPadding*2)

        let relativeInnerViewFrame = innerView.superview?.convert(innerView.frame, to: self.view)

        // relativeInnerViewFrame: (10 10; 300 580)
        XCTAssertEqual(relativeInnerViewFrame?.origin.x, innerPadding)
        XCTAssertEqual(relativeInnerViewFrame?.origin.y, innerPadding)
        XCTAssertEqual(relativeInnerViewFrame?.size.width, self.view.frame.size.width - innerPadding*2)
        XCTAssertEqual(relativeInnerViewFrame?.size.height, self.view.frame.size.height - innerPadding*2)

    }

    func testLeadingContainerMultiplier() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let leading: CGFloat = 50.0
        let padding: CGFloat = 15.0
        let multiplier: CGFloat = 0.2

        view1.constrainLeadingSpaceToContainer(leading, relation: .equal, priority: UILayoutPriorityDefaultHigh, multiplier: multiplier)
        view1.constrainTrailingSpaceToContainer(padding)
        view1.constrainTopSpaceToContainer(padding)
        view1.constrainBottomSpaceToContainer(padding)

        view.layoutIfNeeded()

        // view1 frame: (5 15; 300 570) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, leading)
        XCTAssertEqual(view1.frame.origin.y, padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - leading - padding)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - padding*2)
    }
}
