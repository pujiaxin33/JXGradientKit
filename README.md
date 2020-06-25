# 预览
![list](https://github.com/pujiaxin33/JXGradientKit/blob/master/JXGradientKit/Images/List.png)

# 原理
重载UIView的`layerClass`方法，返回`CAGradientLayer`，达到控件背景为渐变色。

# 要求

iOS: 9+
XCode: 12+
swift: 5.0+

# 控件种类

- GradientLabel
- GradientView
- GradientButton
- GradientImageButton
- GradientTextField
- GradientTextView

# 使用

## XIB可视化编辑
![XIB](https://github.com/pujiaxin33/JXGradientKit/blob/master/JXGradientKit/Images/XIBGradient.png)

## 代码使用

### 使用`JXGradientViewProtocol`协议约定的便利属性
```Swift
gradientView.direction = JXGradientLayerDirection.leftToRight
gradientView.startColor = firstColor
gradientView.endColor = secondColor
```

### 直接配置`CAGradientLayer`
```Swift
gradientView.gradientLayer.colors = [firstColor, secondColor]
```

# 安装

## CocoaPods
```ruby
use_frameworks!
target '<Your Target Name>' do
    pod 'JXGradientKit'
end
```


