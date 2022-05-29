//
//  PaymentTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    static let identifier = "PaymentTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "PaymentTableViewCell", bundle: nil)
    }
    private let paymentMethod: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Банковской картой", "Наличныму курьеру"])
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .green
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.backgroundColor = .white
        
        return sc
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(){
        contentView.addSubview(paymentMethod)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        paymentMethod.frame = CGRect(x: 20, y: 5, width: contentView.frame.size.width-40, height: 40)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
