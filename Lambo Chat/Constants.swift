//
//  Constants.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//


struct K {
    static let appName = "⎳amboChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let SignUpSegue = "SignUpToChat"
    static let SignInSegue = "SignInToChat"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
