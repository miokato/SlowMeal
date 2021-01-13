//
//  MealType.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/13.
//

import UIKit


enum MealType: String {
    case BreakFast = "朝食"
    case Lunch = "昼食"
    case Dinner = "夕食"
    case Other = "間食"
    
    static func getType(fromTime: Int) -> Self {
        switch fromTime {
        case 7...9:
            return .BreakFast
        case 11...13:
            return .Lunch
        case 17...20:
            return .Dinner
        default:
            return .Other
        }
    }
}
