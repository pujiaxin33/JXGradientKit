
Pod::Spec.new do |s|
  s.name         = "JXGradientKit"
  s.version = "0.0.5"
  s.summary      = "常用控件背景渐变色Kit"
  s.homepage     = "https://github.com/pujiaxin33/JXGradientKit"
  s.license      = "MIT"
  s.author       = { "pujiaxin33" => "317437084@qq.com" }
  s.platform     = :ios, "9.0"
  s.swift_version = "5.0"
  s.source       = { :git => "https://github.com/pujiaxin33/JXGradientKit.git", :tag => "#{s.version}" }
  s.framework    = "UIKit"
  s.source_files  = "Sources", "Sources/*.{swift}"
  s.requires_arc = true
end
