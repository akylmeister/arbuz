//
//  CollectionTableViewCell.swift
//  Arbuz
//
//  Created by admin on 28.05.2022.
//

import UIKit


class CollectionTableViewCell: UITableViewCell{

    static let identifier = "CollectionTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    func configure(with arbuzs: [Arbuz]){
        self.arbuzs = arbuzs
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var arbuzs = [Arbuz]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        collectionView?.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView.allowsMultipleSelection = true
    }
    
}
extension CollectionTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arbuzs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        cell.configure(with: arbuzs[indexPath.row])
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.green
            cell.selectedBackgroundView = backgroundView
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
}
extension CollectionTableViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.indexPathsForSelectedItems?.count != nil{
            return collectionView.indexPathsForSelectedItems!.count < 3
        }
        return true
    }
}
extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout{
    
}

