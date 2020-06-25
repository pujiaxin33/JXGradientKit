//
//  GradientImageButton.swift
//  JXGradientKit
//
//  Created by jiaxin on 2020/6/25.
//  Copyright © 2020 jiaxin. All rights reserved.
//

import UIKit

@IBDesignable
open class GradientImageButton: UIButton, GradientAvaliable {
    public var gradientLayer: CAGradientLayer = CAGradientLayer()

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
    public var direction: GradientDirection = .custom {
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

    open override func layoutSubviews() {
        super.layoutSubviews()

        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
            let image = UIImage.gradientImageWithLayer(gradientLayer)
            setBackgroundImage(image, for: .normal)
        }
    }

}
