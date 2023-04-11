Pod::Spec.new do |s|
  s.name            = 'QRTCRoomClient'
  s.version         = "0.1.0"
  s.summary         = 'quicnav room client'
  s.description     = 'quicnav room client'
  s.homepage        = 'https://github.com/xxx/QRTCRoomClient'
  s.source          = { :git => 'https://github.com/xxx/QRTC.git', :tag => '0.1.0' }
  s.author          = 'mac'
  s.license         = 'GPLv3'

  s.source_files = 'Sources/**/*.{h,c,m,swift}'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.dependency 'QRTCSDK'
  s.dependency 'SwiftyJSON'
  s.dependency 'HydraAsync'
  s.dependency 'Starscream'

  s.vendored_frameworks = 'QRTCRoomClient.framework'
end


