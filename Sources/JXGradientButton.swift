//
//  JXGradientButton.swift
//  JXGradientKit
//
//  Created by jiaxin on 2018/11/7.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

open class JXGradientButton: UIButton {
    open class override var layerClass: Swift.AnyClass {
        get {
            return CAGradientLayer.classForCoder()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        initializeViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initializeViews()
    }

    open func initializeViews() {
        gradientLayer.jx_direction = .leftBottomToRightTop
    }

    public var gradientLayer: CAGradientLayer {
        get {
            return self.layer as! CAGradientLayer
        }
    }
}
