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
                
                //MARK: - Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(gl.passBed.name)")
                            .font(.custom("Inter-Bold", size: 37))
                    }.foregroundColor(.darkGreen)
                    Spacer()
                }
                
                //MARK: - Grid
                
                GeometryReader { geometry in
                    
                    let w = 5
                    let h = 3
                    
                    HStack {
                        Spacer()
                        ForEach(0..<w, id: \.self) { row in
                            VStack(alignment: .center) {
                                ForEach(0..<h, id: \.self) { col in
                                    if w > h {
                                        Rectangle()
                                            .frame(width: CGFloat(geometry.size.width / CGFloat(w)), height: CGFloat(geometry.size.width / CGFloat(w)))
                                            .foregroundColor(.gray2)
                                            .cornerRadius(3)
                                            .padding(.all, -2.5)
                                    } else {
                                        if h >= (w * 2) {
                                            Rectangle()
                                                .frame(width: CGFloat(geometry.size.height / CGFloat(h)), height: CGFloat(geometry.size.height / CGFloat(h)))
                                                .foregroundColor(.gray2)
                                                .cornerRadius(3)
                                                .padding(.all, -2.5)
                                        } else {
                                            Rectangle()
                                                .frame(width: CGFloat(geometry.size.width / CGFloat(w)), height: CGFloat(geometry.size.width / CGFloat(w)))
                                                .foregroundColor(.gray2)
                                                .cornerRadius(3)
                                                .padding(.all, -2.5)
                                        }
                                    }
                                } //end col foreach
                            } //end vstack
                        } //end row foreach
                        Spacer()
                    } //end hstack
                }
                
                Spacer()
            }.padding([.leading, .trailing], 25)
        }
    }
}

extension GardenDetail {
    @MainActor class GardenDetailVM: ObservableObject {
        var horizontalSpacing: CGFloat = 48
        var verticalSpacing: CGFloat = 48
    }
}

struct GridView: View {

    let rows: CGFloat
    let cols: CGFloat
    let gridColor: Color

    var body: some View {
    
        GeometryReader { geometry in
        
            let width = geometry.size.width
            let height = geometry.size.height
            let xSpacing = width / cols
            let ySpacing = height / rows
        
            Path { path in
            
                for index in 0...Int(cols) {
                    let vOffset: CGFloat = CGFloat(index) * xSpacing
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: height))
                }
                for index in 0...Int(rows) {
                    let hOffset: CGFloat = CGFloat(index) * ySpacing
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: width, y: hOffset))
                }
            }
            .stroke(gridColor)
        }
    }
}
