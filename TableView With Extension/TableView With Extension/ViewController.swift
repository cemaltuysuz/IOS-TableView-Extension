//
//  ViewController.swift
//  TableView With Extension
//
//  Created by cemal tüysüz on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["Turkey","Germany","Japan","Russia","Italia"]
               
         tableView.delegate = self
         tableView.dataSource = self
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    // Path size
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        // Row Size
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return countries.count
        }
        // Return cell (Like viewHolder)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row). : \(countries[indexPath.row])"
            return cell
        }

        // Select listener
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Selected Country : \(countries[indexPath.row])")
        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
                (contextualAction,view,boolValue) in
                print("delete data : \(self.countries[indexPath.row])")
            }
            let editAction = UIContextualAction(style: .normal, title: "Edit"){
                (contextualAction,view,boolValue) in
                print("edit data : \(self.countries[indexPath.row])")
            }
            return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        }

    }
    
    


