//
//  EditMealController.swift
//  FinalProject_MealTracker
//
//  Created by DEKLAN KIRK on 12/6/22.
//

import UIKit

class EditMealController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var priceOutlet: UITextField!
    
    @IBOutlet weak var calOutlet: UITextField!
    
    @IBOutlet weak var dayOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if isMovingFromParent{
            performSegue(withIdentifier: "editUnwindSegue", sender: nil)
        }
            
    }
    
    @IBAction func editMealAction(_ sender: UIButton) {
        AppData.meals[AppData.selectedRow] = (Meal(name: nameOutlet.text!, price: Double(priceOutlet.text!)!, cal: Int(calOutlet.text!)!, day: Meal.Day.sunday))
        performSegue(withIdentifier: "editUnwindSegue", sender: nil)

    }
    


    

}
