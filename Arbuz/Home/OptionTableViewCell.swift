//
//  OptionTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    
    static let identifier = "OptionTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "OptionTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
