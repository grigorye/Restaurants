Pod::Spec.new do |s|
  s.name             = 'RestaurantsAlgorithms'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsAlgorithms'

  s.description      = <<~END
    Generic algorithms of Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsAlgorithms'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsAlgorithms.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/**/*'
  s.exclude_files = 'Sources/**/*Tests.*'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Sources/**/*Tests.*'

    test_spec.dependency 'SwiftCheck'
  end
end
