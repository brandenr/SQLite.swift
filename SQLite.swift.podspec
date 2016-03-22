#
# `pod lib lint SQLite.swift.podspec' fails - see
#    https://github.com/CocoaPods/CocoaPods/issues/4607
#

Pod::Spec.new do |s|
  s.name             = "SQLite.swift"
  s.version          = "0.9.6"
  s.summary          = "A type-safe, Swift-language layer over SQLite3 for iOS and OS X."

  s.description      = <<-DESC
    SQLite.swift provides compile-time confidence in SQL statement syntax and
    intent.
                       DESC

  s.homepage         = "https://github.com/brandenr/SQLite.swift"
  s.license          = 'MIT'
  s.author           = { "Stephen Celis" => "stephen@stephencelis.com" }
  s.source           = { :git => "https://github.com/brandenr/SQLite.swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stephencelis'

  s.module_name      = 'SQLite'
  s.ios.deployment_target = "8.0"
#  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.9"

  s.libraries = 'sqlite3'
  s.source_files = 'SQLite/**/*.{c,h,m,swift}'
  s.private_header_files = 'SQLite/Core/fts3_tokenizer.h'
  
  s.preserve_paths = 'podstuff/**/*'
  s.prepare_command = 'sh podstuff/scripts/injectXcodePath.sh'
  s.xcconfig = { 'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]' => '$(SRCROOT)/SQLite.swift/podstuff/iphoneos',
                 'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]' => '$(SRCROOT)/SQLite.swift/podstuff/iphonesimulator',
                 'SWIFT_INCLUDE_PATHS[sdk=macosx*]' => '$(SRCROOT)/SQLite.swift/podstuff/macosx',
                 'SWIFT_INCLUDE_PATHS[sdk=appletvsimulator*]' => '$(SRCROOT)/SQLite.swift/podstuff/appletvos',
                 'SWIFT_INCLUDE_PATHS[sdk=appletvos*]' => '$(SRCROOT)/SQLite.swift/podstuff/appletvsimulator' }

end
