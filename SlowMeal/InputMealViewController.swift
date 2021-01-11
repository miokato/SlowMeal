//
//  InputMealViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import RealmSwift

class InputMealViewController: UIViewController {

    @IBOutlet weak var inputMealTextField: UITextField!
    
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        inputMealTextField.delegate = self

    }
    
    @IBAction func pressedRegisterBtn(_ sender: UIButton) {
        guard let mealName = inputMealTextField.text else {
            return
        }
        if mealName != "" {
            let meal = Meal()
            meal.name = mealName
            
            try! realm.write {
                realm.add(meal)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension InputMealViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
