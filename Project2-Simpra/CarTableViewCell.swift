//
//  MovieTableViewCell.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 2.01.2023.
//

import UIKit

class CarTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    // Clicked a button to go another view with using Closure Method.
    var button : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    // CarLabel's borders are updated.
        carLabel?.layer.borderWidth = 2.0
        carLabel?.layer.borderColor = UIColor.darkGray.cgColor
        carLabel?.layer.cornerRadius = 10

        self.layer.borderColor = UIColor.orange.cgColor
    }
    //When button pressed button func should be call.
    @IBAction func buttonPressed(_ sender: Any) {
        button?()
        
        }
    }




