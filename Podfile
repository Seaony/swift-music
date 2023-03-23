# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Moon' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MyCloudMusic
  #提供类似Android中更高层级的布局框架
  #https://github.com/youngsoft/TangramKit
  pod 'TangramKit'
  
  #将资源（图片，文件等）生成类，方便到代码中方法
  #例如：let icon = R.image.settingsIcon()
  #let font = R.font.sanFrancisco(size: 42)
  #let color = R.color.indicatorHighlight()
  #let viewController = CustomViewController(nib: R.nib.customView)
  #let string = R.string.localizable.welcomeWithName("Arthur Dent")
  #https://github.com/mac-cain13/R.swift
  pod 'R.swift'
  
  #颜色工具类
  #https://github.com/yannickl/DynamicColor
  pod "DynamicColor"

  #腾讯开源的UI框架，提供了很多功能，例如：圆角按钮，空心按钮，TextView支持placeholder
  #https://github.com/QMUI/QMUIDemo_iOS
  #https://qmuiteam.com/ios/get-started
  pod "QMUIKit"

  #图片加载
  #https://github.com/SDWebImage/SDWebImage
  pod 'SDWebImage'

  target 'MoonTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MoonUITests' do
    # Pods for testing
  end

end