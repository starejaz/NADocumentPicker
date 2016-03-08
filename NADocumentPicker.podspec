Pod::Spec.new do |s|
  s.name         = "NADocumentPicker"
  s.version      = "1.0.0"
  s.summary      = "Encapsulates UIKit document picker UI"
  s.homepage     = "http://nickager.com/blog/2016/03/07/DocumentPicker"
  s.requires_arc = true

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Nick Ager" => "nick.ager@gmail.com" }
  s.social_media_url   = "http://twitter.com/NickAger"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/NickAger/NADocumentPicker.git", :tag => "1.0.0" }
  s.source_files = "NADocumentPicker/NADocumentPicker.swift"

  s.framework  = "UIKit"
  s.dependency 'NACommonUtils', :git => 'git@github.com:NickAger/NACommonUtils.git'
  s.dependency 'BrightFutures'
end
