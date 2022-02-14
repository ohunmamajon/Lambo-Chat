//
//  Messages.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//

import Foundation
struct Message {
    var sender = String()
    var body = String()
    init(sender: String, body: String){
        self.sender = sender
        self.body = body
    }
}
