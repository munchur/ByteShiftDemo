//
//  globalTimer.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 8/9/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import Foundation
import UserNotifications

class GlobalTimer:NSObject {
    
    static let sharedTimer: GlobalTimer = {
        let timer = GlobalTimer()
        return timer
    }()
    
    var internalTimer: Timer?
    
    public var seconds = 0
    
    func getTime() -> Int{
        return seconds
    }
    
    func startTimer(){
        if internalTimer == nil {
            internalTimer?.invalidate()
        }
        
        self.internalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    func stopTimer(){
//        guard self.internalTimer != nil
//            else {
//                fatalError("Stop Timer Error")
//        }
        
        self.internalTimer?.invalidate()
    }

    func updateTimer(){
        seconds += 1;
        print(seconds)
        
        if(seconds % 10 == 0)
        {
            let content = UNMutableNotificationContent()
            content.title = "Countdown Timer"
            content.body = "You have been here for " + String(seconds) + "seconds"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: "duration", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
    
}