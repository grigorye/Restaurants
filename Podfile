source 'https://github.com/CocoaPods/Specs.git'

install! 'cocoapods', :share_schemes_for_development_pods => true
plugin 'cocoapods-developing-folder'

use_folders :skip_top_level_group => ["Modules"]

platform :ios, '11.0'

target 'Restaurants' do
  use_frameworks!

  # App
  pod 'RestaurantsIntegration', :path => 'Modules/App/RestaurantsIntegration'
  pod 'RestaurantsSceneModules', :path => 'Modules/App/RestaurantsSceneModules'
  # Scenes
  pod 'RestaurantsMapScene', :testspecs => ['SnapshotTests', 'Tests'], :path => 'Modules/Scenes/RestaurantsMapScene'
  pod 'RestaurantsDetailsScene', :testspecs => ['SnapshotTests'], :path => 'Modules/Scenes/RestaurantsDetailsScene'
  # Services
  pod 'RestaurantsFoursquareServices', :testspecs => ['Tests'], :path => 'Modules/Services/RestaurantsFoursquareServices'
  pod 'RestaurantsHTTPServices', :testspecs => ['Tests'], :path => 'Modules/Services/RestaurantsHTTPServices'
  pod 'RestaurantsServices', :path => 'Modules/Services/RestaurantsServices'
  # Models & Primitives
  pod 'RestaurantsModels', :path => 'Modules/ModelsAndPrimitives/RestaurantsModels'
  pod 'RestaurantsAlgorithms', :testspecs => ['Tests'], :path => 'Modules/ModelsAndPrimitives/RestaurantsAlgorithms'
  pod 'RestaurantsModulePrimitives', :path => 'Modules/ModelsAndPrimitives/RestaurantsModulePrimitives'
end
