//
//  HomeTableViewCell.swift
//  Table view
//
//  Created by MacOS on 15/12/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var descCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func contentCell(photo : UIImage , name : String , desc : String , price : Double){
        nameCell.text = name
        imageCell.image = photo
        descCell.text = desc
        priceCell.text = String(price)
    }

}
