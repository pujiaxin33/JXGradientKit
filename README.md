# JXGradientKit
常用控件背景渐变色Kit

# 原理
重载UIView的`layerClass`方法，返回`CAGradientLayer`，达到控件背景为渐变色。

# 控件

- JXGradientLabel
- JXGradientView
- JXGradientButton
- JXGradientTextField
- JXGradientTextView

# JXGradientLabel实现示例
```
open class JXGradientLabel: UILabel {
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
        gradientLayer.jx_direction = .leftToRight
    }

    public var gradientLayer: CAGradientLayer {
        get {
            return self.layer as! CAGradientLayer
        }
    }
}
```

# JXGradientLayerDirection
```
public enum JXGradientLayerDirection {
        case leftToRight
        case topToBottom
        case leftTopToRightBottom
        case leftBottomToRightTop
    }
```

- 使用
```
gradientLabel.gradientLayer.jx_direction = .leftToRight
gradientLabel.gradientLayer.colors = [firstColor, secondColor]
```

# 安装
```ruby
use_frameworks!
target '<Your Target Name>' do
    pod 'JXGradientKit'
end
```


