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
    fileprivate let maxDragHeight: CGFloat = 150
    fileprivate let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    fileprivate let leftThree = UIView()
    fileprivate let leftTwo = UIView()
    fileprivate let leftOne = UIView()
    fileprivate let centerZero = UIView()
    fileprivate let rightOne = UIView()
    fileprivate let rightTwo = UIView()
    fileprivate let rightThree = UIView()
    
    fileprivate lazy var views: [UIView] = [
        leftThree,
        leftTwo,
        leftOne,
        centerZero,
        rightOne,
        rightTwo,
        rightThree
    ]
    
    fileprivate func generatePath() {
        let screenWidth = view.frame.width
        
        let leftThreeCenter = leftThree.center
        let leftTwoCenter = leftTwo.center
        let leftOneCenter = leftOne.center
        let centerZeroCenter = centerZero.center
        let rightOneCenter = rightOne.center
        let rightTwoCenter = rightTwo.center
        let rightThreeCenter = rightThree.center
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: leftThreeCenter.y))
        bezierPath.addCurve(to: leftOneCenter, controlPoint1: leftThreeCenter, controlPoint2: leftTwoCenter)
        bezierPath.addCurve(to: rightOneCenter, controlPoint1: centerZeroCenter, controlPoint2: rightOneCenter)
        bezierPath.addCurve(to: rightThreeCenter, controlPoint1: rightOneCenter, controlPoint2: rightTwoCenter)
        bezierPath.addLine(to: CGPoint(x: screenWidth, y: 0))
        
        shapeLayer.path = bezierPath.cgPath
    }
    
    fileprivate func layoutViewPoints(minHeight: CGFloat, dragY: CGFloat, dragX: CGFloat) {
        let minX: CGFloat = 0
        let maxX: CGFloat = view.frame.width
        
        let leftPart = dragX - minX
        let rightPart = maxX - dragX
        
        leftThree.center = CGPoint(x: minX, y: minHeight)
        leftTwo.center = CGPoint(x: minX + (leftPart * 0.44), y: minHeight)
        leftOne.center = CGPoint(x: minX + (leftPart * 0.71), y: minHeight + (dragY * 0.64))
        centerZero.center = CGPoint(x: dragX, y: minHeight + (dragY * 1.36))
        rightOne.center = CGPoint(x: maxX - (rightPart * 0.71), y: minHeight + (dragY * 0.64))
        rightTwo.center = CGPoint(x: maxX - (rightPart * 0.44), y: minHeight)
        rightThree.center = CGPoint(x: maxX, y: minHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        shapeLayer.fillColor = UIColor.darkGray.cgColor
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.userIsDragging)))
        
        setupViewPoints()
        
    }
    
    fileprivate func setupViewPoints() {
        views.forEach { (layoutViewPoint) in
            layoutViewPoint.frame = CGRect(x: 0, y: 0, width: 4, height: 4)
            layoutViewPoint.backgroundColor = .cyan
            view.addSubview(layoutViewPoint)
        }
        
        layoutViewPoints(minHeight: startingHeight, dragY: 0, dragX: view.frame.width/2)
        generatePath()
    }
    
    @objc fileprivate func userIsDragging(gesture: UIPanGestureRecognizer) {
        if gesture.state == .ended
            || gesture.state == .failed
            || gesture.state == .cancelled {
            
        } else {
            //            shapeLayer.frame.size.height = startingHeight + gesture.translation(in: self.view).y
            let dragHeight = gesture.translation(in: view).y
            
            let dragY = min(dragHeight * 0.5, maxDragHeight)
            let minimumHeight = startingHeight + dragHeight - dragY
            
            let dragX = gesture.location(in: view).x
            
            layoutViewPoints(minHeight: minimumHeight, dragY: dragY, dragX: dragX)
            generatePath()
        }
    }
}
