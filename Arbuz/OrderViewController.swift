//
//  OrderViewController.swift
//  Arbuz
//
//  Created by admin on 28.05.2022.
//

import UIKit
import Foundation

class OrderViewController: UIViewController{
    
    var selectArr = ["Посмотреть арбузы", "Порезать дольками"]
    var placeholderText = ["Имя получателя", "Комментарий"]
    var timeDelivery = ["8:00-10:00","10:00-12:00","12:00-14:00","14:00-16:00","16:00-18:00","18:00-20:00","20:00-22:00","22:00-00:00"]
    var dateDelivery = [String]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SelectTableViewCell.self, forCellReuseIdentifier: SelectTableViewCell.identifier)
        table.register(OptionTableViewCell.self, forCellReuseIdentifier: OptionTableViewCell.identifier)
        table.register(DeliveryTableViewCell.self, forCellReuseIdentifier: DeliveryTableViewCell.identifier)
        table.register(DateTableViewCell.nib(), forCellReuseIdentifier: DateTableViewCell.identifier)
        table.register(TimeTableViewCell.nib(), forCellReuseIdentifier: TimeTableViewCell.identifier)
        table.register(TotalTableViewCell.self, forCellReuseIdentifier: TotalTableViewCell.identifier)
        table.register(PaymentTableViewCell.self, forCellReuseIdentifier: PaymentTableViewCell.identifier)
        table.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        
        return table
    }()
    override func viewWillAppear(_ animated: Bool) {
        addCurrentDate()
        print(dateDelivery)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    func addCurrentDate(){
        var count = 1
        var date = Foundation.Date()
        while count != 10{
            var dateComponent = DateComponents()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM"
            dateDelivery.append(dateFormatter.string(from: date))
            dateComponent.day = 1
            date = Calendar.current.date(byAdding: dateComponent, to: date)!
            count = count + 1
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension OrderViewController: UITableViewDelegate{
    
}


extension OrderViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 5:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath)
            cell.imageView?.image = UIImage(systemName: "pizza")
            cell.textLabel?.text = "Посмотреть арбузы"
            
            return cell
        }
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.identifier, for: indexPath)
//            cell.imageView?.image = UIImage(systemName: "pizza")
            cell.textLabel?.text = "Порезать дольками"
            cell.accessoryView = UISwitch()
            
            return cell
        }
        
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryTableViewCell.identifier, for: indexPath)
            cell.imageView?.image = UIImage(systemName: "car")
            cell.textLabel?.text = "Выбрать адрес"
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
            cell.configure(with: dateDelivery)
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: TimeTableViewCell.identifier, for: indexPath) as! TimeTableViewCell
            cell.configure(with: timeDelivery)
            return cell
        }
        else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
            cell.configure(with: placeholderText[indexPath.row])
            return cell
        }
        else if indexPath.section == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.identifier, for: indexPath) as! PaymentTableViewCell
            cell.configure()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TotalTableViewCell.identifier, for: indexPath) as! TotalTableViewCell
            cell.configure(with: 38)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x:0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        if section == 0{
            label.text = "Выберите арбуз"
        }
        else if section == 1{
            label.text = "Опции"
        }
        else if section == 2{
            label.text = "Адрес доставки"
        }
        else if section == 3{
            label.text = "Дата доставки"
        }
        else if section == 4{
            label.text = "Время доставки"
        }
        else if section == 5{
            label.text = "Контактная информация"
        }
        else if section == 6{
            label.text = "Оплата"
        }
        label.font = .boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 7{
            return CGFloat(210)
        }
        return CGFloat(50)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "navBar")
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated:true, completion:nil)
        }
        else if indexPath.section == 2{
            alertCont()
        }
    }
    func alertCont(){
        let alert = UIAlertController(title: "Введите адрес",message: "",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Улица и номер дома"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Квартира"
        }
        alert.addAction(UIAlertAction(title: "Подтвердить адрес", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
