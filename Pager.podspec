Pod::Spec.new do |s|

    s.name = 'Pager'
    s.version = '1.0.7'
    s.license = { :type => 'MIT' }
    s.homepage = 'https://github.com/iWECon/Pager'
    s.authors = 'iWw'
    s.ios.deployment_target = '10.0'
    s.summary = 'Pager'
    s.source = { :git => 'https://github.com/iWECon/Pager.git', :tag => s.version }
    s.source_files = [
        'Sources/**/*.swift',
    ]
    
    s.cocoapods_version = '>= 1.10.0'
    s.swift_version = ['5.3']
    
    # dependencies
    # for https://github.com/iWECon/YTPageController
    s.dependency 'YTPageController'
    
end

