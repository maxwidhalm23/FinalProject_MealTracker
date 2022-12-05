//
//  AddViewController.swift
//  FinalProject_MealTracker
//
//  Created by DEKLAN KIRK on 12/2/22.
//

import UIKit

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    @IBOutlet weak var priceTextFieldOutlet: UITextField!
    @IBOutlet weak var calTextFieldOutlet: UITextField!
    
    @IBOutlet weak var dayOutlet: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addMealAction(_ sender: Any) {
    }
    

}
