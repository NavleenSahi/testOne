//
//  wakeUp.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Navleen Sahi on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class wakeUp: WKInterfaceController, WCSessionDelegate {
    
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
        override func awake(withContext context: Any?) {
           super.awake(withContext: context)
            
            print("Baby is not sleeping now!")
           
           
           // 1. Check if the watch supports sessions
           if WCSession.isSupported() {               WCSession.default.delegate = self
               WCSession.default.activate()
           }
           
           
       }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func wakeUpButtonPressed() {
        print("wake up baby")
        
        if WCSession.default.isReachable {
            print("baby is awake")
        }
    }
    
}
