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
                    }
                }
            ScrollView(meals.isEmpty ? .init() : .vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    Button {
                        //step 3 add a toggle for a new meal
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
                }
                .padding(.vertical)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .sheet(isPresented: $mealModel.addNewMeal) {
            //step 7 reset data
            mealModel.resetData()
        } content : {
            //step 5 add new meal view display
            AddNewMeal().environmentObject(mealModel)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
