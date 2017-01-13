//
//  SwinjectStoryboard+Setup.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/25/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        setupAuthorizationStory()
    }
}

//extension SwinjectStoryboard {
////    class func setup() {
////        defaultContainer.registerForStoryboard(WeatherTableViewController.self) { r, c in
////            c.weatherFetcher = r.resolve(WeatherFetcher.self)
////        }
////        defaultContainer.register(Networking.self) { _ in Network() }
////        defaultContainer.register(WeatherFetcher.self) { r in
////            WeatherFetcher(networking: r.resolve(Networking.self)!)
////        }
////    }
//}
