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

        //直接通过gradientLayer配置
        let firstColor = UIColor(red: 0/255.0, green: 185/255.0, blue: 172/255.0, alpha: 1)
        let secondColor = UIColor(red: 86/255.0, green: 126/255.0, blue: 177/255.0, alpha: 1)
        gradientView.gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]

        //通过便利属性配置
//        gradientView.direction = JXGradientLayerDirection.leftToRight.rawValue
//        gradientView.startColor = firstColor
//        gradientView.endColor = secondColor
    }


}

