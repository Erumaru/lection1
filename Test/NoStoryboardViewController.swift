//
//  NoStoryboardViewController.swift
//  Test
//
//  Created by erumaru on 10/2/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class NoStoryboardViewController: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.tableFooterView = UIView()
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.showsVerticalScrollIndicator = false
        view.estimatedRowHeight = 300
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 1.0).isActive = true
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1.0).isActive = true
    }
}
