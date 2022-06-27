//
//  PlannerView.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//

import SwiftUI

struct PlannerView_Preview: PreviewProvider {
    static var previews: some View  {
        PlannerView()
    }
}

struct PlannerView: View {
    
    @ObservedObject var g = Garden()
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack {
                    
                    //MARK: - Button
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
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
                            Text("The weather in Amesbury, MA is 73ºF and partly cloudy.")
                                .font(.custom("Inter-SemiBold", size: 21))
                        }.foregroundColor(.darkGreen)
                            .padding(.top, -5)
                        Spacer()
                    }.padding([.leading, .trailing], 25)
                    
                    
                
                    ForEach(g.beds, id: \.self) { bed in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 120)
                            .foregroundColor(.lightGreen)
                            .overlay(
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(bed.name)
                                            .font(.custom("Inter-Medium", size: 20))
                                            .foregroundColor(.darkGreen)
                                            .padding(.top, 15)
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            
                                        }) {
                                            Text("edit")
                                                .font(.custom("Inter-Medium", size: 17))
                                                .foregroundColor(.darkGreen)
                                                .padding(.bottom, 15)
                                        }
                                    }
                                }.padding([.leading, .trailing], 20)
                            ).padding([.leading, .trailing], 25)
                        
                    }.padding(.top, 15) //end foreach
                } //end scrollview
                
                Spacer()
            }
            NavBarPlanV()
        } //end zstack
    }
}

extension PlannerView {
    @MainActor class PlannerVM: ObservableObject {
        
    }
}

class Garden: ObservableObject {
    @Published var beds = [gardenBed(name: "Garden Bed 1", width: 4, height: 6, contents: [getTestCrop()])]
}

struct gardenBed: Hashable {
    var name: String
    var width: Int
    var height: Int
    var contents: [crop]
}
