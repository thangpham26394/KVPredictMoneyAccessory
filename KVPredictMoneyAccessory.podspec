#
# Be sure to run `pod lib lint KVPredictMoneyAccessory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KVPredictMoneyAccessory'
  s.version          = '1.0.2'
  s.summary          = 'View dự đoán giá tiền khách có thể đưa dựa trên số tiền khách cần trả'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Accessory view hiển thị các giá trị tiền user có thể nhập dựa vào số tiền input
                       DESC

  s.homepage         = 'https://github.com/thangpham26394/KVPredictMoneyAccessory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'thangpham26394' => 'thang.pd@citigo.com.vn' }
  s.source           = { :git => 'https://github.com/thangpham26394/KVPredictMoneyAccessory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KVPredictMoneyAccessory/Classes/*.{h,m}'
  
  # s.resource_bundles = {
  #   'KVPredictMoneyAccessory' => ['KVPredictMoneyAccessory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
