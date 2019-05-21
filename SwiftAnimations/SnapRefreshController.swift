//
//  SnapRefreshController.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/20/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class SnapRefreshController: UIViewController {
    
    fileprivate let startingHeight: CGFloat = 50
    fileprivate let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: startingHeight)
        shapeLayer.backgroundColor = UIColor.darkGray.cgColor
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.userIsDragging)))
        
    }
    
    @objc fileprivate func userIsDragging(gesture: UIPanGestureRecognizer) {
        if gesture.state == .ended
        || gesture.state == .failed
            || gesture.state == .cancelled {
            
        } else {
            shapeLayer.frame.size.height = startingHeight + gesture.translation(in: self.view).y
        }
    }
}
