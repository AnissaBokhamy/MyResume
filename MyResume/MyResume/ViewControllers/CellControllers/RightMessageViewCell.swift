//
//  RightMessageViewCell.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 03/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import UIKit

class RightMessageViewCell: UITableViewCell {

    @IBOutlet weak var speakerProfilePictureView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
