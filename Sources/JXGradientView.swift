//
//  JXGradientView.swift
//  JXGradientKit
//
//  Created by jiaxin on 2018/11/7.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

@IBDesignable
open class JXGradientView: UIView, JXGradientViewProtocol {
    open class override var layerClass: Swift.AnyClass {
        get {
            return CAGradientLayer.classForCoder()
        }
    }
    @IBInspectable
    public var startColor: UIColor? {
        didSet {
            refreshGradientLayer()
        }
    }
    @IBInspectable
    public var middleColor: UIColor? {
        didSet {
            refreshGradientLayer()
        }
    }
    @IBInspectable
    public var endColor: UIColor? {
        didSet {
            refreshGradientLayer()
        }
    }
    @IBInspectable
    public var direction: Int = 0 {
        didSet {
            refreshGradientLayer()
        }
    }
    @IBInspectable
    public var angle: CGFloat = 0 {
        didSet {
            refreshGradientLayer()
        }
    }
    @IBInspectable
    public var locations: String? {
        didSet {
            refreshGradientLayer()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        refreshGradientLayer()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        refreshGradientLayer()
    }
}
