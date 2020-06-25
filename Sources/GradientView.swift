//
//  JXGradientView.swift
//  JXGradientKit
//
//  Created by jiaxin on 2018/11/7.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

@IBDesignable
open class GradientView: UIView, GradientAvaliable {
    open class override var layerClass: Swift.AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    public var colors: [UIColor]? {
           didSet {
               refreshGradient()
           }
       }
    @IBInspectable
    public var startColor: UIColor? {
        didSet {
            refreshGradient()
        }
    }
    @IBInspectable
    public var middleColor: UIColor? {
        didSet {
            refreshGradient()
        }
    }
    @IBInspectable
    public var endColor: UIColor? {
        didSet {
            refreshGradient()
        }
    }
    @IBInspectable
    public var direction: GradientDirection = .leftToRight {
        didSet {
            refreshGradient()
        }
    }
    @IBInspectable
    public var angle: CGFloat = 0 {
        didSet {
            refreshGradient()
        }
    }
    @IBInspectable
    public var locations: String? {
        didSet {
            refreshGradient()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        refreshGradient()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        refreshGradient()
    }
}
