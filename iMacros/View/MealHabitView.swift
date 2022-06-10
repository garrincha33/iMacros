//
//  MealHabitView.swift
//  iMacros
//
//  Created by vedlai on 6/10/22.
//

import SwiftUI

struct MealHabitView: View {
    @ObservedObject var meal: Meals
    @ObservedObject var mealModel: MealViewModel
    var body: some View {
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
        .onTapGesture {
            mealModel.editingMeal = meal
            mealModel.restoreEditData()
            mealModel.addNewMeal.toggle()
        }
    }
}

struct MealHabitView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        
        MealHabitView(meal: .init(context: viewContext), mealModel: .init()).preferredColorScheme(.dark)
    }
}
