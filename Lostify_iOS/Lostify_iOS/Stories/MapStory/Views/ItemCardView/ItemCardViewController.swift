//
//  ItemCardViewController.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 11/10/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit

protocol PanGestureResponder: class {
    func didPan(viewController: UIViewController)
}

class ItemCardViewController: UIViewController, UIGestureRecognizerDelegate {
    weak final var responder : PanGestureResponder?
    
    @IBAction func onPanGesture(_ sender: UIGestureRecognizer) {
        switch sender.state {
        case .began:
            print("Start")
        case .changed:
            print("Changed")
        case .ended:
            print("Ended")
            responder?.didPan(viewController: self)
        default:
            print("other")
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
