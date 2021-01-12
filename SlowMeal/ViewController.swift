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
    
    @IBOutlet weak var tableView: UITableView!
    var realm: Realm!

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        tableView.delegate = self
        tableView.dataSource = self
                       
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
        
        // UI
        messageLabel.text = Constants.USER_NOTIFY_BODY
        
    }
    
    @IBAction func pressedAddBtn(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SEGUE_ID_INPUT_MODAL, sender: nil)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let allData = realm.objects(Meal.self)
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meals = realm.objects(Meal.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = meals[indexPath.row].name
        return cell
    }
}
