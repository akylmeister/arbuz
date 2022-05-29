//
//  ContactTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    static let identifier = "ContactTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "ContactTableViewCell", bundle: nil)
    }
    
    public let myTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func configure(with placeholder: String){
        myTextField.placeholder = placeholder
        contentView.addSubview(myTextField)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myTextField.frame = CGRect(x: 20, y: 10, width: contentView.frame.size.width-20, height: 40)
    }
}
