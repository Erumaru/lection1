//
//  TitleTableViewCell.swift
//  Test
//
//  Created by erumaru on 9/25/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var doSomething: ((String) -> Void)?
    
    
}
