//
//  MealViewModel.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI
import CoreData

class MealViewModel: ObservableObject {
    //MARK: - create  meal properties
    @Published var addNewMeal: Bool = false
    @Published var title: String = ""
    @Published var mealColor: String = "Card-1"
    @Published var weekDays: [String] = []
    @Published var isReminderOn: Bool = false
    @Published var reminderText: String = ""
    @Published var reminderDate: Date = Date()
    @Published var calories: String = ""
    @Published var totalCalories: String = ""
    @Published var protein: String = ""
    @Published var totalProtein: String = ""

    func addNewMeal(context: NSManagedObjectContext) -> Bool {
        let meal = Meals(context: context)
        meal.title = title
        meal.color = mealColor
        meal.protein = protein
        meal.totalProtein = totalProtein
        meal.calories = calories
        meal.totalCalories = totalCalories
        if let _ = try? context.save() {
            return true
        }
        
        return false
    }

    func resetData() {
        title = ""
        mealColor = "Card-1"
        protein = ""
        totalProtein = ""
        calories = ""
        totalCalories = ""
    }

    func doneStatus() -> Bool {
        if title == "" || protein == "" || calories == "" {
            return false
        }
        return true
    }
    
    
}
