Pod::Spec.new do |spec|
  spec.name         = "STTextView"
  spec.version      = "1.0.0"
  
  spec.summary      = "STTextView is a lightweight CocoaPod that adds a placeholder to the UITextView."
  
  spec.homepage     = "https://github.com/onl1ner/STTextView"
  spec.license      = "MIT"
  spec.author       = { "onl1ner" => "tsatualdypov@gmail.com" }
  
  spec.platform     = :ios, "10.0"
  
  spec.source       = { :git => "https://github.com/onl1ner/STTextView.git", :tag => "#{spec.version}" }

  spec.source_files  = "STTextView/*.{swift}"
end
