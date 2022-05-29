//
//  DeliveryTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    static let identifier = "DeliveryTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DeliveryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
