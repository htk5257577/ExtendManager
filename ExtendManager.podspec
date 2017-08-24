Pod::Spec.new do |s|
  s.name         = "ExtendManager"
  s.version      = "0.0.1"
  s.summary      = "A datasource and delegate for create a expand table view"
  s.description  = <<-DESC
                    对点击tableViewCell展开cell功能封装的库
                   DESC
  s.homepage     = "https://github.com/htk5257577/ExtendManager"
  s.license      = "MIT"
  s.author       = { "htk5257577" => "280071019@qq.com" }
  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/htk5257577/ExtendManager.git", :tag => "0.0.1" }
  s.source_files  = 'ExtendManager/Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
