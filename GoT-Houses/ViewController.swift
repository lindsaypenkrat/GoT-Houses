//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Lindsay Penkrat on 4/16/21.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var tableView: UITableView!
    
    var houses = Houses ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    



}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count
    } //sets the numbers of rows in table view based on size of houses array
    
    //return cell we set up every time xcode needs to set up a new cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = houses.houseArray[indexPath.row].name
        return cell
    }
    
    
}

