//
//  Meal.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import RealmSwift

class Meal: Object {
    @objc dynamic var name = ""
    @objc dynamic var subMealName = ""
    @objc dynamic var mealType = ""
    @objc dynamic var date: Date?
}
