Pod::Spec.new do |s|
  s.name             = 'RestaurantsModulePrimitives'
  s.version          = '0.1.0'
  s.summary          = 'RestaurantsModulePrimitives'

  s.description      = <<~END
    Module primitives of Restaurants app.
  END

  s.homepage         = 'https://github.com/grigorye/RestaurantsModulePrimitives'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'grigorye' => 'grigory.entin@gmail.com' }
  s.source           = { :git => 'https://github.com/grigorye/RestaurantsModulePrimitives.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*'
  
end
