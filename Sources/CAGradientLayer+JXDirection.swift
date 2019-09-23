//
//  CAGradientLayer+JXDirection.swift
//  JXGradientKit
//
//  Created by jiaxin on 2018/11/7.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation
import UIKit

private var JXGradientLayerDirectionPropertyKey = "JXGradientLayerDirectionPropertyKey"

public enum JXGradientLayerDirection: Int {
    case leftToRight
    case topToBottom
    case leftTopToRightBottom
    case leftBottomToRightTop
    case custom
}

public extension CAGradientLayer {
    var jx_direction: JXGradientLayerDirection {
        set(newDirection) {
            objc_setAssociatedObject(self, &JXGradientLayerDirectionPropertyKey, newDirection, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            switch newDirection {
            case .leftToRight:
                self.startPoint = CGPoint(x: 0, y: 0)
                self.endPoint = CGPoint(x: 1, y: 0)
            case .topToBottom:
                self.startPoint = CGPoint(x: 0.5, y: 0)
                self.endPoint = CGPoint(x: 0.5, y: 1)
            case .leftTopToRightBottom:
                self.startPoint = CGPoint(x: 0, y: 0)
                self.endPoint = CGPoint(x: 1, y: 1)
            case .leftBottomToRightTop:
                self.startPoint = CGPoint(x: 0, y: 1)
                self.endPoint = CGPoint(x: 1, y: 0)
            default:
                break
            }
        }
        get {
            let direction = objc_getAssociatedObject(self, &JXGradientLayerDirectionPropertyKey)
            if direction == nil {
                self.jx_direction = .leftToRight
                return .leftToRight
            }
            return direction as! JXGradientLayerDirection
        }
    }
}

