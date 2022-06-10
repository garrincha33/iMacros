//
//  MealsExt.swift
//  iMacros
//
//  Created by vedlai on 6/10/22.
//

import Foundation
extension Array where Element == Meals {
    var sumProtein: Int{
        let values = self.compactMap{Int($0.protein ?? "0")}
        let sum = values.reduce(0, +)
        return sum
    }
    var sumCalories: Int{
        let values = self.compactMap{Int($0.calories ?? "0")}
        let sum = values.reduce(0, +)
        return sum
    }
}
