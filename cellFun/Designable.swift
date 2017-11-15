//
//  TableViewCell.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 05.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//
import UIKit


class CIRoundedImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
    }
}

