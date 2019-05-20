//
//  NotifcationController.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/20/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class NotificationController: UIViewController {
    
    let button = MCAnimatedButton(title: "Add To Cart")
    let notification = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupButton()
        setupNotification()
    }
    
    fileprivate func setupButton() {
        view.addSubview(button)
        
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    fileprivate func setupNotification() {
        let notiLabel = UILabel()
        notiLabel.translatesAutoresizingMaskIntoConstraints = false
        notiLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        notiLabel.textColor = .white
        notiLabel.text = "Added In App Purchase To Cart."
        
        view.addSubview(notification)
        notification.backgroundColor = .lightGray
        notification.translatesAutoresizingMaskIntoConstraints = false
        notification.heightAnchor.constraint(equalToConstant: 40).isActive = true
        notification.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        notification.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        
        notification.addSubview(notiLabel)
        notiLabel.leftAnchor.constraint(equalTo: notification.leftAnchor, constant: 20).isActive = true
        notiLabel.centerYAnchor.constraint(equalTo: notification.centerYAnchor).isActive = true
    }
}
