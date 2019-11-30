//
//  StoresTableViewController.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/11/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit
import SDWebImage
import DropDown

class StoresTableViewController: UITableViewController {

    
    @IBOutlet weak var sortBtn: UISegmentedControl!
    var latitudeYelp = [String]()
    var longitudeYelp = [String]()
    var storeNameYelp = [String]()

    private var restaurants: [Restaurant] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YelpRequest.sharedInstance.configureLocation(location: LeagueMapController.sharedInstance.address){ (response) -> () in

            DispatchQueue.main.async(execute: {
                self.restaurants = response
                self.tableView.reloadData()
            })
        }
        
        let a = FireBaseRequest()
        a.retrieveData()
        
        //Navigation
        self.navigationItem.title = title
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
    }
    
    //Backbutton creation
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "backButton2")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setTitle("  Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}


// MARK: - UITableViewDataSource
extension StoresTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storesPrototype", for: indexPath) as? RestaurantsTableViewCell else {
            fatalError("Unable to Dequeue Weather Day Table View Cell")
        }


        guard indexPath.row <= restaurants.count else {
            return cell
        }
        
        func sortStores(restaurant: Restaurant){
            cell.photoImageView?.sd_setImage(with: URL(string: restaurant.imageUrl), placeholderImage: UIImage(named: "Placeholder.png"))
            cell.LabelTeam?.text = restaurant.name
            cell.ratingControl?.rating = Int(round(restaurant.rating))
            cell.ratingControl?.isUserInteractionEnabled = false
            cell.distanceLabel?.text = "distance: \(round(restaurant.distance)) m"
            storeNameYelp.append(restaurant.name)
            for (key, value) in restaurant.coordinates {
                if(key == "latitude"){
                    latitudeYelp.append("\(value)")
                }else if(key == "longitude"){
                    longitudeYelp.append("\(value)")
                }
            }
            
        }
        
        if sortBtn.selectedSegmentIndex != 0 {
            let restaurantSorted = restaurants.sorted(by: { $0.distance < $1.distance })[indexPath.row]
            sortStores(restaurant: restaurantSorted)
            
        } else {
            let restaurantSorted = restaurants.sorted(by: { $0.rating > $1.rating })[indexPath.row]
            sortStores(restaurant: restaurantSorted)

        }
        
        


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        StoreMapController.sharedInstance.latitudeYelpChosen = Double(latitudeYelp[indexPath.row])!
        StoreMapController.sharedInstance.longitudeYelpChosen = Double(longitudeYelp[indexPath.row])!
        StoreMapController.sharedInstance.storeNameYelpChosen = storeNameYelp[indexPath.row]
        performSegue(withIdentifier: "showMap", sender: self)
    }
}
