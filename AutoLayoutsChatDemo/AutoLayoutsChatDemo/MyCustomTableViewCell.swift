//
//  MyCustomTableViewCell.swift
//  AutoLayoutsChatDemo
//
//  Created by Aasveen Kaur on 8/11/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit
import QuartzCore

class MyCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        message.sizeToFit()
         message.layer.masksToBounds = true
        message.layer.cornerRadius = 5
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.cornerRadius = 25
       
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
