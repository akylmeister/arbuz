//
//  HomeViewController.swift
//  Arbuz
//
//  Created by admin on 28.05.2022.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var arbuzs = [Arbuz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tableView?.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
        arbuzs.append(Arbuz("Спелый", 1.2, "Arbuz"))
    }
    
    @IBAction func savePressed(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: arbuzs)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
