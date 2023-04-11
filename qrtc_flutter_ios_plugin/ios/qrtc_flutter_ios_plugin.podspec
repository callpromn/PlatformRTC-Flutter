Pod::Spec.new do |s|
  s.name             = 'qrtc_flutter_ios_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for QRTC'
  s.description      = <<-DESC
A Flutter plugin for QRTC
                       DESC
  s.homepage         = 'https://www.callpro.mn'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Otgonbayar' => 'otgonbayar@callpro.mn' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Starscream', '~> 3.0.2'
  s.dependency 'SwiftyJSON', '~> 4.0'
  s.dependency 'HydraAsync'
  s.dependency 'RxSwift', '~> 5'
  s.dependency 'RxCocoa', '~> 5'
  s.dependency 'SnapKit'
  s.dependency 'Toast-Swift'
  s.dependency 'Material'
  s.dependency 'SDWebImage'
  s.dependency 'Alamofire', '~> 5.2'
  
  s.vendored_frameworks = 'Libs/QRTCSDK/QRTCSDK.framework', 'Libs/QRTCRoomClient/QRTCRoomClient.framework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

end
