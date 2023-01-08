//
//  TableViewController.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 2.01.2023.
//

import UIKit

class TableViewController: UIViewController {
    
    private var cars = [Car]()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Table View additions
        TableView.separatorEffect = .none
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(.init(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "CarTableViewCell")
        fetchData {
            self.TableView.reloadData()
            // When data come activity indicator should be hidden.
            self.activityIndicator.isHidden = true
            print("Success..")
        }
    }
 
//MARK: Fetching Datas.
    func fetchData(completed: @escaping () -> ()) {
        if let url = URL(string: "https://car-data.p.rapidapi.com/cars?limit=50"){
            self.activityIndicator.startAnimating()
            var request : URLRequest = .init(url: url)
            request.addValue("1d05ef09bamsh070c519a67e4370p159c0bjsn55a3e211dd9b", forHTTPHeaderField: "X-RapidAPI-Key")
            request.addValue("car-data.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data,response,error in
                if error != nil {
                    return
                }
                if let data = data {
                    do {
                        let cars = try! JSONDecoder().decode([Car].self, from: data)
                        self.cars = cars
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                        print("Decoding error")
                    }
                }
            }
            task.resume()
        }
    }
}

//MARK: Extensions for Table View(DataSource and Delegate)
extension TableViewController :UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        print("\(indexPath.row) - \(car.make ?? "" )")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
        let car = cars[indexPath.row]
        cell.carLabel?.text = car.make?.capitalized
        
        // CarTableViewCell's borders.
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layer.borderWidth = 3.0
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.cornerRadius = 25
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        cell.layer.shadowRadius = 5.0
        cell.clipsToBounds = true
        // Button to go Detail View and Update Detail view's datas.
        cell.button = {[unowned self] in
            let car = self.cars[indexPath.row].make
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                vc.cars = self.cars[indexPath.row]
                present(vc,animated:true, completion: nil)
            }
        }
        return cell
    }
}

