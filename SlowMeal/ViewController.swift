//
//  ViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import UserNotifications
import RealmSwift

class ViewController: UIViewController {
    
    var realm: Realm!

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        let allData = realm.objects(Meal.self)
        print(allData.count)
        for data in allData {
            print(data.name)
        }
        print(allData)
        
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
        
        messageLabel.text = Constants.USER_NOTIFY_BODY
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: Constants.SEGUE_ID_INPUT_MODAL, sender: nil)
    }
}

