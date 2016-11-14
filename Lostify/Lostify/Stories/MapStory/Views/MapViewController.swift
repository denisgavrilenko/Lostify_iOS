//
//  MapViewController.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/28/16.
//  Copyright © 2016 DreamTeam. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapLayoutView: UIView!
    @IBOutlet weak var cardsView: ReusableScrollView!
    @IBOutlet weak var movableConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMapView()
//        addCardsView()
        cardsView.dataSource = TestDataSource()
    }
    
    private func addMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.translatesAutoresizingMaskIntoConstraints = false;
        
        mapLayoutView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(mapLayoutView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}

struct TestDataSource: ReusableScrollViewDataSource {
    
}
    
//    private func addCardsView() {
//        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        pageViewController.dataSource = self
//        
//        let view = ItemCardViewController(nibName: nil, bundle: nil)
//        view.responder = self
//        pageViewController.setViewControllers([view], direction: .forward, animated: false, completion: nil)
//        
//        addChildViewController(pageViewController)
//        cardsView.addSubview(pageViewController.view)
//        pageViewController.view.snp.makeConstraints { (make) in
//            make.edges.equalTo(cardsView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
//        }
//        pageViewController.didMove(toParentViewController: self)
//    }

//extension MapViewController: UIPageViewControllerDataSource {
//    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        let view = ItemCardViewController(nibName: nil, bundle: nil)
//        view.responder = self
//        return view
//    }
//    
//    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let view = ItemCardViewController(nibName: nil, bundle: nil)
//        view.responder = self
//        return view
//    }
//}
//
//extension MapViewController: PanGestureResponder {
//    func didPan(viewController: UIViewController) {
//        UIView.animate(withDuration: 5, delay: 0, options: .curveEaseOut, animations: {
//            self.movableConstraint.constant = 300
//            self.view.layoutIfNeeded()
//        })
//    }
//}
