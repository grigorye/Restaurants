Pod::Spec.new do |s|
  s.name             = 'RestaurantsModels'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsModels'

  s.description      = <<~END
    Models of Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsModels'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsModels.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'RestaurantsModels/Classes/**/*'
  s.exclude_files = '**/*Tests.*'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'RestaurantsModels/Classes/**/*Tests.swift'
  end

  # s.resource_bundles = {
  #   'RestaurantsModels' => ['RestaurantsModels/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
