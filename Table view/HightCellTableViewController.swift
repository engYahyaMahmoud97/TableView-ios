//
//  HightCellTableViewController.swift
//  Table view
//
//  Created by MacOS on 16/12/2024.
//

import UIKit

class HightCellTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrImage = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRow", for: indexPath) as! CellHightCellTableTableViewCell
        cell.imageCell.image = arrImage[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let photo = arrImage[indexPath.row]
        let percent = photo!.size.width / photo!.size.height
        
        
        return tableView.frame.width / percent
    }

}
