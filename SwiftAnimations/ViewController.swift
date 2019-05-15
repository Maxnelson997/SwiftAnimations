//
//  ViewController.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/14/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let basicView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        basicView.backgroundColor = .blue
        basicView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(basicView)
        basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basicView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        basicView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        animateBox(to: .red)
        
        
    }
    
    fileprivate func animateBox(to color: UIColor) {
        
        UIView.animate(withDuration: 0.3, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.basicView.backgroundColor = .red
        })
        
        //        UIView.animate(withDuration: 1) {
        //            self.basicView.backgroundColor = .red
        //        }
    }
    
    
}

