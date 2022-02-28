//
//  OkycSdkHandler.swift
//  okyc_test
//
//  Created by Ayush Jain on 27/02/22.
//

import Foundation
import Flutter
import UIKit
import FlutterPluginRegistrant

class OkycSdkHandler{
    let channel: String = "com.ayush.ekyc.flutter"
    final let baseUrl:String
    final let clientId: String
    final let clientSecret: String
    final let useFaceMatch: Bool
    final let flutterEngine : FlutterEngine
    final let callback: Callback
    final let imageUrl: String?
    
    
    init(baseUrl:String,clientId: String,clientSecret: String,useFaceMatch: Bool,callback:Callback,imageUrl:String?){
        self.baseUrl = baseUrl
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.useFaceMatch = useFaceMatch
        self.callback=callback
        self.imageUrl = imageUrl
        flutterEngine = FlutterEngine(name: "flutter_engine")
        flutterEngine.run();
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
    }
    
    func startSdk(viewController:UIViewController) {
        let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        setupMethodChannel(flutterViewController: flutterViewController)
        
        flutterViewController.modalPresentationStyle = .fullScreen
        viewController.present(flutterViewController, animated: true, completion: nil)
    }
    
    func setupMethodChannel(flutterViewController:FlutterViewController) {
        let jsonObject: NSMutableDictionary = NSMutableDictionary()
        
        jsonObject.setValue(baseUrl, forKey: "baseUrl")
        jsonObject.setValue(clientId, forKey: "clientId")
        jsonObject.setValue(clientSecret, forKey: "clientSecret")
        jsonObject.setValue(useFaceMatch, forKey: "useFaceMatch")
        jsonObject.setValue(imageUrl, forKey: "imageUrl")
        
        var convertedString: String? = nil
        
        do {
            let sdkData =  try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            convertedString = String(data: sdkData, encoding: String.Encoding.utf8)
            
        } catch let myJSONError {
            print(myJSONError)
        }
        
        let resultDataChannel = FlutterMethodChannel(name: channel, binaryMessenger: flutterViewController.binaryMessenger)
        resultDataChannel.invokeMethod("setUpSdk", arguments: convertedString)
        
        resultDataChannel.setMethodCallHandler { call, result in
            if(call.method=="onFailure"){
                self.callback.onFailure(code:call.arguments as! Int)
            }else if(call.method=="onSuccess"){
                self.callback.onSuccess(response: call.arguments as! String)
            }
        }
    }
}
protocol Callback {
    func onFailure(code:Int)
    func onSuccess(response:String)
}
