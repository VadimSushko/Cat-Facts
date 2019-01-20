//
//  ViewController.swift
//  Cat Facts
//
//  Created by Vadym Sushko on 1/17/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit
import SwiftyJSON

class FactsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var jsonText = [String]()
    var jsonFirstName = [String]()
    var jsonLastName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        myTableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return jsonText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.nameLabel.font = UIFont(name: "Verdana", size: 22)
        cell.nameLabel.text = jsonFirstName[indexPath.row] + " " + jsonLastName[indexPath.row]
        cell.factTextLabel.text = jsonText[indexPath.row]
        
        return cell
    }
 
    func loadData() {
        
        let urlString = "https://cat-fact.herokuapp.com/facts"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let json = try JSON(data: data!)
                
                self.jsonText = json["all"].arrayValue.map({$0["text"].stringValue})

                self.jsonFirstName = json["all"].arrayValue.map({$0["user"]["name"]["first"].stringValue})
                
                self.jsonLastName = json["all"].arrayValue.map({$0["user"]["name"]["last"].stringValue})
                
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if !UserDefaults.standard.bool(forKey: Keys.isRegistered){
            performSegue(withIdentifier: "RegistrationSegue", sender: self)
        }
        if !UserDefaults.standard.bool(forKey: Keys.isLogged){
            performSegue(withIdentifier: "AuthorizationSegue", sender: self)
        }
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: Keys.isLogged)
        performSegue(withIdentifier: "AuthorizationSegue", sender: self)
    }
    
}

