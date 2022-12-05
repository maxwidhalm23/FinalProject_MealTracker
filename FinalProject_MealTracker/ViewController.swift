//
//  ViewController.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 11/29/22.
//

import UIKit
class AppData {
    static var meals = [Meal]()
    
}

class ViewController: UIViewController {
    
    

    var test = 0
    var test2 = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addMealAction(_ sender: UIButton) {
        performSegue(withIdentifier: "addMealSegue", sender: nil)
    }
    
    @IBAction func mealListAction(_ sender: UIButton) {
        performSegue(withIdentifier: "listSegue", sender: nil)
    }
    
}

