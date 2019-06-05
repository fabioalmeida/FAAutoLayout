//
//  FAAutoLayoutTests_WidthHeight.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 03/07/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import XCTest
import FAAutoLayout

class FAAutoLayoutTests_WidthHeight: FAAutoLayoutTests {

    // Lifecycle

    override func setUp() {

        super.setUp()
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Width, Height

    func testWidthHeightBase() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 54
        let height: CGFloat = 37

        view1.constrainLeadingSpaceToContainer()
        view1.constrainTrailingSpaceToContainer()
        view1.constrainWidth(width)
        view1.constrainHeight(height)

        self.view.layoutIfNeeded()

        // view1 frame: (0 0; 53.5 37)
        XCTAssertEqual(view1.frame.origin.x, 0)
        XCTAssertEqual(view1.frame.origin.y, 0)
        XCTAssertEqual(view1.frame.size.width, width)
        XCTAssertEqual(view1.frame.size.height, height)
    }

    func testEqualWidthHeight() {

        let view1 = UIView()
        self.view.addSubview(view1)

        let width: CGFloat = 54
        let height: CGFloat = 37

        view1.constrainLeadingSpaceToContainer()
        view1.constrainTrailingSpaceToContainer()
        view1.constrainWidth(width)
        view1.constrainHeight(height)


        let view2 = UIView()
        self.view.addSubview(view2)

        let leading: CGFloat = 10
        let top: CGFloat = 5

        view2.constrainLeadingSpaceToContainer(leading)
        view2.constrainTopSpaceToContainer(top)
        view2.constrainEqualWidth(toView: view1)
        view2.constrainEqualHeight(toView: view1)


        self.view.layoutIfNeeded()

        // view2 frame: (10 5; 53.5 37)
        XCTAssertEqual(view2.frame.origin.x, leading)
        XCTAssertEqual(view2.frame.origin.y, top)
        XCTAssertEqual(view2.frame.size.width, width)
        XCTAssertEqual(view2.frame.size.height, height)
    }
}
