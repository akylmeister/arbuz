//
//  TimeCollectionViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var timeLabel: UILabel!
    
    static let identifier = "TimeCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TimeCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 7
    }
    
    public func configure(with time: String){
        self.timeLabel.text = time
    }
}
