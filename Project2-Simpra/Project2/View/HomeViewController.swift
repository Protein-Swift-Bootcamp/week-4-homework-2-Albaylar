//
//  HomeViewController.swift.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 29.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carImage.layer.cornerRadius = carImage
            .frame.height / 10.0
        carImage.layer.masksToBounds = true
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }
    }
}
