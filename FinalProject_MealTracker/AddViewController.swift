//
//  AddViewController.swift
//  FinalProject_MealTracker
//
//  Created by DEKLAN KIRK on 12/2/22.
//

import UIKit


class AddViewController: UIViewController {
    
    var selectedDay : Day = Day.sunday // sunday is temp
    var selectedID : Int = 0 // 0-6, 0 = sunday, 1 = monday, 2 = tuesday... 7 = all
    
    
    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    @IBOutlet weak var priceTextFieldOutlet: UITextField!
    @IBOutlet weak var calTextFieldOutlet: UITextField!
    
    @IBOutlet weak var dayOutlet: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        default: selectedDay = Day.sunday
            selectedID = 0
            
        }
    }
    
    @IBAction func addMealAction(_ sender: Any) {
        AppData.allMeals[AppData.selectedDay].append(Meal(name: nameTextFieldOutlet.text!, price: Double(priceTextFieldOutlet.text!)!, cal: Int(calTextFieldOutlet.text!)!, day: selectedDay))
        performSegue(withIdentifier: "addViewToList", sender: nil)
    }
    

}
