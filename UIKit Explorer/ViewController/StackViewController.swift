//
//  StackViewController.swift
//  UIKit Explorer
//
//  Created by 0xwangbo on 2019/3/7.
//  Copyright © 2019 Bo Wang. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    var previewStackView: UIStackView!
    var operatorPanelStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonSetup()
        setupstackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func commonSetup() {
        view.backgroundColor = UIColor.white
        title = "UIStackView"
        
        additionalSafeAreaInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setupstackView() {
        // previewStackView
        previewStackView = UIStackView.init(arrangedSubviews: [])
        previewStackView.isLayoutMarginsRelativeArrangement = true
        previewStackView.axis = .horizontal
        previewStackView.distribution = .fillEqually
        previewStackView.alignment = .fill
        view.addSubview(previewStackView)
        
        let view1 = UIView.init()
        view1.backgroundColor = UIColor.red
        previewStackView.addArrangedSubview(view1)
        
        let view2 = UIView.init()
        view2.backgroundColor = UIColor.blue
        previewStackView.addArrangedSubview(view2)
        
        let view3 = UIView.init()
        view3.backgroundColor = UIColor.yellow
        previewStackView.addArrangedSubview(view3)
        
        let view4 = UIView.init()
        view4.backgroundColor = UIColor.orange
        previewStackView.addArrangedSubview(view4)
        
        //
        let leftPanel = UIStackView.init(arrangedSubviews: [])
        leftPanel.axis = .vertical
        leftPanel.distribution = .fillEqually
        leftPanel.alignment = .fill
        
        let horizontalBtn = UIButton.init()
        horizontalBtn.tag = 1
        horizontalBtn.setTitle("Horizontal", for: UIControl.State.normal)
        horizontalBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        horizontalBtn.addTarget(self, action: #selector(action(_:)), for: UIControl.Event.touchUpInside)
        leftPanel.addArrangedSubview(horizontalBtn)
        
        let verticalBtn = UIButton.init()
        verticalBtn.tag = 2
        verticalBtn.setTitle("Vertical", for: UIControl.State.normal)
        verticalBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        verticalBtn.addTarget(self, action: #selector(action(_:)), for: UIControl.Event.touchUpInside)
        leftPanel.addArrangedSubview(verticalBtn)
        
        //
        let rightPanel = UIStackView.init(arrangedSubviews: [])
        rightPanel.axis = .vertical
        rightPanel.distribution = .fillEqually
        rightPanel.alignment = .fill
        
        let noSpaceBtn = UIButton.init()
        noSpaceBtn.tag = 3
        noSpaceBtn.setTitle("No Space", for: UIControl.State.normal)
        noSpaceBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        noSpaceBtn.addTarget(self, action: #selector(action(_:)), for: UIControl.Event.touchUpInside)
        rightPanel.addArrangedSubview(noSpaceBtn)
        
        let spaceBtn = UIButton.init()
        spaceBtn.tag = 4
        spaceBtn.setTitle("Space 20", for: UIControl.State.normal)
        spaceBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        spaceBtn.addTarget(self, action: #selector(action(_:)), for: UIControl.Event.touchUpInside)
        rightPanel.addArrangedSubview(spaceBtn)
        
        // operatorPanelStackView
        operatorPanelStackView = UIStackView.init(arrangedSubviews: [])
        operatorPanelStackView.axis = .horizontal
        operatorPanelStackView.distribution = .fillEqually
        operatorPanelStackView.alignment = .fill
        view.addSubview(operatorPanelStackView)
        operatorPanelStackView.addArrangedSubview(leftPanel)
        operatorPanelStackView.addArrangedSubview(rightPanel)
    }
    
    func layoutstackView() {
        let layoutGuide = self.view.safeAreaLayoutGuide
        
        previewStackView.translatesAutoresizingMaskIntoConstraints = false
        previewStackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 20).isActive = true
        previewStackView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0).isActive = true
        previewStackView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0).isActive = true
        previewStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        operatorPanelStackView.translatesAutoresizingMaskIntoConstraints = false
        operatorPanelStackView.topAnchor.constraint(equalTo: previewStackView.bottomAnchor, constant: 40).isActive = true
        operatorPanelStackView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0).isActive = true
        operatorPanelStackView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0).isActive = true
        operatorPanelStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    override func viewLayoutMarginsDidChange() {
        layoutstackView()
    }


    // MAEK: - Action
    
    @objc func action(_ sender: UIButton) {
        var doChange: () -> ()
        
        switch sender.tag {
        case 1:
            doChange = {
                self.previewStackView.axis = .horizontal
            }
        case 2:
            doChange = {
                self.previewStackView.axis = .vertical
            }
        case 3:
            doChange = {
                self.previewStackView.spacing = 0
            }
        case 4:
            doChange = {
                self.previewStackView.spacing = 20
            }
        default:
            doChange = {}
        }
        
     UIView.animate(withDuration: 0.5, animations: doChange)
    }
}
