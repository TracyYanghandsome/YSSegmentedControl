#
#  Be sure to run `pod spec lint YSSegmentedControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "YSSegmentedControl_iOS"
  s.version      = "0.0.1"
  s.summary      = "类似于新闻的滑动视图"
  s.homepage     = "https://github.com/TracyYanghandsome/YSSegmentedControl"
  s.license      = "MIT"
  s.author             = { "TracyYanghandsome" => "2224202043@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/TracyYanghandsome/YSSegmentedControl.git", :tag => "0.0.1" }
  s.source_files  = "YSSegmentedControl", "YSsegement/**/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true

end
