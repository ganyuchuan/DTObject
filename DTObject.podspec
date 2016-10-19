Pod::Spec.new do |s|

  s.name         = "DTObject"
  s.version      = "0.0.1"
  s.summary      = "A short description of DTObject."
  s.homepage     = "https://github.com/ganyuchuan/DTObject"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ganyuchuan" => "ganyuchuan@huxiu.com" }
  s.source       = { :git => "https://github.com/ganyuchuan/DTObject.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.frameworks = "Foundation"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 3.0"

end
