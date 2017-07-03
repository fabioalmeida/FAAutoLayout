Pod::Spec.new do |s|
  s.name             = 'FAAutoLayout'
  s.version          = '0.2.1'
  s.summary          = 'A simple and intuitive way to create NSLayoutConstraints programmatically'
  s.homepage         = 'https://github.com/fabioalmeida/FAAutoLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fabioalmeida' => 'fabio.andre.almeida@gmail.com' }
  s.source           = { :git => 'https://github.com/fabioalmeida/FAAutoLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fabioacalmeida'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FAAutoLayout/Classes/**/*'
end
