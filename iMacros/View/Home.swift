//
//  Home.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI

struct Home: View {
    
    @FetchRequest(entity: Meals.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Meals.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var meals: FetchedResults<Meals>

    @StateObject var mealModel: MealViewModel = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("iMacros")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.bottom, 10)
            ScrollView(meals.isEmpty ? .init() : .vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(meals) { meal in
                        MealHabitView(meal: meal, mealModel: mealModel)
                    }
                    Button {
                        mealModel.addNewMeal.toggle()
                    } label: {
                        Label {
                            Text("Add Meal")
                        } icon: {
                            Image(systemName: "plus.circle")
                        }
                        .font(.callout.bold())
                        .foregroundColor(.white)
                    }
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white)
                        .opacity(0.5)
                        .padding(.vertical)
                    
                    showCaloriesAndProteinView(meals: Array(meals))

                }
                .padding(.vertical)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .sheet(isPresented: $mealModel.addNewMeal) {
            mealModel.resetData()
            
            
        } content : {
            AddNewMeal().environmentObject(mealModel)
            
        }
  
    }
    //MARK: -  TO DO sum of calories and protein to go here
    @ViewBuilder
    func showCaloriesAndProteinView(meals: [Meals]) -> some View {
        VStack {
            HStack(alignment: .center) {
                Text("Total Calories : \(meals.sumCalories)")
                Text("Total Protein : \(meals.sumProtein)")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

