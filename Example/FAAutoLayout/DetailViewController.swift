//
//  DetailViewController.swift
//  FAAutoLayout
//
//  Created by Fábio Almeida on 18/06/2017.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import UIKit
import FAAutoLayout

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
    }

    // MARK: - Private

    private func addSubviews() {

        let dynamicNumberOfViews = 5
        var dynamicViews = [UIView]()

        for _ in 0..<dynamicNumberOfViews {

            let newView = UIView()
            newView.backgroundColor = .blue
            dynamicViews.append(newView)
            self.view.addSubview(newView)

            // add constraints
            newView.constrainHeight(50.0)
            newView.constrainTopSpaceToContainer(15.0)
        }

        // as you can see here, these methods are not called on some UIView instance but are UIView class methods
        UIView.constrainEqualWidth(dynamicViews)
        UIView.constrainEqualHorizontalSpacing(dynamicViews, constant: 30.0)

        dynamicViews.first?.constrainLeadingSpaceToContainer(15.0)
        dynamicViews.last?.constrainTrailingSpaceToContainer(15.0)
    }

}
