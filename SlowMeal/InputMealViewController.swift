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
    @IBOutlet weak var inputSubMealTextField: UITextField!
    
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        inputMealTextField.delegate = self
        inputSubMealTextField.delegate = self

    }
    
    @IBAction func pressedRegisterBtn(_ sender: UIButton) {
        guard let mealName = inputMealTextField.text,
              let subMealName = inputSubMealTextField.text else {
            return
        }
        if mealName != "" {
            let meal = Meal()
            meal.name = mealName
            meal.subMealName = subMealName
            let date = Date()
            meal.date = date
            meal.mealType = MealType.getType(fromTime: Calendar.current.component(.hour, from: date)).rawValue            
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
