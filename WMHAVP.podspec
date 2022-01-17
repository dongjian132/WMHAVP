#
# Be sure to run `pod lib lint WMHAVP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WMHAVP'
  s.version          = '0.1.0'
  s.summary          = 'WMHAVP组件库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
威马项目中的WMHAVP是核心停泊电动车的一个功能，包括了视频教程和各种蓝牙和网络控制，总之，使用了威马后，你的生活更智能，出行更方便了，感谢大家的使用，这里不做更多介绍了。
                       DESC

  s.homepage         = 'https://github.com/dongjian132/WMHAVP'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '13260444370@163.com' => 'jian1.dong@wm-motor.com' }
  s.source           = { :git => 'https://github.com/dongjian132/WMHAVP.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'WMHAVP/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WMHAVP' => ['WMHAVP/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
