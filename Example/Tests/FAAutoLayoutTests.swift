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

    var view: UIView!

    override func setUp() {

        super.setUp()
        self.view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 320.0, height: 600.0))
    }
    
    override func tearDown() {

        self.view = nil
        super.tearDown()
    }
}
