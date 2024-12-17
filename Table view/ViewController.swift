//
//  ViewController.swift
//  Table view
//
//  Created by MacOS on 14/12/2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var arrayName : [String] = ["Ahmed", "Ali", "Saleem","mostafa","emad","osama"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayName[indexPath.row ]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayName[indexPath.row])
    }

}

