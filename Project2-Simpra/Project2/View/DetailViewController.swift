//
//  DetailViewCellViewController.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 5.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var cars : Car?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        // Animate was started to dont come datas.
        activityIndicator.startAnimating()
        updateData()
        // Animate was stopped to come datas.
        activityIndicator.stopAnimating()
    
    }
    
    
    // Datas updated.
    func updateData(){
       
        yearLabel.text = "Year : \((cars?.year ?? 0))"
        idLabel.text = " ID : \((cars?.id ?? 0))"
        makeLabel.text = "Make : " + (cars?.make ?? "")
        modelLabel.text = "Model : " + (cars?.model ?? "")
        typeLabel.text = "Type : " + (cars?.type ?? "")
        
    }
}
