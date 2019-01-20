//
//  MyTableViewCell.swift
//  Cat Facts
//
//  Created by Vadym Sushko on 1/18/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var factTextLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView! {
        didSet {
            myImage.layer.cornerRadius = 10
            myImage.layer.borderWidth = 2
            myImage.layer.borderColor = #colorLiteral(red: 0.3059824705, green: 0.3754618168, blue: 0.8053939939, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
