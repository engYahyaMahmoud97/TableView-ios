//
//  NoDataViewController.swift
//  Table view
//
//  Created by MacOS on 16/12/2024.
//

import UIKit

class NoDataViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var arrCuntry = ["Palestin","Jordan","Oman","Eygpt"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrCuntry.removeAll()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if arrCuntry.count == 0 {
            tableView.isHidden = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCuntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRow", for: indexPath)
        cell.textLabel?.text = arrCuntry[indexPath.row]
        
        return cell
    }
    
}
