//
//  RefreshViewController.swift
//  Table view
//
//  Created by MacOS on 16/12/2024.
//

import UIKit

class RefreshViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    var array : [String] = []
    let refreshView = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        refreshView.addTarget(self, action: #selector (refresh), for: .valueChanged)
        tableView.addSubview(refreshView)
        
        
    }
    
    @objc func refresh() {
        array.append("value \(array.count)")
        tableView.reloadData()
        refreshView.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRow", for: indexPath)
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }

}
