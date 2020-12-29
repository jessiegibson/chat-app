//
//  DatabaseManager.swift
//  MyMessages
//
//  Created by Jessie Gibson on 12/28/20.
//

import Foundation
import FirebaseDatabase

// final means that this class cannot be sub classed.
final class DatabaseManager{
    
        static let shared = DatabaseManager ()
        
        private let database = Database.database().reference()
    
    static func safeEmail(emailAddress: String) -> String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}

//Mark: - Account Management

extension DatabaseManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool)-> Void)){
        database.child(email).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })
    }
    
    /// Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
            // No need to add emailAddress because it is the key.
            
        ])
        
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with :"-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    //          let profilPictureUrl: String
}
    
    



