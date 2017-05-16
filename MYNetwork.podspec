Pod::Spec.new do |s|
  s.name         = "MYNetwork"
  s.version      = "0.0.1"
  s.summary      = "MYNetWork is a high level request util based on AFNetworking."
  s.homepage     = "https://github.com/LoveSonwYear/MYNetWork"
  s.license      = "MIT"
  s.author             = { "梅洋" => "meiyang_1228@163.com" }
  s.source       = { :git => "https://github.com/LoveSonwYear/MYNetwork.git", :tag => "1.0.0" }
  s.source_files  = "MYNetWork", "MYNetwork/**/*.{h,m}"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.framework  = "UIKit"
  s.dependency "AFNetworking"
  s.dependency "MJExtension"
end
