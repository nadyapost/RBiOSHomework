platform :ios, '10.0'

use_frameworks!

def available_pods
  pod 'RealmSwift', '= 2.8.3'
end

target 'RedbubbleHomework' do
  available_pods
end

target 'RedbubbleHomeworkTests' do
    available_pods
end

# post_install do |installer|
#     installer.pods_project.targets.each do |target|
#         target.build_configurations.each do |config|
#             config.build_settings['SWIFT_VERSION'] = '3.0'
#             preprocessor_definitions = config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']
#             preprocessor_definitions = ['$(inherited)'] if preprocessor_definitions == nil
#             preprocessor_definitions.push 'MIXPANEL_NO_IFA' if target.to_s.include? 'Mixpanel'
#             config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = preprocessor_definitions
#         end
#     end
# end
