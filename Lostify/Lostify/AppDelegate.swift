//
//  AppDelegate.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/4/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyATflmGaExW-alUL6NxkOiAA4XgxuSxNes")
        return true
    }
}

