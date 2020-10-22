# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Pakae' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Pakae
  pod 'Firebase/Storage'

  target 'PakaeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PakaeUITests' do
    # Pods for testing
  end

end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
end
