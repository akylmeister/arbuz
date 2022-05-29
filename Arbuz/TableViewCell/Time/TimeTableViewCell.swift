//
//  TimeTableViewCell.swift
//  Arbuz
//
//  Created by admin on 29.05.2022.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    var timeDelivery = [String]()

    
    static let identifier = "TimeTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TimeTableViewCell", bundle: nil)
    }
    func configure(with dates: [String]){
        self.timeDelivery = dates
//        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        collectionView.register(TimeCollectionViewCell.nib(), forCellWithReuseIdentifier: TimeCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.layer.cornerRadius = 10
    }
}
extension TimeTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeDelivery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier, for: indexPath) as! TimeCollectionViewCell
        cell.configure(with: timeDelivery[indexPath.row])
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.green
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}
extension TimeTableViewCell: UICollectionViewDelegate{
    
}
extension TimeTableViewCell: UICollectionViewDelegateFlowLayout{
    
}
