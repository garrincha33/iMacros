//
//  AddNewMeal.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI

struct AddNewMeal: View {
    //Step 5 create enviroment var for the view model
    @EnvironmentObject var mealModel: MealViewModel
    var body: some View {
        //step 6 create a navigationView with fields
        NavigationView {
            VStack(spacing: 15) {
                TextField("Title", text: $mealModel.title)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color("TFBG").opacity(0.4), in: RoundedRectangle(cornerRadius: 6, style: .continuous))
                //step 9 color picker for meal identity
                HStack(spacing: 0) {
                    ForEach(1...7, id: \.self) { index in
                        let color = "Card-\(index)"
                        Circle()
                            .fill(Color(color))
                        .frame(width: 30, height: 30)
                        .overlay(content: {
                            if color == mealModel.mealColor {
                                Image(systemName: "checkmark")
                            }
                        })
                        .onTapGesture {
                            withAnimation {
                                mealModel.mealColor = color
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                //step 10 padding and divder
                .padding()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.vertical)
                //step 11 add protein and calories text field
                HStack {
                    TextField("Protein", text: $mealModel.calories)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .keyboardType(.numberPad)
                    .background(Color("TFBG").opacity(0.4), in: RoundedRectangle(cornerRadius: 6, style: .circular))
                    Spacer()
                    TextField("Calories", text: $mealModel.protein)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .keyboardType(.numberPad)
                    .background(Color("TFBG").opacity(0.4), in: RoundedRectangle(cornerRadius: 6, style: .circular))
                }
                .padding()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.vertical)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add New Meal")
            //step 7 add tool bar item to close
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark.circle")
                            
                    }
                    .tint(.white)
                }
                //step 8 add tool bar item for done
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .tint(.white)
                }
            }
        }
    }
}

struct AddNewMeal_Previews: PreviewProvider {
    static var previews: some View {
        //Step 5 add view model for preview
        AddNewMeal()
            .environmentObject(MealViewModel())
            .preferredColorScheme(.dark)
    }
}
