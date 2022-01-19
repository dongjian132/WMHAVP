#
# Be sure to run `pod lib lint WMHAVP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WMHAVP'
  s.version          = '0.1.1'
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
  
  #deployment_target
  s.ios.deployment_target = '11.0'
  
  # source_files
  s.source_files = 'WMHAVP/Classes/**/*'
  
  s.subspec 'Extention&Category' do |sp|
    sp.source_files = 'WMHAVP/Classes/NSDate+Category.{h,m}'
  end

  s.subspec 'Macros' do |sp|
    sp.source_files = 'WMHAVP/Classes/CommonMacros.h', 'WMHAVP/Classes/FontAndColorMacros.h'
  end
  
  # resource_bundles
  s.resource_bundles = {
     'WMHAVP' => ['WMHAVP/Assets/*.png']
  }
  # public_header_files
  s.public_header_files = 'WMHAVP/Classes/**/*.h'
  # frameworks
  s.frameworks = 'UIKit', 'MapKit', 'WebKit', 'Photos', 'PhotosUI', 'QuartzCore', 'CoreData', 'CFNetwork'
  # 依赖库
  s.dependency 'AFNetworking','4.0.1'
  s.dependency 'SDWebImage','5.9.5'
  s.dependency 'Masonry','1.1.0'
  
end
