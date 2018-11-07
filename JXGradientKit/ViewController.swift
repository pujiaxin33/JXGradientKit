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
    @IBOutlet weak var gradientLabel: JXGradientLabel!
    @IBOutlet weak var gradientButton: JXGradientButton!
    @IBOutlet weak var gradientTextField: JXGradientTextField!
    @IBOutlet weak var gradientTextView: JXGradientTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstColor = UIColor(red: 0/255.0, green: 185/255.0, blue: 172/255.0, alpha: 1).cgColor
        let secondColor = UIColor(red: 86/255.0, green: 226/255.0, blue: 177/255.0, alpha: 1).cgColor
        gradientView.gradientLayer.colors = [firstColor, secondColor]
        gradientLabel.gradientLayer.colors = [firstColor, secondColor]
        gradientButton.gradientLayer.colors = [firstColor, secondColor]
        gradientTextField.gradientLayer.colors = [firstColor, secondColor]
        gradientTextView.gradientLayer.colors = [firstColor, secondColor]
    }


}

