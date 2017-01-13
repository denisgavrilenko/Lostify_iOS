//
//  ReusableView.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 11/13/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit

let kDefaultIdentifier = "DefaultIdentifier"

protocol Reusable {
    var identifier: String { get }
    var base: UIView { get }
}

extension UIView: Reusable {
    internal var identifier: String {
        return kDefaultIdentifier
    }

    internal var base: UIView {
        return self
    }
}

extension UIViewController: Reusable {
    internal var identifier: String {
        return kDefaultIdentifier
    }
    
    internal var base: UIView {
        return view
    }
}
