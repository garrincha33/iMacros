//
//  MealViewModel.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI
import CoreData
//step 1 create a meal view model as a class
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
}
