//
//  ItemCollectionViewCell.swift
//  Arbuz
//
//  Created by admin on 28.05.2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    static let identifier = "ItemCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ItemCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with arbuz: Arbuz){
        self.statusLabel.text = arbuz.status
        self.weightLabel.text = String(arbuz.weight)
        self.myImageView.image = UIImage(named: arbuz.imageName)
        self.myImageView.contentMode = .scaleAspectFill
    }
}
