Pod::Spec.new do |s|
  s.name         = "NADocumentPicker"
  s.version      = "1.0.1"
  s.summary      = "Encapsulates UIKit document picker UI"
  s.homepage     = "http://nickager.com/blog/2016/03/07/DocumentPicker"
  s.requires_arc = true

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Nick Ager" => "nick.ager@gmail.com" }
  s.social_media_url   = "http://twitter.com/NickAger"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/NickAger/NADocumentPicker.git", :tag => "#{s.version}" }
  s.source_files = "NADocumentPicker.swift"

  s.framework  = "UIKit"
  s.dependency 'NACommonUtils'
  s.dependency 'BrightFutures'
end
