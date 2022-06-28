//
//  GardenDetail.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//

import SwiftUI

struct GardenDetail_Preview: PreviewProvider {
    static var previews: some View {
        GardenDetail()
            .environmentObject(Global())
    }
}

struct GardenDetail: View {
    
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = GardenDetailVM()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        gl.view = "Planner"
                    }) {
                        Group {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .font(.custom("Inter-Medium", size: 17))
                        }
                    }
                    Spacer()
                    Menu {
                        Button(action: {
                            //gl.view = "SearchPlants
                        }) {
                            Text("Add plants")
                            Image(systemName: "plus")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 4)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 30, height: 10)
                    }
                }.foregroundColor(.darkGreen)
                    .padding(.top, 10)
                    .padding([.leading, .trailing], 25)
                
                //MARK: - Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(gl.passBed.name)")
                            .font(.custom("Inter-Bold", size: 37))
                    }.foregroundColor(.darkGreen)
                    Spacer()
                }.padding([.leading, .trailing], 25)
                
                
                //MARK: - Grid
                Group {
                    HStack {
                        ForEach(0..<gl.passBed.width, id: \.self) { row in
                            VStack(alignment: .center) {
                                ForEach(0..<gl.passBed.height, id: \.self) { col in
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.gray2)
                                        .aspectRatio(1.0, contentMode: .fit)
                                        .padding(-3)
                                }
                            }
                        }
                    }
                }.padding([.leading, .trailing], 25) //end hstack
                
                Spacer()
            }
        }
    }
}

extension GardenDetail {
    @MainActor class GardenDetailVM: ObservableObject {
        var horizontalSpacing: CGFloat = 48
        var verticalSpacing: CGFloat = 48
    }
}

