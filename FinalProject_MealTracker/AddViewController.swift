//
//  AddViewController.swift
//  FinalProject_MealTracker
//
//  Created by DEKLAN KIRK on 12/2/22.
//

import UIKit


class AddViewController: UIViewController {
    
    var selectedDay : Day = Day.sunday
    
    
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
        case 1: selectedDay = Day.monday
        case 2: selectedDay = Day.tuesday
        case 3: selectedDay = Day.wednesday
        case 4: selectedDay = Day.thursday
        case 5: selectedDay = Day.friday
        case 6: selectedDay = Day.saturday
        default: selectedDay = Day.sunday
            
        }
    }
    
    @IBAction func addMealAction(_ sender: Any) {
        AppData.sunMeals.append(Meal(name: nameTextFieldOutlet.text!, price: Double(priceTextFieldOutlet.text!)!, cal: Int(calTextFieldOutlet.text!)!, day: selectedDay))
        performSegue(withIdentifier: "addViewToList", sender: nil)
    }
    

}
