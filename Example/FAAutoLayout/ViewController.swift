//
//  ViewController.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 12/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit
import FAAutoLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Private

    private func addSubviews() {

        // initial view, ajusting container view with a padding of 25pt on all sides
        let view1 = UIView()
        view1.backgroundColor = UIColor.lightGray
        self.view.addSubview(view1)
        view1.fillContainer(25.0)


        // view2 which sits on the top-left corner of view1, with a top padding of 10pt
        let view2 = UIView()
        view2.backgroundColor = UIColor.blue
        view1.addSubview(view2)

        view2.constrainLeadingSpaceToContainer()
        view2.constrainTopSpaceToContainer(10.0)
        view2.constrainWidth(150.0)
        view2.constrainHeight(45.0)

        // view3, sitting right bellow view2
        let view3 = UIView()
        view3.backgroundColor = UIColor.red
        view1.addSubview(view3)

        view3.constrainLeadingSpaceToContainer(10.0)
        view3.constrainVerticalSpacing(toView: view2, constant: 5.0)
        view3.constrainWidth(100.0)
        view3.constrainHeight(20.0)

    }
}

