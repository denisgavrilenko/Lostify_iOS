//
//  AuthorizationVerifyNumberRouter.swift
//  Lostify_iOS
//
//  Created by Denis Gavrilenko on 1/14/17.
//  Copyright © 2017 DreamTeam. All rights reserved.
//

import UIKit

protocol AuthorizationVerifyNumberRouting {
    func navigateToVerifyNumber(fromView: UIViewController)
}

class AuthorizationVerifyNumberRouter: AuthorizationVerifyNumberRouting {
    enum Segue: String {
        case verifyNumberSeque
    }
    
    func navigateToVerifyNumber(fromView view: UIViewController) {
        view.performSegue(withIdentifier: Segue.verifyNumberSeque.rawValue, sender: nil)
    }
}
