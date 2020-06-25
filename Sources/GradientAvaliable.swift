//
//  JXGradientViewProtocol.swift
//  JXGradientKit
//
//  Created by jiaxin on 2019/5/6.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation
import UIKit

@objc public enum GradientDirection: Int {
    case leftToRight
    case topToBottom
    case leftTopToRightBottom
    case leftBottomToRightTop
    case custom
}

/// 通过startColor、direction、locations等属性，可用于XIB可视化编辑。也可以访问gradientLayer直接设置渐变色属性。
public protocol GradientAvaliable {
    var gradientLayer: CAGradientLayer { get }
    var startColor: UIColor? { set get }
    var middleColor: UIColor? { set get }
    var endColor: UIColor? { set get }
    var colors: [UIColor]? { set get }
    var direction: GradientDirection { set get }
    /// 渐变色的角度
    /// 只有在`direction == .custom`时有效
    var angle: CGFloat { set get }
    /// 通过英文状态下的逗号分隔开参数，比如："0.3,0.6"。
    /// 为什么是String类型的？因为XIB不支持数组类型，通过字符串曲线救国，实现XIB可视化配置。
    /// 如果你通过代码配置`JXGradientView`，可以直接通过gradientLayer.locations配置，避免使用字符串出错。
    var locations: String? { set get }

    func refreshGradient()
}

public extension GradientAvaliable where Self: UIView {
    var gradientLayer: CAGradientLayer {
        get {
            return self.layer as! CAGradientLayer
        }
    }
}

public extension GradientAvaliable {
    func refreshGradient() {
        var colorsArray = [CGColor]()
        if colors?.isEmpty == false {
            colorsArray = colors!.map { $0.cgColor }
        }else {
            colorsArray.append((self.startColor ?? .clear).cgColor)
            if middleColor != nil {
                colorsArray.append(middleColor!.cgColor)
            }
            colorsArray.append((self.endColor ?? .clear).cgColor)
        }
        gradientLayer.colors = colorsArray

        switch direction {
            case .leftToRight:
                gradientLayer.startPoint = CGPoint(x: 0, y: 0)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            case .topToBottom:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            case .leftTopToRightBottom:
                gradientLayer.startPoint = CGPoint(x: 0, y: 0)
                gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            case .leftBottomToRightTop:
                gradientLayer.startPoint = CGPoint(x: 0, y: 1)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            case .custom:
                let (startPoint, endPoint) = gradientPointsForAngle(angle)
                gradientLayer.startPoint = startPoint
                gradientLayer.endPoint = endPoint
        }

        if let locations = self.locations {
            let components = locations.components(separatedBy: ",")
            var locationNumbers = [NSNumber]()
            for component in components {
                if let location = Double(component) {
                    locationNumbers.append(NSNumber(value: location))
                }
            }
            gradientLayer.locations = locationNumbers
        }
    }

    // create vector pointing in direction of angle
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        // get vector start and end points
        let end = pointForAngle(angle)
        //let start = pointForAngle(angle+180.0)
        let start = oppositePoint(end)
        // convert to gradient space
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        return (p0, p1)
    }

    // get a point corresponding to the angle
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        // convert degrees to radians
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
        if (abs(x) > abs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }

    // transform point in unit space to gradient space
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        // input point is in signed unit space: (-1,-1) to (1,1)
        // convert to gradient space: (0,0) to (1,1), with flipped Y axis
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }

    // return the opposite point in the signed unit square
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
}

extension UIImage {
    class func gradientImageWithLayer(_ layer: CAGradientLayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
