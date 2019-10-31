//
//  Screen2Sample.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Parrot on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class Screen2Sample: WKInterfaceController, WCSessionDelegate {
    
    // MARK: Outlets
    // ---------------------

    // 1. Outlet for the image view
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    
    // 2. Outlet for the label
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    // MARK: Delegate functions
    // ---------------------
    
    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if the watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
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
    
    
    // MARK: Actions
    @IBAction func startButtonPressed() {
        print("Start button pressed")
        if WCSession.default.isReachable {
                   print("Trying to hibernate the baby")
            self.nameLabel.setText("baby is hibernated")
            WCSession.default.sendMessage(
                ["Baby" : "hibernate"],
                replyHandler: {
                    (_ replyMessage: [String: Any]) in
                    
                    print("Message sent, Baby is in hibernation mode")
                    self.nameLabel.setText("Got reply from phone")
            }, errorHandler: { (error) in
                print("Error while sending message: \(error)")
                self.nameLabel.setText("Error sending message")
            })
    }
    }
    
    @IBAction func selectNameButtonPressed() {
        print("select name button pressed")
        if WCSession.default.isReachable {
         print("Baby is hibernating")
        }
        
    }
    

}
