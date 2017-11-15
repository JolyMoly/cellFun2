//
//  SettingsTableViewController.swift
//  
//
//  Created by Vsevolod Doroshenko on 06.11.2017.
//

import UIKit
import MessageUI
class SettingsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
   
    
    
    
    @IBOutlet var myTableView: UITableView!
    
    
    
    @IBOutlet weak var Social2: UITableViewCell!
    @IBOutlet weak var Social21: UITableViewCell!
    
    @IBOutlet weak var notificationsCell1: UITableViewCell!
    @IBOutlet weak var notificationCell2: UITableViewCell!
    
    @IBOutlet weak var otherCell1: UITableViewCell!
    @IBOutlet weak var otherCell2: UITableViewCell!
    @IBOutlet weak var otherCell3: UITableViewCell!
    @IBOutlet weak var otherCell4: UITableViewCell!
    @IBOutlet weak var otjerCell5: UITableViewCell!
    
    @IBOutlet weak var audioCell1: UIView!
    @IBOutlet weak var audioCell2: UITableViewCell!
    
    @IBAction func backGesture(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        
        myTableView.backgroundColor = UIColor.lightGray
        
        let color = 0x778899
        let redColor = 0xfc5356
       
       Social2.backgroundColor = UIColor(colorWithHexValue: redColor)
        Social21.backgroundColor = UIColor(colorWithHexValue: redColor)
        
        notificationsCell1.backgroundColor = UIColor(colorWithHexValue: redColor)
        notificationCell2.backgroundColor = UIColor(colorWithHexValue: redColor)
        
        otherCell1.backgroundColor = UIColor(colorWithHexValue: redColor)
         otherCell2.backgroundColor = UIColor(colorWithHexValue: redColor)
         otherCell3.backgroundColor = UIColor(colorWithHexValue: redColor)
         otherCell4.backgroundColor = UIColor(colorWithHexValue: redColor)
         otjerCell5.backgroundColor = UIColor(colorWithHexValue: redColor)
        
        audioCell1.backgroundColor = UIColor(colorWithHexValue: redColor)
        audioCell2.backgroundColor = UIColor(colorWithHexValue: redColor)
    }
    
    
}



extension UIColor {
    convenience  init(colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
