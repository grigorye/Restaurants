Pod::Spec.new do |s|
  s.name             = 'RestaurantsIntegration'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsIntegration'

  s.description      = <<~END
    Integration of all components of Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsIntegration'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsIntegration.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*'
  
  s.dependency 'RestaurantsSceneModules'
  s.dependency 'RestaurantsMapScene'
  s.dependency 'RestaurantsDetailsScene'
  s.dependency 'RestaurantsServices'
  s.dependency 'RestaurantsHTTPServices'
  s.dependency 'RestaurantsFoursquareServices'
  
end
