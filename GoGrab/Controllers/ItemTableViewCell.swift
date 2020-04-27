//
//  ItemTableViewCell.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    /// making outlets of UIObjects and object cellItem of item Class
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var customView: ItemTableViewCell!
    var cellItem : Item!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
