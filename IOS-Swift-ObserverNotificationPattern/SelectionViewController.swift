//
//  SelectionViewController.swift
//  IOS-Swift-ObserverNotificationPattern
//
//  Created by Pooya on 2018-10-07.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func appleAct(_ sender: UIButton) {
        let name = Notification.Name(rawValue: appleNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func orangeAction(_ sender: UIButton) {
        let name = Notification.Name(rawValue: orangeNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)

        dismiss(animated: true, completion: nil)
    }

}
