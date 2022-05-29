//
//  SelectTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class SelectTableViewCell: UITableViewCell {

    static let identifier = "SelectTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SelectTableViewCell", bundle: nil)
    }
    public let myOption: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(text: String){
        myOption.text = text
        contentView.addSubview(myOption)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myOption.frame = CGRect(x: 20, y: 10, width: contentView.frame.size.width-20, height: 40)
    }

}
