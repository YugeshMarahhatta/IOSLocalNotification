//
//  ViewController.swift
//  LocalNotification
//
//  Created by Yugesh Marahatta on 21/06/2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Step 1 - basic setup
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.sound,.badge,.alert]) { (granted, error) in
            if error == nil{
                print("User permission is granted : \(granted)")
        }
        }
        // Step 2: Create the notification content
        
        let content = UNMutableNotificationContent()
        content.title = "Hello Guys !"
        content.body = "Thanks for downloading Me"
        
        // Step 3: Create the notification trigger

        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // Step 4: Create the request

        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        // Step 5: Register the request

        center.add(request) { (error) in}
    }
    
    
    
       /*
//second notification
        //step 1
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        }
        
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a notification!"
        content.body = "Look at me!"
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(5)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }

    */
}


