//
//  DateCollectionViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {

    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
    }
    
    static let identifier = "DateCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DateCollectionViewCell", bundle: nil)
    }
    public func configure(with date: String){
        self.dateLabel.text = date
    }
}
