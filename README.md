# deepvue-aadhaar-offline-ekyc-ios-sdk
iOS wrapper for flutter

# IOS Integration

## Installation

Download our github repository for IOS repo.
Download our Ios Frameworks from [Here](https://drive.google.com/drive/folders/1ZjFCDq8DUvdMTkIXKxtSZlcMP0seBIL1?usp=sharing)

- Go into your target’s Build Settings > Build Phases > Link Binary With Libraries and Drag all the content of Drive Folder there.
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