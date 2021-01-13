//
//  DetailMealViewController.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/13.
//

import UIKit

class DetailMealViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mainMealLabel: UILabel!
    @IBOutlet weak var subMealLabel: UILabel!
    
    var dateText: String?
    var mainMealText: String?
    var subMealText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = "日付: \(dateText ?? "")"
        mainMealLabel.text = "主菜: \(mainMealText ?? "")"
        subMealLabel.text = "副菜: \(subMealText ?? "")"
    }
}
