//
//  ViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let message = "よく噛んで３０分かけてゆっくりご飯を食べましょう。"
        UserNotifMaker.shared.add(title: "朝ごはん", body: message, hour: 8, minute: 00)
        UserNotifMaker.shared.add(title: "お昼ごはん", body: message, hour: 12, minute: 00)
        UserNotifMaker.shared.add(title: "晩ごはん", body: message, hour: 18, minute: 00)
        
        messageLabel.text = message
        
    }
    

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }


}

