//
//  PacificLeagueDataSourcer.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/9/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    var teams = [String]()
    var address = [String]()
    var city = [String]()
    var identifier = String()
    var images =  [UIImage]()
    var colors = [UIColor]()
    var latitudes = [Double]()
    var longitudes = [Double]()
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
        
        cell.textLabel?.text = teams[indexPath.row]
        //cell.accessoryType = .detailDisclosureButton
        cell.imageView?.image = images[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 28.0)
        
        return cell
    }
    

    
}

