//
//  SecondViewController.swift
//  Test
//
//  Created by erumaru on 9/25/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "first")
        
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
}
