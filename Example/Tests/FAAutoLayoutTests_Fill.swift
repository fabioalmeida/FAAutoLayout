//
//  FAAutoLayoutTests_Fill.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 03/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests_Fill: FAAutoLayoutTests {

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
