//
//  ViewController.swift
//  IOS-Swift-ObserverNotificationPattern
//
//  Created by Pooya on 2018-10-07.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

let appleNotificationKey = "co.pooya.apple"
let orangeNotificationKey = "co.pooya.orange"

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var goBtn: UIButton!
    
    let apple = Notification.Name(rawValue: appleNotificationKey)
    let orange = Notification.Name(rawValue: orangeNotificationKey)

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBtn.layer.cornerRadius = goBtn.frame.size.height/2
        createObservers()
    }

    func createObservers() {
        //apple
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateViewImage(notification:)), name: apple, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updatetitleView(notification:)), name: apple, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTextView(notification:)), name: apple, object: nil)
        //orange
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateViewImage(notification:)), name: orange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updatetitleView(notification:)), name: orange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTextView(notification:)), name: orange, object: nil)
    }
    
    @objc func updateViewImage(notification : Notification){
        let isApple = notification.name == apple
        let image = isApple ? UIImage(named: "apple")! : UIImage(named: "orange")!
        imageView.image = image
        
    }

    @objc func updatetitleView(notification : Notification){
        let isApple = notification.name == apple
        let oneText = isApple ? "Apple" : "Orange"
        titleView.text = oneText

    }

    @objc func updateTextView(notification : Notification){
        let isApple = notification.name == apple
        let oneText = isApple ? "An apple is a sweet, edible fruit produced by an apple tree." : "he orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae."
        textView.text = oneText

    }

    @IBAction func goAct(_ sender: UIButton) {
        let SelectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionPage") as! SelectionViewController
        present(SelectionVC,animated: true, completion: nil)
    }

}

