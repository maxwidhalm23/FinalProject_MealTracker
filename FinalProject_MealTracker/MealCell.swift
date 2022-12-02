//
//  MealCell.swift
//  FinalProject_MealTracker
//
//  Created by MAX WIDHALM on 12/2/22.
//

import UIKit

class MealCell: UITableViewCell {
    
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var priceLabelOutlet: UILabel!
    @IBOutlet weak var caloriesLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name:String, price:Double, cal: Int)
    {
        nameLabelOutlet.text = "\(name)"
        priceLabelOutlet.text = "$\(price)"
        caloriesLabelOutlet.text = "\(cal) Cal"
    }

}
