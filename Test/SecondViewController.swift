//
//  SecondViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
    }
}
