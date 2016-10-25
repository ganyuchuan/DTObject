Pod::Spec.new do |s|

  s.name         = "DTObject"
  s.version      = "0.0.1"
  s.summary      = "A RESTful API object"
  s.homepage     = "https://github.com/ganyuchuan/DTObject"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ganyuchuan" => "ganyuchuan@huxiu.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/ganyuchuan/DTObject.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 3.0"

end
