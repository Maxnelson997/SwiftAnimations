//
//  ViewPropertyAnimator.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/16/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ViewPropertyAnimator: UIViewController {
    

    let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        animator.addAnimations {
            self.view.backgroundColor = .blue

        }
        
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
        animator.fractionComplete = CGFloat(slide.value)
    }
}
