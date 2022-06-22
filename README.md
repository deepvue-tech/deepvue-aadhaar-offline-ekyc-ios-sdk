# Deepvue Aadhaar Offline e-KYC iOS Native SDK

This is a wrapper over Flutter for iOS.

Aadhaar Paperless Offline eKYC is a secure and shareable document which can be used by any Aadhaar holder for offline verification of identification. The Aadhaar Offline document can be obtained from the UIDAI website. This SDK provides a simple plugin to your mobile App which allows the user to seamlessly share their offline Aadhaar file with the service provider. 

The Aadhaar Offline file will be validated for its digital signature and the KYC data of The Aadhaar holder will be passed to the integrating App as JSON data.


# Table Of Content

- [Prerequisite](#prerequisite)
- [Setup](#setup)
- [Usage](#usage)
- [Failure Status Codes](#failure-status-codes)
- [Help](#help)

## Prerequisite

You will need valid credentials to use the Deepvue Aadhaar Offline e-KYC iOS SDK, which can be obtained by contacting `hello@deepvue.tech` 

## Setup

1. Download our iOS dependencies from [here](https://deepvue-public-storage.s3.ap-south-1.amazonaws.com/offline-aadhaar-ekyc/ios/v0.0.2/deepvue-okyc-ios-plugin.zip).

    #### For Debug

    2. Open Pod File and add `pod 'Flutter', :podspec => '[path to downloaded ios dependencies]/Debug/Flutter.podspec'`
    3. Go into your target’s `Build Settings > Build Phases > Link Binary With Libraries` and Drag all the content of `[path to downloaded iOS dependencies]/Debug/`.
    4. In the target’s `Build Settings`, add `$(PROJECT_DIR)/Flutter/Debug/` to the Framework Search Paths `FRAMEWORK_SEARCH_PATHS`.
    5. Click on the "+" icon and select `New Copy Files Phase`. Rename the item created to `Embed Frameworks` and set the `Destination` field to `Frameworks`. Drag the frameworks (except for `FlutterPluginRegistrant`) from your application’s Frameworks group into your target’s `Build Settings > Build Phases > Embed Frameworks`. Then, select Embed & Sign from the drop-down list.

    #### For Release

    2. Open Pod File and add `pod 'Flutter', :podspec => '[path to downloaded ios dependencies]/Release/Flutter.podspec'`
    3. Go into your target’s `Build Settings > Build Phases > Link Binary With Libraries` and Drag all the content of `[path to downloaded iOS dependencies]/Release/`.
    4. In the target’s `Build Settings`, add `$(PROJECT_DIR)/Flutter/Release/` to the Framework Search Paths `FRAMEWORK_SEARCH_PATHS`.
    5. Click on the "+" icon and select `New Copy Files Phase`. Rename the item created to `Embed Frameworks` and set the `Destination` field to `Frameworks`. Drag the frameworks (except for `FlutterPluginRegistrant`) from your application’s Frameworks group into your target’s `Build Settings > Build Phases > Embed Frameworks`. Then, select Embed & Sign from the drop-down list.  

6. Copy [OkycSdkHandler.swift](https://github.com/deepvue-tech/deepvue-aadhaar-offline-ekyc-ios-sdk/blob/main/OkycSdkHandler.swift) file and add to your `project` alongside `AppDelegate` file.

## Usage
You can use below code to trigger SDK from your application on a button press or a similar event.

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

## Failure Status Codes
Following error codes will be returned on the `onFailure` method of the callback

| CODE | DESCRIPTION                  |
| ---- | ---------------------------- |
| 801  | SDK Invalid Credentials             |
| 802  | Permission Denied       |
| 803  | User Interrupted            |
| 804  | No Internet Available |
| 805  | Network Error         |
| 806  | OTP Limit Exceeded       |
| 807  | Mobile Number Not Linked to Aadhaar             |
| 808  | File Download Failed 
| 809  | File Upload Failed |
| 810  | Face Match Failed            |
| 404  | UIDAI Website Server Down            |


## Help
For any queries/feedback, contact us at `hello@deepvue.tech` 
