//
//  AuthorizationUserStoryAssembly.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/24/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import Typhoon

class AuthorizationUserStoryAssembly: TyphoonAssembly {
    
    dynamic func authorizationView() -> AnyObject {
        return TyphoonDefinition.withClass(AuthorizationViewController.self) { (defenition) in
            defenition?.injectProperty(Selector(("router")), with:self.authorizationRouter())
            } as AnyObject
    }
    
    dynamic func authorizationRouter() -> AnyObject {
        return TyphoonDefinition.withClass(AuthorizationDefaultRouter.self) as AnyObject
    }
}
