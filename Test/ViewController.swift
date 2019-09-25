//
//  ViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func moveForward(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "second")
        
        present(vc, animated: true)
    }
}

