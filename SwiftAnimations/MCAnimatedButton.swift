//
//  MCAnimatedButton.swift
//  SwiftAnimations
//
//  Created by Max Nelson on 5/15/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCAnimatedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        phaseTwo(title: "Button")
    }

    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 54).isActive = true
        phaseTwo(title: title)
    }
    
    fileprivate func phaseTwo(title: String) {
        
        layer.cornerRadius = 12
        backgroundColor = .blue
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateButton)))
        addTarget(self, action: #selector(animateButton), for: .touchDown)
        addTarget(self, action: #selector(animateButton), for: .touchUpInside)
    }
    
    @objc fileprivate func animateButton() {
        print("run this code")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
