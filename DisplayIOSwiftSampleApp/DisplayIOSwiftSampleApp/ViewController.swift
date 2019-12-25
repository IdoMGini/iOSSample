//
//  ViewController.swift
//  DisplayIOSwiftSampleApp
//
//  Created by Ido Meirov on 24/12/2019.
//  Copyright © 2019 Gini-Apps. All rights reserved.
//

import UIKit
import DIOSDK

class ViewController: UIViewController
{
    private let testAppId           = "7522"
    private let testPlacementId     = "5426"//"5362" // "5426"
    
    private let tumblerAppId        = "8348"
    private let tumblerPlacementId  = "6191"
    
    private var adProvider  : DIOAdProvider?
    private var displayIOAd : DIOAd?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let instance = DIOController.sharedInstance()
        instance.initialize(withAppId: testAppId, completionHandler: {
            
            instance.setLocationBasedTargeting(false)
            instance.requireHttpsInitialization()
            
        }) { (errorMessage) in
            
            print("errorMessage: \(errorMessage)")
        }
    }
    
    @IBAction func actionButtonDidTap(_ sender: Any)
    {
        let placement   = DIOPlacement(id: testPlacementId)
        let request     = placement.newAdRequest()
        
        request.setDetailsRequired(true)
//        request.setKeywords(["house of cards", "ronaldo", "lamborghini", "pubg", "apple", "iphone"])
//        request.setYearOfBirth(1996)
//        request.setGender(AD_REQUEST_MALE)
        
        request.requestAd(adReceivedHandler: { (adProvider) in
            // integration code
            print("******AD RECEIVED******")
            self.adProvider = adProvider
            adProvider.loadAd(loadedHandler: { (displayIOAd) in
                
                self.displayIOAd = displayIOAd
                print("******AD LOADED******")
                let name = displayIOAd.advertiserName
                let clickURL = displayIOAd.advertiserClickURL
                
                print("displayIOAd.advertiserName: \(name) \ndisplayIOAd.advertiserClickURL: \(clickURL)")
                print("format: \(displayIOAd.format)")
                print("description: \(displayIOAd.description)")
                
            }) { (errorMessage) in
                
                print("errorMessage: \(errorMessage)")
            }
            
        }) {
            // integration code
            print("******NO AD******")
        }
    }
    
    
}

