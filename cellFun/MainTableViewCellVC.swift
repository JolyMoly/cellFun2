//
//  MainTableViewCellVC.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 05.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class MainTableViewCellVC: UITableViewCell {

    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          myImage.layer.cornerRadius = myImage.frame.width / 2
        myImage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        
    }

}
