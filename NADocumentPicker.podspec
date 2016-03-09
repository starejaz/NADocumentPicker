Pod::Spec.new do |s|
  s.name             = "NADocumentPicker"
  s.version          = "1.0.0"
  s.summary          = "Encapsulates UIKit document picker UI"

  s.homepage         = "http://nickager.com/blog/2016/03/07/DocumentPicker"
  s.license          = 'MIT'
  s.author           = { "Nick Ager" => "nick.ager@gmail.com" }
  s.source           = { :git => "https://github.com/NickAger/NADocumentPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NickAger'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.frameworks = 'UIKit'
  s.dependency 'NACommonUtils'
  s.dependency 'BrightFutures'
end
