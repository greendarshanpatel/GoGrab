//
//  OrdersTableViewCell.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var OrderStatus: UILabel!
    @IBOutlet weak var orderCost: UILabel!
    @IBOutlet weak var ItemCount: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
