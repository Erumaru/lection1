//
//  ViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var result: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadCategories()
    }
    
    func downloadCategories() {
        let url = URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/categories")!
        var request = try! URLRequest(url: url, method: .get)
        request.setValue("matchilling-chuck-norris-jokes-v1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        request.setValue("045a44f780msh7408af3128502f7p14705bjsnadba9166b682", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseJSON(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                let array = json as! [String]
                
                self.result = array
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        vc.titleText = "\(indexPath.row) ряд"
        
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

