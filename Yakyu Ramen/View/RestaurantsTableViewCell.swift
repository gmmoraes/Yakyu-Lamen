//
//  RestaurantsTableViewCell.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 12/27/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit
//import Siesta

class RestaurantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LabelTeam: UILabel?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var ratingControl: RatingControl?
    @IBOutlet weak var distanceLabel: UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
