//
//  FacebookAuthorization.swift
//  Lostify_iOS
//
//  Created by Denis Gavrilenko on 1/14/17.
//  Copyright © 2017 DreamTeam. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FacebookCore
import UIKit

class FacebookAuthorization {
    
}

extension FacebookAuthorization: SocialNetworkAuthorizing {
    func registerSocialToken(fromViewController viewController: UIViewController) {
        FBSDKLoginManager().logIn(withReadPermissions: [ReadPermission.publicProfile.string, ReadPermission.email.string], from: viewController) { (loginResult, error) in
            if let result = loginResult {
                print(result.token.tokenString)
                TokenAPI.apiTokenPost(provider: "Facebook", token: result.token.tokenString, completion: { error in
                    
                })
            }
        }
    }
}

extension FacebookCore.ReadPermission {
    private enum StringDefs: String {
        case public_profile
        case email
        case user_friends
    }
    
    var string: String {
        switch self {
        case .publicProfile:
            return StringDefs.public_profile.rawValue
        case .email:
            return StringDefs.email.rawValue
        case .userFriends:
            return StringDefs.user_friends.rawValue
        case .custom(let string):
            return string
        }
    }
}
