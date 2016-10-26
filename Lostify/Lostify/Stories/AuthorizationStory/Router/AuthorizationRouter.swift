//
//  AuthorizationRouter.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/24/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit

protocol AuthorizationRouter {
    func navigateToMain(view: UIViewController)
}

extension AuthorizationRouter {
    func navigateToMain(view: UIViewController) {
        // Present a view controller from a different storyboard
        let storyboard = UIStoryboard(name: "MainStory", bundle: nil)
        if let mainViewController = storyboard.instantiateInitialViewController() {
            view.present(mainViewController, animated: true, completion: nil)
        }
    }
}

struct AuthorizationDefaultRouter: AuthorizationRouter {
    
}
