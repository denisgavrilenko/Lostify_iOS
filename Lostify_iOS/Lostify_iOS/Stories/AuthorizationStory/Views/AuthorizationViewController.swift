//
//  AuthorizationViewController.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/24/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class AuthorizationViewController: UIViewController {
    final var verifyNumberRouter: AuthorizationVerifyNumberRouting!
    
    @IBOutlet var signInButtons: [UIButton]!
    @IBOutlet weak var signButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signButton.reactive.pressed = CocoaAction(Action<Void, Void, NoError> {
            SignalProducer { [weak self] observer, _ in
                self?.animateSignOptions()
            }
        })
    }
    
    // MARK: - Actions
    
    @IBAction func onGoogleSign(_ sender: AnyObject) {
        verifyNumber()
    }
    
    @IBAction func onVKSign(_ sender: AnyObject) {
        verifyNumber()
    }
    
    @IBAction func onFBSign(_ sender: AnyObject) {
        verifyNumber()
    }
    
    private func verifyNumber() {
        verifyNumberRouter.navigateToVerifyNumber(fromView: self)
    }
    
    // MARK: - Animation
    
    // TODO: Move to Behaviour
    
    private func animateSignOptions() {
        UIView.animate(withDuration: 1.5) {
            self.signButton.alpha = 0;
            self.signInButtons.forEach{ $0.alpha = 1 }
        }
    }
    
    // MARK: - Appearance
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
