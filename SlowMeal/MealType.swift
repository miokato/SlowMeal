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
    case All = "全部"
    
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
    
    func next() -> MealType {
        switch self {
        case .BreakFast:
            return .Lunch
        case .Lunch:
            return .Dinner
        case .Dinner:
            return .Other
        case .Other:
            return .All
        case .All:
            return .BreakFast
        }
    }
}

