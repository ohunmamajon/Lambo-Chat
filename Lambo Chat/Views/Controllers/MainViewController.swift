//
//  MainViewController.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//

import UIKit
import CLTypingLabel

class MainViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
        
        // Do any additional setup after loading the view.
    }
    
}





    
