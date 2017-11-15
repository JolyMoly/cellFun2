//
//  ContactTableViewController.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 03.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
var contacts = ["Me [+447092982705]", "Tim", "Mike"]
var myIndex = 0
class ContactTableViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    //2 preview methods
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let previewController = storyboard?.instantiateViewController(withIdentifier: "chatId")
        return previewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalViewController = storyboard?.instantiateViewController(withIdentifier: "chatId")
    }
    
    
    // long touch  preview
    @IBAction func long(_ sender: Any) {
        func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
            let previewController = storyboard?.instantiateViewController(withIdentifier: "chatId")
            return previewController
        }
        
        func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
            let finalViewController = storyboard?.instantiateViewController(withIdentifier: "chatId")
        }
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: view)
        }
        else {
            print("nothing should happen")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return contacts.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCellVC
        
        cell.nameLab?.text = contacts[indexPath.row]
        cell.myImage.image = UIImage(named: contacts[indexPath.row] + ".jpg")
    self.tableView.rowHeight = 80
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
   
}
