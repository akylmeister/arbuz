//
//  DateTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    static let identifier = "DateTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "DateTableViewCell", bundle: nil)
    }
    
    func configure(with dates: [String]){
        self.dates = dates
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var dates = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        collectionView.register(DateCollectionViewCell.nib(), forCellWithReuseIdentifier: DateCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 10
    }
}
extension DateTableViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.identifier, for: indexPath) as! DateCollectionViewCell
        cell.configure(with: dates[indexPath.row])
        print(indexPath)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.green
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 50)
    }
}

extension DateTableViewCell: UICollectionViewDelegate{
    
}
extension DateTableViewCell: UICollectionViewDelegateFlowLayout{
    
}
