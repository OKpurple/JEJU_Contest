//
//  AppDelegate.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 13..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let apim  = APIM()
    var user = UserVO(user_index: -10, user_id: "", user_name: "", user_img: "", user_sex: "", user_age: "", user_tel: "", user_email: "", user_password: "")
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCxBmlS9AH5-LQHH-QYemuAMmTJjw7E60o")
        GMSPlacesClient.provideAPIKey("AIzaSyA-bS9q_6FKsOm51Hmto_aMJxzR5qszkuU")
        

        // Override point for customization after application launch.
        return true
    }
 
  

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
  
    
    

}

