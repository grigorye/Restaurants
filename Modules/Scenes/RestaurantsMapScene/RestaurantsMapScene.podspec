Pod::Spec.new do |s|
  s.name             = 'RestaurantsMapScene'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsMapScene'

  s.description      = <<~END
    Map scene for Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsMapScene'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsMapScene.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*'
  s.exclude_files = '**/__Snapshots__/**/*'

  s.dependency 'RestaurantsAlgorithms'
  s.dependency 'RestaurantsModels'
  s.dependency 'RestaurantsModulePrimitives'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*'
  end

  s.test_spec 'SnapshotTests' do |test_spec|
    test_spec.requires_app_host = true
    test_spec.source_files = 'SnapshotTests/**/*'
    test_spec.dependency 'SnapshotTesting'
  end

end
