//
//  AuthorizationUserStoryAssembly.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/24/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setupAuthorizationStory() {
        defaultContainer.registerForStoryboard(AuthorizationViewController.self) { (r, c) in
            c.verifyNumberRouter = r.resolve(AuthorizationVerifyNumberRouting.self)
        }
        defaultContainer.register(AuthorizationVerifyNumberRouting.self) { _ in AuthorizationVerifyNumberRouter() }
    }
}
