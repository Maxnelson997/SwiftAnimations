//
//  ViewPropertyAnimator.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/16/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ViewPropertyAnimator: UIViewController {
    
    
    let box = UIView()
    

//    let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    var animator: UIViewPropertyAnimator!
    var boxWidthAnchor:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
  
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .red
        view.addSubview(box)
        boxWidthAnchor = box.widthAnchor.constraint(equalToConstant: 100)
        boxWidthAnchor.isActive = true
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        animator.addAnimations {
//            box.backgroundColor = .blue
//            self.view.layoutIfNeeded()
//        }
    
        

        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChanged(slide:)), for: .allEvents)
    }
    
    @objc fileprivate func handleSliderChanged(slide: UISlider) {
        print(slide.value)
        boxWidthAnchor.constant = 100 + CGFloat(slide.value * 100)
//        animator.fractionComplete = CGFloat(slide.value)
        animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.box.backgroundColor = .blue
        })
        animator.startAnimation()
    }
}
