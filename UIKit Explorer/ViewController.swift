//
//  ViewController.swift
//  UIKit Explorer
//
//  Created by 0xwangbo on 2019/3/4.
//  Copyright © 2019 Bo Wang. All rights reserved.
//

import UIKit
import ObjectiveC.runtime

fileprivate struct TableViewSectionItem {
    let titile: String
    var oder: Int
    let items: [String]
    let itemClasses: [AnyClass]
}

class ViewController: UIViewController {
    
    fileprivate var tableView: UITableView!
    
    fileprivate var tableViewSectionItems = [TableViewSectionItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let navLine: UIView = self.navigationController!.navigationBar.subviews[0].subviews[0]
        //navLine.isHidden = true
        
        setupData()
        
        setupSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = StackViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func setupData() {
        let items = ["NSLayoutAnchor", "UIStackView"]
        let itemClasses = [AutoLayoutAnchorViewController.self, StackViewController.self]
        
        let autoLayoutSection = TableViewSectionItem.init(titile: "Auto Layout", oder: 0, items: items, itemClasses: itemClasses)
        tableViewSectionItems.append(autoLayoutSection)
    }
    
    fileprivate func setupSubView() {
        tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let layoutGuide = self.view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = class_createInstance(tableViewSectionItems[indexPath.section].itemClasses[indexPath.row], 0) as? UIViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSectionItems[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableViewSectionItems[indexPath.section].items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewSectionItems[section].titile
    }
    
    
}

