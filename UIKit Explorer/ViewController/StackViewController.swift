//
//  StackViewController.swift
//  UIKit Explorer
//
//  Created by 0xwangbo on 2019/3/7.
//  Copyright © 2019 Bo Wang. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nib = Bundle.main.loadNibNamed("StackViewController", owner: nil, options: nil)
        
        view = (nib?.first as? UIView) ?? view
        
        view.backgroundColor = UIColor.white
        title = "UIStackView"
        
        additionalSafeAreaInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
