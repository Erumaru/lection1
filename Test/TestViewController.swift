//
//  TestViewController.swift
//  Test
//
//  Created by erumaru on 10/2/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = NoStoryboardViewController()
        present(vc, animated: true, completion: nil)
    }
}
