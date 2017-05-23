
Pod::Spec.new do |s|
  s.name             = 'IMReactiveWithConditionTextField'
  s.version          = '0.1.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
  s.requires_arc     = true
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/iMoya917/IMReactiveWithConditionTextField'
  s.license          = 'MIT'
  s.author           = { 'Ivan' => 'idion917@gmail.com' }
  s.source           = { :git => 'https://github.com/iMoya917/IMReactiveWithConditionTextField.git', :tag =>  "#{s.version}" }
 
  s.ios.deployment_target = '9.0'
  s.framework = 'UIKit'
  s.dependency 'ReactiveCocoa', '5.0'

  #s.source_files = 'IMReactiveTextField/Classes/**/*'
 # 8
  #s.source_files = "IMReactiveTextField/**/*.{swift}"
  s.source_files = 'IMReactiveWithConditionTextField/Classes/**/*'


end
