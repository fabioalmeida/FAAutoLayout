//
//  FAAutoLayoutTests.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 03/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests: XCTestCase {

    struct Constants {

        static let spacing : CGFloat = 0.0
    }

    var view: UIView!

    override func setUp() {

        super.setUp()
        self.view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 320.0, height: 600.0))
    }
    
    override func tearDown() {

        self.view = nil
        super.tearDown()
    }


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

    // MARK: - Fill
    
    func testFillContainerBase() {

        let view1 = UIView()
        self.view.addSubview(view1)
        view1.fillContainer()

        self.view.layoutIfNeeded()

        XCTAssertEqual(view1.frame, view.frame)
    }

    func testFillContainerPadding() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let padding: CGFloat = 25.0
        view1.fillContainer(padding)

        self.view.layoutIfNeeded()

        // view1 frame: (25 25; 270 550) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, padding)
        XCTAssertEqual(view1.frame.origin.y, padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - padding*2)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - padding*2)
    }

    func testFillView2Levels() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let v1padding: CGFloat = 20.0
        view1.fillContainer(v1padding)

        let view2 = UIView()
        view1.addSubview(view2)

        let v2padding: CGFloat = 5.0
        view2.fill(view: self.view, constant: v2padding)

        self.view.layoutIfNeeded()

        // view1 frame: (20 20; 280 560) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, v1padding)
        XCTAssertEqual(view1.frame.origin.y, v1padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - v1padding*2)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - v1padding*2)

        // view2 frame: (-15 -15; 310 590) - in relation to superview (view1)
        XCTAssertEqual(view2.frame.origin.x, -(v1padding-v2padding))
        XCTAssertEqual(view2.frame.origin.y, -(v1padding-v2padding))
        XCTAssertEqual(view2.frame.size.width, self.view.frame.size.width - v2padding*2)
        XCTAssertEqual(view2.frame.size.height, self.view.frame.size.height - v2padding*2)

        let relativeView2Frame = view2.superview?.convert(view2.frame, to: self.view)

        // view2 relative frame: (5, 5, 310, 590) - in relation with main container view
        XCTAssertEqual(relativeView2Frame?.origin.x, v2padding)
        XCTAssertEqual(relativeView2Frame?.origin.y, v2padding)
    }

    func testFillView2LevelsInnerMovedLeft() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let v1padding: CGFloat = 20.0
        view1.fillContainer(v1padding)

        let view2 = UIView()
        view1.addSubview(view2)

        let v2padding: CGFloat = 10.0
        let v2leading: CGFloat = 5.0
        view2.fill(view: self.view, constant: v2padding, relation: .lessThanOrEqual, priority: UILayoutPriorityDefaultHigh)
        view2.constrainLeadingSpace(toContainerView: self.view, constant: v2leading)

        self.view.layoutIfNeeded()

        // view1 frame: (20 20; 280 560) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, v1padding)
        XCTAssertEqual(view1.frame.origin.y, v1padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - v1padding*2)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - v1padding*2)

        // view2 frame: (-15 -10; 305 580) - in relation to superview (view1)
        XCTAssertEqual(view2.frame.origin.x, -(v1padding-v2leading))
        XCTAssertEqual(view2.frame.origin.y, -(v1padding-v2padding))
        XCTAssertEqual(view2.frame.size.width, self.view.frame.size.width - v2padding - v2leading)
        XCTAssertEqual(view2.frame.size.height, self.view.frame.size.height - v2padding*2)

        let relativeView2Frame = view2.superview?.convert(view2.frame, to: self.view)

        // view2 relative frame: (5, 10, 305, 580) - in relation with main container view
        XCTAssertEqual(relativeView2Frame?.origin.x, v2leading)
        XCTAssertEqual(relativeView2Frame?.origin.y, v2padding)
    }

    func testFillView2LevelsInnerMovedRight() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let v1padding: CGFloat = 20.0
        view1.fillContainer(v1padding)

        let view2 = UIView()
        view1.addSubview(view2)

        let v2padding: CGFloat = 10.0
        let v2leading: CGFloat = 17.0
        view2.fill(view: self.view, constant: v2padding, relation: .equal, priority: UILayoutPriorityDefaultHigh)
        view2.constrainLeadingSpace(toContainerView: self.view, constant: v2leading)

        self.view.layoutIfNeeded()

        // view1 frame: (20 20; 280 560) - it is only relative to superview
        XCTAssertEqual(view1.frame.origin.x, v1padding)
        XCTAssertEqual(view1.frame.origin.y, v1padding)
        XCTAssertEqual(view1.frame.size.width, self.view.frame.size.width - v1padding*2)
        XCTAssertEqual(view1.frame.size.height, self.view.frame.size.height - v1padding*2)

        // view2 frame: (-3 -10; 293 580) - in relation to superview (view1)
        XCTAssertEqual(view2.frame.origin.x, -(v1padding-v2leading))
        XCTAssertEqual(view2.frame.origin.y, -(v1padding-v2padding))
        XCTAssertEqual(view2.frame.size.width, self.view.frame.size.width - v2padding - v2leading)
        XCTAssertEqual(view2.frame.size.height, self.view.frame.size.height - v2padding*2)

        // view2 relative frame: (17, 10, 293, 580) - in relation with main container view
        let relativeView2Frame = view2.superview?.convert(view2.frame, to: self.view)
        XCTAssertEqual(relativeView2Frame?.origin.x, v2leading)
        XCTAssertEqual(relativeView2Frame?.origin.y, v2padding)
    }
}
