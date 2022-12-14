//
//  EditMealController.swift
//  FinalProject_MealTracker
//
//  Created by DEKLAN KIRK on 12/6/22.
//

import UIKit

class EditMealController: UIViewController {
    
    var selectedDay : Day = Day.sunday
    var selectedID = 0

    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var priceOutlet: UITextField!
    
    @IBOutlet weak var calOutlet: UITextField!
    
    @IBOutlet weak var dayOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutlet.text = "\(AppData.allMeals[AppData.selectedDay][AppData.selectedRow].name)"
        priceOutlet.text = "\(AppData.allMeals[AppData.selectedDay][AppData.selectedRow].price)"
        calOutlet.text = "\(AppData.allMeals[AppData.selectedDay][AppData.selectedRow].cal)"

        // Do any additional setup after loading the view.
        dayOutlet.selectedSegmentIndex = AppData.selectedDay
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if isMovingFromParent{
            performSegue(withIdentifier: "editUnwindSegue", sender: nil)
        }
            
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
    
    @IBAction func editMealAction(_ sender: UIButton) {
        
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
        if nameOutlet.text == "" || priceOutlet.text == "" || calOutlet.text == "" {
            present(alertAll, animated: true, completion: nil)
        }
        
        guard let p = Double(priceOutlet.text!)
        else {
            present(alertPrice, animated: true, completion: nil)
            return
        }
        
        guard let c = Int(calOutlet.text!)
        else {
            present(alertCal, animated: true, completion: nil)
            return
        }
        
        AppData.allMeals[AppData.selectedDay][AppData.selectedRow].edit(name: nameOutlet.text!, price: Double(priceOutlet.text!)!, cal: Int(calOutlet.text!)!, day: selectedDay)
        
        let encoder = JSONEncoder()
        // saving to user defaults
        if let encoded = try? encoder.encode(AppData.allMeals) {
            UserDefaults.standard.set(encoded, forKey: "myMeals")
        }
        performSegue(withIdentifier: "editUnwindSegue", sender: nil)

    }
    


    

}
