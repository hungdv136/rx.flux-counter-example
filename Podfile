use_frameworks!

target 'rx.flux-counter-example' do
    pod 'RxSwift', '~> 3.5.0'
    pod 'RxCocoa', '~> 3.5.0'
    pod 'RxFlux', :git => 'https://github.com/hungdv136/rx.flux.git'
    pod 'PureLayout'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
        end
    end
end