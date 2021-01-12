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
        
    }
    
    @IBAction func pressedAddBtn(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SEGUE_ID_INPUT_MODAL, sender: nil)
    }
}
