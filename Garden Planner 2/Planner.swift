//
//  PlannerView.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//

import SwiftUI

struct PlannerView_Preview: PreviewProvider {
    static var previews: some View  {
        Planner()
            .environmentObject(Global())
    }
}

struct Planner: View {
    
    @EnvironmentObject var gl: Global
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: - Button
                HStack {
                    Spacer()
                    Menu {
                        Button(action: {
                            gl.view = "CreateGarden"
                        }) {
                            Text("Create new garden")
                            Image(systemName: "plus")
                        }
                        Button(action: {
                            gl.view = "DeleteGarden"
                        }) {
                            Text("Delete a garden")
                            Image(systemName: "trash")
                        }
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22)
                    }.foregroundColor(.darkGreen)
                        .padding(.top, 20)
                }.padding([.leading, .trailing], 25)
                
                
                //MARK: - Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("Planner")
                            .font(.custom("Inter-Bold", size: 40))
                            .padding(.bottom, -1)
                        Text("Create new garden beds and edit existing ones.")
                            .font(.custom("Inter-SemiBold", size: 21))
                    }.foregroundColor(.darkGreen)
                        .padding(.top, -5)
                    Spacer()
                }.padding([.leading, .trailing], 25)
                    
                ScrollView {
                    ForEach(gl.beds, id: \.self) { bed in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 60)
                            .foregroundColor(.lightGreen)
                            .overlay(
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text(bed.name)
                                        Spacer()
                                        Button(action: {
//                                                gl.view = "GardenDetail"
                                        }) {
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 15)
                                        }
                                    }
                                    Spacer()
                                }.foregroundColor(.darkGreen)
                                    .font(.custom("Inter-Medium", size: 18))
                                    .padding([.leading, .trailing], 20)
                            ).padding([.leading, .trailing], 25)
                        
                    }.padding(.top, 15) //end foreach
                } //end scrollview
                
                Spacer()
            }
            NavBarPlanV()
        } //end zstack
    }
}

extension Planner {
    @MainActor class PlannerVM: ObservableObject {
        
    }
}

