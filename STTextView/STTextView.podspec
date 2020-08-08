Pod::Spec.new do |spec|
  spec.name           = "STTextView"
  spec.version        = "1.0.3"
  
  spec.summary        = "STTextView is a light-weight CocoaPod that adds a placeholder to the UITextView."
  
  spec.homepage       = "https://github.com/onl1ner/STTextView"
  spec.license        = "MIT"
  spec.author         = { "Tamerlan Satualdypov" => "tsatualdypov@gmail.com" }
  
  spec.platform       = :ios, "10.0"
  spec.swift_version  = "5.0"
  
  spec.source         = { :git => "https://github.com/onl1ner/STTextView.git", :tag => spec.version }

  spec.source_files   = "STTextView/**/*.swift"
end
