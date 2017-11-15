//
//  bugReportVC.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 10.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import MessageUI


class bugReportVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let mailComposeViewController = configureMailController()
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        }
        else {
            showMailError()
            
            
            
        }
       
    }
    
    func configureMailController() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        
        mailComposeVC.setToRecipients(["vsdorwork@gmail.com"])
        mailComposeVC.setSubject("Bug Report")
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
