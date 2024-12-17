//
//  sectionViewController.swift
//  Table view
//
//  Created by MacOS on 16/12/2024.
//

import UIKit

class sectionViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrSection = ["A", "D", "F"]
    var arrRow = [["Ahmed","Amjed","Anwer"],["deeba","dalia"],["Fady","fatma","fwzi"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    
    // Header of Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrSection[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(arrSection[section]) Footer"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRow[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRow", for: indexPath)
        cell.textLabel?.text = arrRow[indexPath.section][indexPath.row]
        return cell
    }
    
    
    //right swip
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.arrRow[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .automatic)
            
            print("Delete")
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
    
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // left swip
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            print("Edit")
            completionHandler(true)
        }
        editAction.image = UIImage(systemName: "pencil")
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    

}
