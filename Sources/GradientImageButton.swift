//
//  GradientImageButton.swift
//  JXGradientKit
//
//  Created by jiaxin on 2020/6/25.
//  Copyright © 2020 jiaxin. All rights reserved.
//

import UIKit

/// 配置gradientLayer的属性无法生效，使用GradientImageButton的相关属性才行。
@IBDesignable
open class GradientImageButton: UIButton, GradientAvaliable {
    public private(set) var gradientLayer: CAGradientLayer = CAGradientLayer()
    var isLayouted = false

    public var colors: [UIColor]? {
           didSet {
                refreshGradient()
                updateBackroundImageIfNeeded()
           }
       }
    @IBInspectable
    public var startColor: UIColor? {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
        }
    }
    @IBInspectable
    public var middleColor: UIColor? {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
        }
    }
    @IBInspectable
    public var endColor: UIColor? {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
        }
    }
    @IBInspectable
    public var direction: GradientDirection = .leftToRight {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
        }
    }
    @IBInspectable
    public var angle: CGFloat = 0 {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
        }
    }
    @IBInspectable
    public var locations: String? {
        didSet {
            refreshGradient()
            updateBackroundImageIfNeeded()
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
            isLayouted = true
            gradientLayer.frame = bounds
            let image = UIImage.gradientImageWithLayer(gradientLayer)
            setBackgroundImage(image, for: .normal)
        }
    }

    func updateBackroundImageIfNeeded() {
        if isLayouted {
            let image = UIImage.gradientImageWithLayer(gradientLayer)
            setBackgroundImage(image, for: .normal)
        }
    }

}
