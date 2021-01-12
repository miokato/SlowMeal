//
//  ViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                       
        UserNotifMaker.shared.add(title: "朝ごはん",
                                  body: Constants.USER_NOTIFY_BODY,
                                  hour: Constants.BREAKFAST_HOUR,
                                  minute: Constants.BREAKFAST_MINUTE)
        UserNotifMaker.shared.add(title: "お昼ごはん",
                                  body: Constants.USER_NOTIFY_BODY,
                                  hour: Constants.LUNCH_HOUR,
                                  minute: Constants.LUNCH_MINUTE)
        UserNotifMaker.shared.add(title: "晩ごはん",
                                  body: Constants.USER_NOTIFY_BODY,
                                  hour: Constants.DINNER_HOUR,
                                  minute: Constants.DINNER_MINUTE)
        
    }
    
    @IBAction func pressedAddBtn(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SEGUE_ID_INPUT_MODAL, sender: nil)
    }
}
