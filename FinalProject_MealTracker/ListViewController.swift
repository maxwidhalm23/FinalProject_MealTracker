//
//  ListViewController.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 12/2/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MealCell
        cell.configure(name: AppData.meals[indexPath.row].name, price: AppData.meals[indexPath.row].price, cal: AppData.meals[indexPath.row].cal)
        return cell
    }
    
    
    

}
