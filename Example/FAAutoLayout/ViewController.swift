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

    // MARK: Private

    private func addSubviews() {

        // background view that adjusts the container view without any padding
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightGray
        self.view.addSubview(backgroundView)
        self.view.sendSubview(toBack: backgroundView)

        backgroundView.fillContainer()


        // view which sits on the top-left corner of the background view, with a fixed width and height
        let topLeftView = UIView()
        topLeftView.backgroundColor = .blue
        backgroundView.addSubview(topLeftView)

        topLeftView.constrainLeadingSpaceToContainer()
        topLeftView.constrainTopSpaceToContainer(10)
        topLeftView.constrainWidth(150)
        topLeftView.constrainHeight(45)


        // view that is positioned on the right on relation with topLeftView
        let topRightView = UIView()
        topRightView.backgroundColor = .red
        backgroundView.addSubview(topRightView)

        topRightView.constrainTopSpaceToContainer(10)
        topRightView.constrainTrailingSpaceToContainer(30)
        topRightView.constrainHorizontalSpacing(toView: topLeftView, constant: 20)
        topRightView.constrainEqualHeight(toView: topLeftView, constant: 0, relation: .equal, priority: .required, multiplier: 2)


        // container view that will sit below topLeftView
        let containerView1 = UIView()
        containerView1.backgroundColor = .green
        backgroundView.addSubview(containerView1)

        containerView1.constrainWidth(200)
        containerView1.constrainHeight(200)
        containerView1.constrainVerticalSpacing(toView: topLeftView, constant: 100)
        containerView1.constrainLeadingSpaceToContainer(10)


        // view that will adapt to containerView1
        let containerView2 = UIView()
        containerView2.backgroundColor = .black
        containerView1.addSubview(containerView2)

        containerView2.fillContainer(40)


        // view that that despite being inside containerView2, will adapt to containerView1
        let containerView3 = UIView()
        containerView3.backgroundColor = .orange
        containerView3.alpha = 0.5
        containerView2.addSubview(containerView3)

        containerView3.fill(view: containerView1, constant: 20)
    }
}

