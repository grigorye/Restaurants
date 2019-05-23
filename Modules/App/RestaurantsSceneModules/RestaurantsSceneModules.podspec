Pod::Spec.new do |s|
  s.name             = 'RestaurantsSceneModules'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsSceneModules'

  s.description      = <<~END
    Scene modules of Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsSceneModules'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsSceneModules.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  
  s.source_files = 'Sources/**/*'
  
  s.dependency 'RestaurantsDetailsScene'
  s.dependency 'RestaurantsMapScene'
  s.dependency 'RestaurantsModels'
  
end
