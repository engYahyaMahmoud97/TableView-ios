//
//  AddNameViewController.swift
//  Table view
//
//  Created by MacOS on 15/12/2024.
//

import UIKit

class AddNameViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    //to edit elements of table view
    @IBAction func clickEditBtn(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        
    }
    
    //to move element of table view
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //to replace element of table view
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        names.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    //to right swipe of row
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, sourceView, completionHandler) in
            self.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
    
        let fevoriteAction = UIContextualAction(style: .normal, title: "") { (_, _, completionHandler) in
            let name = self.names[indexPath.row]
            print("\(name) add to favorite")
            completionHandler(true)
        }
        fevoriteAction.image = UIImage(systemName: "heart.fill")
        return UISwipeActionsConfiguration(actions: [deleteAction,fevoriteAction])
         
    }
    
    //to left swipe of row
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return nil
    }
    
    @IBAction func clickAddBtn(_ sender: Any) {
        let name = textFieldName.text!
        if !name.isEmpty {
//            names.append(name)
            names.insert(name, at: 0)   //to add first index
            textFieldName.text = ""
            tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    

}
