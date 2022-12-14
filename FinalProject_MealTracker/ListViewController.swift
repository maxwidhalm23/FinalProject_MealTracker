//
//  ListViewController.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 12/2/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let defualts = UserDefaults.standard
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var selectedDay : Day = Day.all // can be changed
    var selectedID : Int = 7 // 0-6, 0 = sunday, 1 = monday, 2 = tuesday... 7 = all
    
    
    @IBOutlet weak var mealTotalOutlet: UILabel!
    
    @IBOutlet weak var costTotalOutlet: UILabel!
    
    @IBOutlet weak var calTotalOutlet: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        mealTotal()
        totals()
        
        if let items = UserDefaults.standard.data(forKey: "myMeals") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([[Meal]].self, from: items) {
                AppData.allMeals = decoded
            }
        }

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
        AppData.selectedRow = indexPath.row
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
        
        
        tableViewOutlet.reloadData()
    }
    
    var totalMeals = 0
    func mealTotal(){
        for i in 0..<AppData.allMeals.count {
            totalMeals += AppData.allMeals[i].count
            }
        }
    func totals(){
        var totalCost = 0.0
        var totalCals = 0
            for i in 0..<totalMeals{
                for j in 0..<AppData.allMeals[i].count{
                    totalCals += AppData.allMeals[i][j].cal
                    totalCost += AppData.allMeals[i][j].price
                }
            }
        mealTotalOutlet.text = ("Meals: #\(totalMeals)")
        costTotalOutlet.text = ("Cost: $\(totalCost)")
        calTotalOutlet.text = ("Cal: \(totalCals)")
        
        }
    
    @IBAction func addMealAction(_ sender: UIButton) {
        performSegue(withIdentifier: "listViewToAdd", sender: nil)
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
    }
    

}
