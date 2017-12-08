
Pod::Spec.new do |s|
s.name        = 'SampleBufferToVolumeLevels'
s.version     = '1.0.0'
s.authors     = { "阳眼的熊" => "237505990@qq.com" }
s.homepage    = 'https://github.com/doubleYang1020/SampleBufferToVolumeLevels'
s.summary     = 'this is get volumeLevels from sampleBuffer engine'
s.source      = { :git => 'https://github.com/doubleYang1020/SampleBufferToVolumeLevels.git',:tag => s.version.to_s }
s.license     = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files = 'SampleBufferToVolumeLevels'
s.public_header_files = 'SampleBufferToVolumeLevels/*.h'

s.ios.deployment_target = '8.0'
s.frameworks = 'AVFoundation'
end

