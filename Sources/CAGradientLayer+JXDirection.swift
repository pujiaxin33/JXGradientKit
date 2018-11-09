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

public extension CAGradientLayer {
    public enum JXGradientLayerDirection {
        case leftToRight
        case topToBottom
        case leftTopToRightBottom
        case leftBottomToRightTop
    }

    public var jx_direction: JXGradientLayerDirection {
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
            }
        }
        get {
            let direction = objc_getAssociatedObject(self, &JXGradientLayerDirectionPropertyKey)
            if direction == nil {
                self.jx_direction = .topToBottom
                return .topToBottom
            }
            return direction as! CAGradientLayer.JXGradientLayerDirection
        }
    }
}

