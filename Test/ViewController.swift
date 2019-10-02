//
//  ViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit
import Alamofire

// ЧТО ТАКОЕ TABLE VIEW DELEGATE!!
class TableView: UIView {
    var delegate: TableViewDelegate?
    var dataSource: TableViewDataSource?

    func selectRow(indexPath: IndexPath) {
        delegate?.didSelectRow(indexPath: indexPath)
    }
    
    func reloadData() {
        let count = dataSource?.numberOfRow()
    }
    
    func showRowAt(indexPath: IndexPath) {
        let row = dataSource?.cellForRow(at: indexPath)
    }
}

protocol TableViewDataSource {
    func numberOfRow() -> Int
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell
}

protocol TableViewDelegate: UIViewController {
    func didSelectRow(indexPath: IndexPath)
}

class ViewController: UIViewController, TableViewDelegate {
    var tableView = TableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    }

    func didSelectRow(indexPath: IndexPath) {

    }
}

// ЭТО ПРОТОКОЛЫ
//protocol Moveable {
//    func move()
//}
//
//class Dog: Moveable {
//    func move() {
//
//    }
//}
//
//class Human: Moveable {
//    func move() {
//
//    }
//}
//
//class ViewController: UIViewController {
//    var moveables: [(Int, Moveable)] = [(0, Human()), (1, Dog())]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        for i in 0..<10 {
//
//        }
//
//        moveables.forEach { first in
//
//        }
//    }
//}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var result: [String] = Joke.categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadCategories()
    }
    
    func downloadCategories() {
        Joke.downloadCategories { [weak self] categories in
            guard let self = self else { return }
            
            self.result = categories
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        let cell = tableView.cellForRow(at: indexPath) as! TitleTableViewCell
        
        vc.category = cell.titleLabel.text!
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabelViewCell", for: indexPath) as! TitleTableViewCell
        
        cell.titleLabel.text = result[indexPath.row]
        
        return cell
    }
}

