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
        
        //1 Create Alert Controller
        let alertAll = UIAlertController(title: "Error", message: "At least one field is empty", preferredStyle: .alert)
        let alertPrice = UIAlertController(title: "Error", message: "Price must be a decimal or whole number", preferredStyle: .alert)
        let alertCal = UIAlertController(title: "Error", message: "Calories must be a whole number", preferredStyle: .alert)
        
        //2 Create Actions
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
       
        //3 Add Actions
        alertAll.addAction(okAction)
        alertPrice.addAction(okAction)
        alertCal.addAction(okAction)
        
        //4 Present Alert Controller
        if nameTextFieldOutlet.text == "" || priceTextFieldOutlet.text == "" || calTextFieldOutlet.text == "" {
            present(alertAll, animated: true, completion: nil)
        }
        
        guard let p = Double(priceTextFieldOutlet.text!)
        else {
            present(alertPrice, animated: true, completion: nil)
            return
        }
        
        guard let c = Int(calTextFieldOutlet.text!)
        else {
            present(alertCal, animated: true, completion: nil)
            return
        }
        
        AppData.allMeals[AppData.selectedDay].append(Meal(name: nameTextFieldOutlet.text!, price: Double(priceTextFieldOutlet.text!)!, cal: Int(calTextFieldOutlet.text!)!, day: selectedDay))
        
        let encoder = JSONEncoder()
        // saving to user defaults
        if let encoded = try? encoder.encode(AppData.allMeals) {
            UserDefaults.standard.set(encoded, forKey: "myMovies")
        }
        
        performSegue(withIdentifier: "addViewToList", sender: nil)
        
    }

}
