//
//  ViewController.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 11/29/22.
//

import UIKit
class AppData {

    static var selectedRow = 0

    static var sunMeals = [Meal]()
    static var monMeals = [Meal]()
    static var tueMeals = [Meal]()
    static var wedMeals = [Meal]()
    static var thuMeals = [Meal]()
    static var friMeals = [Meal]()
    static var satMeals = [Meal]()
    
    static var allMeals = [sunMeals, monMeals, tueMeals, wedMeals, thuMeals, friMeals, satMeals]
    
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

