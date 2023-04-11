Pod::Spec.new do |s|
  s.name            = 'QRTCSDK'
  s.version         = "0.1.0"
  s.summary         = 'quicnav rtc'
  s.description     = 'quicnav rtc library'
  s.homepage        = 'https://github.com/xxx/QRTCSDK'
  s.source          = { :git => 'https://github.com/xxx/QRTCSDK.git', :tag => '0.1.0' }
  s.author          = 'mac'
  s.license         = 'GPLv3'

  s.source_files = 'Sources/**/*.{h,m,mm}'

  s.ios.deployment_target = '10.0'
  s.swift_version   = '5.0'

  s.requires_arc = true
  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "CLANG_CXX_LIBRARY" => "libc++",
    "OTHER_CPLUSPLUSFLAGS" => '"-stdlib=libc++" "-Wall" "-Wextra" "-Wpedantic"',
    "VALID_ARCHS" => "$(ARCHS_STANDARD_64_BIT)",
    "HEADER_SEARCH_PATHS" => '"$(PODS_TARGET_SRCROOT)/Libs/include/abseil-cpp" "$(PODS_TARGET_SRCROOT)/Libs/include/mediasoupclient" "$(PODS_TARGET_SRCROOT)/Libs/include/sdptransform" "$(PODS_TARGET_SRCROOT)/Libs/include/webrtc"',
    "OTHER_LDFLAGS" => "-ObjC",
  }

  s.vendored_frameworks = 'QRTCSDK.framework'

  s.frameworks = ["AVFoundation", "AudioToolbox", "CoreAudio", "CoreMedia", "CoreVideo", "CoreGraphics", "VideoToolbox", "GLKit", "AVKit"]
  s.library = 'network'
  s.public_header_files = 'Sources/mediasoup/include/*.h', 'Sources/webrtc/WebRTC/*.h'
end



