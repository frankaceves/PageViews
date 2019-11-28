//
//  GradientViewController.swift
//  PageViews
//
//  Created by Frank Aceves on 11/15/19.
//  Copyright © 2019 Frank Aceves. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer()
        let purple = UIColor(red:0.35, green:0.17, blue:0.47, alpha:1.0).cgColor
        let green = UIColor(red:0.39, green:0.74, blue:0.60, alpha:1.0).cgColor
        layer.colors = [purple, green]
        layer.locations = [0,0.5,1]
        layer.frame = view.bounds
        view.layer.insertSublayer(layer, at: 0)
    }
}
