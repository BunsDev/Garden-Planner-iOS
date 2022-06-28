//
//  NavBars.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//

import SwiftUI


//MARK: - PlantView
struct NavBarPV: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        //MARK: - NavBar
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 60)
                    .foregroundColor(.darkGreen)
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(height: 25)
                    }
                    Spacer()
                    Button(action: {
                        gl.view = "Planner"
                    }) {
                        Image(systemName: "grid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        gl.view = "TasksAndNotifs"
                    }) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 27)
                    }
                    Spacer()
                }
            }
        }.padding([.leading, .trailing], 25)
    }
}


//MARK: - PlannerView
struct NavBarPlanV: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        //MARK: - NavBar
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 60)
                    .foregroundColor(.darkGreen)
                HStack {
                    Spacer()
                    Button(action: {
                        gl.view = "Plants"
                    }) {
                        Image(systemName: "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 25)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "grid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        gl.view = "TasksAndNotifs"
                    }) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.navGreen)
                            .frame(height: 27)
                    }
                    Spacer()
                }
            }
        }.padding([.leading, .trailing], 25)
    }
}


//MARK: - TasksAndNotifsView
struct NavBarTN: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 60)
                    .foregroundColor(.navGreen)
                HStack {
                    Spacer()
                    Button(action: {
                        gl.view = "Plants"
                    }) {
                        Image(systemName: "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(height: 25)
                    }
                    Spacer()
                    Button(action: {
                        gl.view = "Planner"
                    }) {
                        Image(systemName: "grid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(height: 26)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(height: 27)
                    }
                    Spacer()
                }
            }
        }.padding([.leading, .trailing], 25)
    }
}

