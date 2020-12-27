//
//  ChatViewController.swift
//  
//
//  Created by Jessie Gibson on 12/26/20.
//

import UIKit
import MessageKit

//Supports tons of different message type.
struct Sender: SenderType {
    var senderId: String
    
    var displayName: String
}

struct Message: MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesDisplayDelegate, MessagesLayoutDelegate {

    let currentUser = Sender(senderId: "self", displayName: "Jessie Gibson")
    let otherUser = Sender(senderId: "other", displayName: "Other Person")
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("It's TIIIIIIIMMMEEE!")))
        messages.append(Message(sender: otherUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-84400),
                                kind: .text("No it is not!!")))
        messages.append(Message(sender: currentUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-70400),
                                kind: .text("Yesss... It's TIIIIIIIMMMEEE!")))
        messages.append(Message(sender: otherUser,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-60400),
                                kind: .text("Get a life!")))
        messages.append(Message(sender: currentUser,
                                messageId: "5",
                                sentDate: Date().addingTimeInterval(-40400),
                                kind: .text("This is the worst type of app. I am not sure when this is happening. ")))

        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
     func numberOfSections(in collectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    

}
