//
//  AutoLayoutAnchorViewController.swift
//  UIKit Explorer
//
//  Created by 0xwangbo on 2019/3/6.
//  Copyright © 2019 Bo Wang. All rights reserved.
//

import UIKit

class AutoLayoutAnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "NSAutoLayoutAnchor"
        
        let layoutGuid = self.view.safeAreaLayoutGuide
        
        let redView = UIView.init()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        redView.topAnchor.constraint(equalTo: layoutGuid.topAnchor, constant: 20).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.centerXAnchor.constraint(equalTo: layoutGuid.centerXAnchor, constant: 0).isActive = true
        
        let blueView = UIView.init()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.centerXAnchor.constraint(equalTo: layoutGuid.centerXAnchor, constant: 0).isActive = true
    }
    

}
