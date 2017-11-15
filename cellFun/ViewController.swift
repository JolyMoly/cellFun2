//
//  ViewController.swift
//  cellFun
//
//  Created by Sebastian Hette on 04.04.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import CoreData
import JSQMessagesViewController
import AVFoundation

struct User{
    let id: String
    let name: String
}

class ViewController: JSQMessagesViewController {
    let user1 = User(id: "1", name:  "Me")
    let user2 = User(id: "2", name: "Tim")
    let user3 = User(id: "3", name: "Mike")
    
  
    
var curentUser: User{
       
      return user1
    }
 
    //messages
    
    var messages = [JSQMessage]()
}
extension ViewController{
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        
        messages.append(message!)
        
        finishSendingMessage()
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.row]
        let messageUsername = message.senderDisplayName
        
        return NSAttributedString(string: messageUsername!)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource!{
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        
        let message = messages[indexPath.row]
        if curentUser.id == message.senderId{
            
        return bubbleFactory?.outgoingMessagesBubbleImage(with: .lightGray)
        } else {
              return bubbleFactory?.incomingMessagesBubbleImage(with: .blue)
        }
        
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
}

extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
        self.senderId = curentUser.id
        self.senderDisplayName = curentUser.name
        
       self.messages =  getMessages()
    }
    
    
}


extension ViewController{
  

    
    func getMessages() -> [JSQMessage] {
        var users = [User]()
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        
        print(users)
        var messages = [JSQMessage]()
      
        let message1 = JSQMessage(senderId: user1.id, displayName: user1.name, text: "Hey, Tim!")
        let message2 = JSQMessage(senderId: users[myIndex].id, displayName: users[myIndex].name, text: "Hi, Steve!")
        let message3  = JSQMessage(senderId: users[myIndex].id, displayName: users[myIndex].name, text: "Test!")
        
        messages.append(message1!)
        messages.append(message2!)
        messages.append(message3!)
        
        return messages
    }
}


