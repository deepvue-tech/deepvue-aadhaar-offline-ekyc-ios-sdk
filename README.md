# deepvue-aadhaar-offline-ekyc-ios-sdk
iOS wrapper for flutter

# IOS Integration

## Installation

Download our iOS dependencies from from [here](https://deepvue-public-storage.s3.ap-south-1.amazonaws.com/offline-aadhaar-ekyc/ios/v0.0.2/deepvue-okyc-ios-plugin.zip).

### For Debug
- Open Pod File and add **pod 'Flutter', :podspec => '[path of downloaded repo]/Debug/Flutter.podspec'**
- Go into your target’s Build Settings > Build Phases > Link Binary With Libraries and Drag all the content of [path of downloaded repo]/Debug/.
- In the target’s build settings, add $(PROJECT_DIR)/Flutter/Debug/ to the Framework Search Paths (FRAMEWORK_SEARCH_PATHS).
- Drag the frameworks (except for **FlutterPluginRegistrant**) from your application’s Frameworks group into your target’s Build Settings > Build Phases > Embed Frameworks. Then, select Embed & Sign from the drop-down list.
- Copy and Paste our **OkycSdkHandler.swift** file into your project.

### For Release
- Open Pod File and add **pod 'Flutter', :podspec => '[path of downloaded repo]/Release/Flutter.podspec'**
- Go into your target’s Build Settings > Build Phases > Link Binary With Libraries and Drag all the content of [path of downloaded repo]/Release/.
- In the target’s build settings, add $(PROJECT_DIR)/Flutter/Release/ to the Framework Search Paths (FRAMEWORK_SEARCH_PATHS).
- Drag the frameworks (except for **FlutterPluginRegistrant**) from your application’s Frameworks group into your target’s Build Settings > Build Phases > Embed Frameworks. Then, select Embed & Sign from the drop-down list.
- Copy and Paste our **OkycSdkHandler.swift** file into your project.

## Usage

```swift
//Implement our protocol to get responses
class ViewController: UIViewController ,Callback{
    func onFailure(code: Int) {
        // On Failure Code
    }
    
    func onSuccess(response: String) {
        // On Success Response
    }
}

// Use below code to open the sdk
 OkycSdkHandler(
            baseUrl: "base-url",
            clientId: "client-id",
            clientSecret: "client-secret",
            useFaceMatch: true,
            callback:self,
            imageUrl: "image-url").startSdk(viewController: self)

```
