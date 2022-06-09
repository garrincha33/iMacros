//
//  AddNewMeal.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI

struct AddNewMeal: View {
    @EnvironmentObject var mealModel: MealViewModel
    @Environment(\.self) var env
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                TextField("Title", text: $mealModel.title)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color("TFBG").opacity(0.4), in: RoundedRectangle(cornerRadius: 6, style: .continuous))
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
                .padding()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.vertical)
                HStack {
                    TextField("Protein", text: $mealModel.protein)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .keyboardType(.numberPad)
                    .background(Color("TFBG").opacity(0.4), in: RoundedRectangle(cornerRadius: 6, style: .circular))
                    Spacer()
                    TextField("Calories", text: $mealModel.calories)
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
            //step 6 update title if we re editing
            .navigationTitle(mealModel.editingMeal != nil ? "Edit Meal" : "Add New Meal")
            .toolbar {
                //step 5 delete button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if mealModel.deleteHabit(context: env.managedObjectContext) {
                            env.dismiss()
                        }
                    } label: {
                        Image(systemName: "trash")
                            
                    }
                    .tint(.red)
                    .opacity(mealModel.editingMeal == nil ? 0 : 1)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            
                    }
                    .tint(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if mealModel.addNewMeal(context: env.managedObjectContext) {
                            env.dismiss()
                        }
                    }
                    .tint(.white)
                    .disabled(!mealModel.doneStatus())
                    .opacity(mealModel.doneStatus() ? 1 : 0.6)
                }
            }
        }
    }
}

struct AddNewMeal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewMeal()
            .environmentObject(MealViewModel())
            .preferredColorScheme(.dark)
    }
}
