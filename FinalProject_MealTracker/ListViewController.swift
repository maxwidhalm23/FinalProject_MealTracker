//
//  ListViewController.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 12/2/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var selectedDay : Day = Day.all // sunday is temp
    var selectedID : Int = 7 // 0-6, 0 = sunday, 1 = monday, 2 = tuesday... 7 = all
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedDay == Day.all {
            var sum = 0
            for i in 0..<AppData.allMeals.count {
                sum += AppData.allMeals[i].count
            }
            return sum
        }
        return AppData.allMeals[AppData.selectedDay].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MealCell
        cell.configure(name: AppData.allMeals[AppData.selectedDay][indexPath.row].name, price: AppData.allMeals[AppData.selectedDay][indexPath.row].price, cal: AppData.allMeals[AppData.selectedDay][indexPath.row].cal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            AppData.allMeals[AppData.selectedDay].remove(at: indexPath.row)
            tableViewOutlet.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //AppData.selectedRow = indexPath.row
        performSegue(withIdentifier: "listToEdit", sender: nil)
    }
    
    @IBAction func dayAction(_ sender: UISegmentedControl) {
        let select = sender.selectedSegmentIndex
        
        switch select {
        case 0: selectedDay = Day.sunday
            selectedID = 0
        case 1: selectedDay = Day.monday
            selectedID = 1
        case 2: selectedDay = Day.tuesday
            selectedID = 2
        case 3: selectedDay = Day.wednesday
            selectedID = 3
        case 4: selectedDay = Day.thursday
            selectedID = 4
        case 5: selectedDay = Day.friday
            selectedID = 5
        case 6: selectedDay = Day.saturday
            selectedID = 6
        case 7: selectedDay = Day.all
            selectedID = 7
        default: selectedDay = Day.all
            selectedID = 7
            
        }
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
    }
    

}
