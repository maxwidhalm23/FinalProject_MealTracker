//
//  Meal.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 11/30/22.
//

import Foundation

class Meal {
    
    enum Day {
        case sunday, monday, tuesday, wednesday, thursday, friday, saturday
    }
    
    var name : String
    var price : Double
    var cal : Int
    
    init(name: String, price: Double, cal: Int, day: Day) {
        self.name = name
        self.price = price
        self.cal = cal
    }
    
    
    
}
