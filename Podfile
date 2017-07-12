# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'MKRXLocalization' do
  use_frameworks!

    pod "ModelMapper"
    pod 'Moya-ModelMapper/RxSwift'
    pod "RxCocoa"
    pod "RxSwift"
    pod 'RxOptional'

    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
    
end
