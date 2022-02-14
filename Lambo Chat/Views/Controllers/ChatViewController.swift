//
//  ChatViewController.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//

import UIKit
import Firebase



class ChatViewController: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageTextfield: UITextField!
    var messages = [ Message(sender: "lambo@1.com", body: "Hey, whats up?"), Message(sender: "lambo@2.com" , body: "Hey, How is it hanging?"), Message(sender: "lambo@1.com", body: "Same old, same old bruh!")  ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = K.appName
        tableView.register( UINib(nibName: K.cellNibName, bundle: nil)  , forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    
    }
    
    func loadMessages(){
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            self.messages = []
            if let e = error {
                print ("error retrieving data")
            } else {
                if let snapShotDocuments = querySnapshot?.documents {
                    for doc in snapShotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                           
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    
    

    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody, K.FStore.dateField: Date().timeIntervalSince1970 ]) { error in
                if let e = error {
                    print("error addind data")
                } else {
                    print ("succesfully saved data")
                   
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                   
                }
            }
        
    }
    

 }
    
    
    @IBAction func logOutPressed(_ sender: Any) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
          
        }
        
    }
    


extension ChatViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = message.body
     
    if message.sender == Auth.auth().currentUser?.email {
        cell.leftImageView.isHidden = true
        cell.rightImageView.isHidden = false
        cell.messageBubble.backgroundColor = UIColor(named: "LightGreen")
        cell.label.textColor = UIColor.black
    } else {
        cell.leftImageView.isHidden = false
        cell.rightImageView.isHidden = true
        cell.messageBubble.backgroundColor = UIColor.white
        cell.label.textColor = UIColor.black
    }
        
        return cell
    }
    
    
}


