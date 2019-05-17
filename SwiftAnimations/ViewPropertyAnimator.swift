//
//  ViewPropertyAnimator.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/16/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ViewPropertyAnimator: UIViewController {
    
    fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    fileprivate var imageView:UIImageView = UIImageView(image: #imageLiteral(resourceName: "alex"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    

     let box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
   
        

        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        imageView.frame = view.frame
        imageView.contentMode = .scaleAspectFill
        blurView.frame = view.frame
        
        self.blurView.alpha = 0.5
    
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    
        setupSlider()
        
        view.addSubview(box)
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 150).isActive = true
        box.heightAnchor.constraint(equalToConstant: 150).isActive = true

        perform(#selector(self.animateBox), with: nil, afterDelay: 1)
    }
    
    @objc fileprivate func animateBox() {
        UIView.animate(withDuration: 0.3, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.1, y: 1.6)
            transform = transform.translatedBy(x: 30, y: 50)
            transform = transform.rotated(by: 45)
            
            self.box.transform = transform
        })
    }
    

    fileprivate func setupSlider() {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChanged(slide:)), for: .allEvents)
    }
    
    @objc fileprivate func handleSliderChanged(slide: UISlider) {
        print(slide.value)
        animator.fractionComplete = CGFloat(slide.value)
    }
}
