//
//  FAAutoLayoutTests_Center.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 12/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests_Center: FAAutoLayoutTests {

    // MARK: - Center Container

    func testCenterHorizontallyInContainer() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 100
        let height: CGFloat = 50

        view1.constrainWidth(width)
        view1.constrainHeight(height)
        view1.constrainTopSpaceToContainer()
        view1.centerHorizontallyInContainer()

        self.view.layoutIfNeeded()

        // view1 frame: (110 0; 100 50)
        XCTAssertEqual(view1.frame.origin.x, self.view.frame.size.width/2 - width/2)
        XCTAssertEqual(view1.frame.origin.y, 0)
    }

    func testCenterHorizontallyInContainerOffset() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 100
        let height: CGFloat = 50
        let offset: CGFloat = 13

        view1.constrainWidth(width)
        view1.constrainHeight(height)
        view1.constrainTopSpaceToContainer()
        view1.centerHorizontallyInContainer(offset)

        self.view.layoutIfNeeded()

        // view1 frame: (123 0; 100 50)
        XCTAssertEqual(view1.frame.origin.x, self.view.frame.size.width/2 - width/2 + offset)
        XCTAssertEqual(view1.frame.origin.y, 0)
    }

    func testCenterVerticallyInContainer() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 100
        let height: CGFloat = 50

        view1.constrainWidth(width)
        view1.constrainHeight(height)
        view1.constrainLeadingSpaceToContainer()
        view1.centerVerticallyInContainer()

        self.view.layoutIfNeeded()

        // view1 frame: (0 275; 100 50)
        XCTAssertEqual(view1.frame.origin.x, 0)
        XCTAssertEqual(view1.frame.origin.y, self.view.frame.size.height/2 - height/2)
    }

    func testCenterVerticallyInContainerOffset() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 100
        let height: CGFloat = 50
        let offset: CGFloat = 13

        view1.constrainWidth(width)
        view1.constrainHeight(height)
        view1.constrainLeadingSpaceToContainer()
        view1.centerVerticallyInContainer(offset)

        self.view.layoutIfNeeded()

        // view1 frame: (0 288; 100 50)
        XCTAssertEqual(view1.frame.origin.x, 0)
        XCTAssertEqual(view1.frame.origin.y, self.view.frame.size.height/2 - height/2 + offset)
    }

    func testCenterMiddleInContainer() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 100
        let height: CGFloat = 50

        view1.constrainWidth(width)
        view1.constrainHeight(height)
        view1.centerVerticallyInContainer()
        view1.centerHorizontallyInContainer()

        self.view.layoutIfNeeded()

        // view1 frame: (110 275; 100 50)
        XCTAssertEqual(view1.frame.origin.x, self.view.frame.size.width/2 - width/2)
        XCTAssertEqual(view1.frame.origin.y, self.view.frame.size.height/2 - height/2)
    }


    // MARK: - Center Container View

    func testCenterHorizontallyInContainerView() {

        let containerView = UIView()
        let outerView = UIView()
        let innerView = UIView()

        outerView.addSubview(innerView)
        containerView.addSubview(outerView)
        self.view.addSubview(containerView)

        // containerView frame: (0 0; 320 600)
        containerView.fillContainer()

        let outerPadding: CGFloat = 40.0

        // outerView frame: (40 40; 240 520) - it is only relative to superview
        outerView.fillContainer(outerPadding)

        let width: CGFloat = 100
        let height: CGFloat = 50

        innerView.constrainWidth(width)
        innerView.constrainHeight(height)
        innerView.constrainTopSpaceToContainer()
        innerView.centerHorizontally(withView: containerView)

        self.view.layoutIfNeeded()

        let relativeInnerViewFrame = innerView.superview?.convert(innerView.frame, to: containerView)

        // relativeInnerViewFrame: (110 40; 100 50)
        XCTAssertEqual(relativeInnerViewFrame?.origin.x, containerView.frame.size.width/2 - width/2)
        XCTAssertEqual(relativeInnerViewFrame?.origin.y, outerPadding)
    }

    func testCenterVerticallyInContainerView() {

        let containerView = UIView()
        let outerView = UIView()
        let innerView = UIView()

        outerView.addSubview(innerView)
        containerView.addSubview(outerView)
        self.view.addSubview(containerView)

        // containerView frame: (0 0; 320 600)
        containerView.fillContainer()

        let outerPadding: CGFloat = 40.0

        // outerView frame: (40 40; 240 520) - it is only relative to superview
        outerView.fillContainer(outerPadding)

        let width: CGFloat = 100
        let height: CGFloat = 50

        innerView.constrainWidth(width)
        innerView.constrainHeight(height)
        innerView.constrainLeadingSpaceToContainer()
        innerView.centerVertically(withView: containerView)

        self.view.layoutIfNeeded()

        let relativeInnerViewFrame = innerView.superview?.convert(innerView.frame, to: containerView)

        // relativeInnerViewFrame: (40 275; 100 50)
        XCTAssertEqual(relativeInnerViewFrame?.origin.x, outerPadding)
        XCTAssertEqual(relativeInnerViewFrame?.origin.y, containerView.frame.size.height/2 - height/2)
    }

    func testCenterMiddleInContainerView() {

        let containerView = UIView()
        let outerView = UIView()
        let innerView = UIView()

        outerView.addSubview(innerView)
        containerView.addSubview(outerView)
        self.view.addSubview(containerView)

        // containerView frame: (0 0; 320 600)
        containerView.fillContainer()

        let outerPadding: CGFloat = 40.0

        // outerView frame: (40 40; 240 520) - it is only relative to superview
        outerView.fillContainer(outerPadding)

        let width: CGFloat = 100
        let height: CGFloat = 50

        innerView.constrainWidth(width)
        innerView.constrainHeight(height)
        innerView.centerHorizontally(withView: containerView)
        innerView.centerVertically(withView: containerView)

        self.view.layoutIfNeeded()

        let relativeInnerViewFrame = innerView.superview?.convert(innerView.frame, to: containerView)

        // relativeInnerViewFrame: (110 275; 100 50)
        XCTAssertEqual(relativeInnerViewFrame?.origin.x, containerView.frame.size.width/2 - width/2)
        XCTAssertEqual(relativeInnerViewFrame?.origin.y, containerView.frame.size.height/2 - height/2)
    }
}
