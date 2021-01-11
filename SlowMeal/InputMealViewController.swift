//
//  InputMealViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit

class InputMealViewController: UIViewController {

    @IBOutlet weak var inputMealTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputMealTextField.delegate = self

    }
    
    @IBAction func pressedRegisterBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        print("prepare segue")
    }


}

extension InputMealViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
