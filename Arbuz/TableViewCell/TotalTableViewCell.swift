//
//  TotalTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class TotalTableViewCell: UITableViewCell {

    static let identifier = "TotalTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "TotalTableViewCell", bundle: nil)
    }
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Продукты"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Стоимость доставки"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2500 ₸"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    private let deliveryPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "0 ₸"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2500 ₸"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 9
        button.setTitle("Подтвердить заказ", for: .normal)
        return button
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @objc func submitPressed(){
        let alert = UIAlertController(title: "Ожидайте заказ в указанное время",message: "",
                                      preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Хорошо", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
    public func configure(with weight: Int){
        contentView.addSubview(productLabel)
        contentView.addSubview(deliveryLabel)
        contentView.addSubview(totalLabel)
        
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(deliveryPriceLabel)
        contentView.addSubview(totalPriceLabel)
        
        contentView.addSubview(submitButton)
        submitButton.addTarget(TotalTableViewCell.self, action: #selector(submitPressed), for: .touchDown)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        productLabel.frame = CGRect(x: 20, y: 10, width: contentView.frame.size.width/2, height: 40)
        deliveryLabel.frame = CGRect(x: 20, y: 40, width: contentView.frame.size.width/2, height: 40)
        totalLabel.frame = CGRect(x: 20, y: 90, width: contentView.frame.size.width/2, height: 40)
        
        productPriceLabel.frame = CGRect(x: contentView.center.x - 20, y: 10, width: contentView.frame.size.width/2, height: 40)
        deliveryPriceLabel.frame = CGRect(x: contentView.center.x - 20, y: 40, width: contentView.frame.size.width/2, height: 40)
        totalPriceLabel.frame = CGRect(x: contentView.center.x - 20, y: 90, width: contentView.frame.size.width/2, height: 40)

        submitButton.frame = CGRect(x: 20, y: 150, width: contentView.frame.size.width-40, height: 50)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
