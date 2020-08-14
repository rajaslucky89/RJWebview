#
#  Be sure to run `pod spec lint RJWebView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

spec.name         = "RJWebView"
spec.version      = "0.0.3"
spec.summary      = "A RJWebView written in Swift for iOS"
spec.description  = <<-DESC
 A much longer description of MyFramework
DESC

spec.homepage     = "https://github.com/rajaslucky89/RJWebview"
# spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

#spec.license      = "Copyright"
spec.license      = { :type => "Copyright", :text => "LICENSE" }

spec.author             = { "Raja Syahmudin" => "rajaslucky89@gmail.com" }
#spec.social_media_url   = "https://id.linkedin.com/in/raja-syahmudin-harahap-8b125849"

spec.platform     = :ios
spec.ios.deployment_target = "12.1"
spec.swift_version = "4.2"

spec.source       = { :git => "https://github.com/rajaslucky89/RJWebview.git", :tag => "#{spec.version}" }
#spec.source_files  = "RJWebView/Classes/**/*.{h,m,swift,xib}"
spec.exclude_files = "RJWebView/Classes/*.plist"

spec.source_files = "RJWebView/Classes/**/*"
spec.resource_bundles = {
  'RJWebView' => ["RJWebView/Classes/**/*.{storyboard,xib}"]
}
 
#spec.requires_arc = true

# spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# spec.dependency "JSONKit", "~> 1.4"


end
