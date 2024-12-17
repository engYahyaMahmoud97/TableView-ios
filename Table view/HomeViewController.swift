//
//  HomeViewController.swift
//  Table view
//
//  Created by MacOS on 15/12/2024.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    var fruits: [Fruit] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCellToTableView()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_home") as! HomeTableViewCell
        let cellRow = fruits[indexPath.row]
        cell.contentCell(photo: cellRow.photo, name: cellRow.name, desc: cellRow.description, price: cellRow.price )
        
        //to click button like
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print("like button tapped \(sender.tag)")
        
        var imageNameSelect = sender.currentImage
        if imageNameSelect == UIImage(systemName: "heart.fill") {
            imageNameSelect = UIImage(systemName: "heart")
        } else {
            imageNameSelect = UIImage(systemName: "heart.fill")
        }
        
        sender.setImage(imageNameSelect, for: .normal)
    }
    

    
    func addCellToTableView() {
        fruits.append(Fruit.init(name: "apple", price: 13, photo: UIImage(named: "apple")!, description: "apple fruit is good "))
        fruits.append(Fruit.init(name: "bnana", price: 33, photo: UIImage(named: "bnana")!, description: "bnana fruit is good "))
        fruits.append(Fruit.init(name: "grapes", price: 23, photo: UIImage(named: "grapes")!, description: "grapes fruit is good grapes fruit is good grapes fruit is good grapes fruit is good"))
        fruits.append(Fruit.init(name: "mango", price: 11, photo: UIImage(named: "mango")!, description: "mango fruit is good "))
        fruits.append(Fruit.init(name: "pear", price: 20, photo: UIImage(named: "pear")!, description: "pear fruit is good "))
    }
    
}
struct Fruit {
    var name: String
    var price: Double
    var photo: UIImage
    var description: String
}
