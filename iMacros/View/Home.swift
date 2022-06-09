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
                    //step 2 loop over and display added meals which are in coredata
                    ForEach(meals) { meal in
                        MealHabitView(meal: meal)
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
    //step 1 create a viewbuilder to display new meal
    @ViewBuilder
    func MealHabitView(meal: Meals) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(meal.title ?? "")
                    .font(.callout)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(width: 200, alignment: .leading)
                    .padding(.leading, 50)
                Spacer()
                Spacer()
                Image(systemName: "fork.knife")
                    .font(.callout)
                    .foregroundColor(Color(meal.color ?? "Card-1"))
                    .scaleEffect(0.9)
                    .padding(.trailing, 65)
                    
            }
            .padding(.horizontal, 15)
            //DIVIDER
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
                .opacity(0.5)
                .padding(.vertical)
            VStack(spacing:0) {
                HStack(alignment: .top) {
                    Text("Protein")
                        .font(.body)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .frame(width: 322, height: 40, alignment: .leading)
                    Text(meal.protein ?? "")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .frame(width: 40, height: 40)
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.vertical)
                HStack {
                    Text("Calories")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .frame(width: 322, height: 10, alignment: .leading)
                    
                    Text(meal.calories ?? "")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .frame(width: 40, height: 40)
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical,10)
        .padding(.horizontal, 15)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color("TFBG").opacity(0.5))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
