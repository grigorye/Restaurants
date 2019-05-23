Pod::Spec.new do |s|
  s.name             = 'RestaurantsServices'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsServices'

  s.description      = <<~END
    Default implementations of services for Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsServices'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsServices.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.swift_version = '5.0'
  s.source_files = 'RestaurantsServices/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RestaurantsServices' => ['RestaurantsServices/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.dependency 'RestaurantsModels'
end
