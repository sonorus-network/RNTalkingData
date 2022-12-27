require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNTalkingData"
  s.version      = package['version']
  s.summary      = package['description']
  s.description  = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "412484577@qq.com" }
  s.platform     = :ios, "12.0"
  s.source       = { :git => "https://gitlab.com/liuhy412484577/react-native-talkingdata.git", :tag => "main" }
  s.source_files  = "ios/**/*.{h,m}"
  s.resources     = ['*.bundle', '*.strings']
  s.requires_arc = true

  s.vendored_libraries = "ios/libTalkingDataSDK.a"
  s.frameworks = 'AdServices', 'iAd', 'StoreKit', 'AppTrackingTransparency', 'AdSupport', 'CoreTelephony', 'Security', 'SystemConfiguration'
  # 这里依赖的系统库要去掉前缀 lib: libc++ libz
  s.libraries = 'c++', 'z'

  s.dependency "React"
  #s.dependency "others"

end

  