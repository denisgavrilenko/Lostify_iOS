//
//  AuthorizationRouter.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/24/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import Foundation

protocol AuthorizationRouter {
    func navigateToMain()
}

extension AuthorizationRouter {
    func navigateToMain() {
        
    }
}

struct AuthorizationDefaultRouter: AuthorizationRouter {
    
}
