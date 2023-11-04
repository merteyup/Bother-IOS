# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'bother' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for bother

	pod 'FirebaseAnalytics'
	pod 'FirebaseAuth'
	pod 'FirebaseFirestore'
  pod 'FirebaseFunctions', '~> 9.3'
  pod 'SCLAlertView'
  pod 'IQKeyboardManagerSwift'
  pod 'L10n-swift', '~> 5.10.2'
  pod 'Google-Mobile-Ads-SDK'
  pod 'lottie-ios'



end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
        File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
      end
    end
  end
end
