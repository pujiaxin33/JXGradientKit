//
//  ViewController.swift
//  JXGradientKit
//
//  Created by jiaxin on 2018/11/7.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var gradientView: JXGradientView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstColor = UIColor(red: 0/255.0, green: 185/255.0, blue: 172/255.0, alpha: 1).cgColor
        let secondColor = UIColor(red: 86/255.0, green: 126/255.0, blue: 177/255.0, alpha: 1).cgColor
        gradientView.gradientLayer.colors = [firstColor, secondColor]
    }


}

