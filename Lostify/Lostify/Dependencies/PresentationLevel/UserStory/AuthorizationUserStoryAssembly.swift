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
            c.router = r.resolve(AuthorizationRouter.self)
        }
        defaultContainer.register(AuthorizationRouter.self) { _ in AuthorizationDefaultRouter() }
    }
}
