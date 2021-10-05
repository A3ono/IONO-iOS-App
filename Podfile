Podfile
# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'

target 'SwiftPHPMySQL' do
  # Comment the next line if you don't want to use dynamic frameworks
  
   use_frameworks!
  
   pod 'Alamofire', '~> 4.3'

# add the Firebase pod for Google Analytics

	pod 'Firebase/Analytics'
	pod 'Firebase/Auth'
	pod 'Firebase/Firestore'
	pod 'Firebase/Database'

	inhibit_all_warnings!




# or pod ‘Firebase/AnalyticsWithoutAdIdSupport’
# for Analytics without IDFA collection capability

# add pods for any other desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods


  # Pods for SwiftPHPMySQL

  target 'SwiftPHPMySQLTests' do
    
    inherit! :search_paths

    # Pods for testing

  end

  target 'SwiftPHPMySQLUITests' do
    
  
    # Pods for testing

  end

end
