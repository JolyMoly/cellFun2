//
//  SendMailVC.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 09.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import MessageUI

class SendMailVC: UIViewController, MFMailComposeViewControllerDelegate {
   
    @IBAction func sendMail(_ sender: Any) {
       
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let mailComposeViewController = configureMailController()
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        }
        else {
            showMailError()
            performSegue(withIdentifier: "backCell", sender: nil)
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureMailController() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        
        mailComposeVC.setToRecipients(["vsdorwork@gmail.com"])
        mailComposeVC.setSubject("Support")
        mailComposeVC.setMessageBody("Enter your message", isHTML: true)
        
        return mailComposeVC
    }
    
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Message", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
