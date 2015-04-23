# Uncomment this line to define a global platform for your project
#
#执行命令可以监控执行过程
#pod install/update --verbose --no-repo-update


#设置一个静态库的最低支持的系统版本，ios默认是4.3
platform :ios, '7.0'
#设置隐藏pod library的所有警告
inhibit_all_warnings!

#设置包含所有引用工程的workspace
#默认取podfile所在目录的工程名
workspace 'NLDynamicDeploy_React'

#设置包含target的xcode project，用于被pod library链接
#默认取当前podfile所在目录的project
xcodeproj 'NLDynamicDeploy_React'

target :NLDynamicDeploy_React do
    pod 'React', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTWebSocketDebugger', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTVibration', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTText', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTPushNotification', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTNetwork', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTImage', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTGeolocation', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTAnimationExperimental', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTAdSupport', :git => 'https://github.com/facebook/react-native.git'
    pod 'React/RCTActionSheet', :git => 'https://github.com/facebook/react-native.git'
    
    
    #设置pod target需要link的工程target
    #默认链接当前工程中的第一个target
    link_with 'NLDynamicDeploy_React'
end

