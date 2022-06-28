//
//  CreateFolderView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI

struct DeleteGarden_Preview: PreviewProvider {
    static var previews: some View {
        DeleteGarden()
            .environmentObject(Global())
    }
}

struct DeleteGarden: View {
    
    @EnvironmentObject var gl: Global
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: - Header
            VStack(alignment: .leading) {
                Text("Delete a Garden")
                    .font(.custom("Inter-Bold", size: 40))
                    .padding(.bottom, -1)
                Text("Select a garden from the list below.")
                    .font(.custom("Inter-SemiBold", size: 21))
            } .padding(.top, -5)
            
            
            //MARK: - Select/Deselect
            HStack {
                Spacer()
                if allDeselected() {
                    Button(action: {
                        selectAll()
                    }) {
                        Text("Select All")
                            .font(.custom("Inter-Medium", size: 17))
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 7)
                            .background(Color.lightGreen)
                            .foregroundColor(.darkGreen)
                            .cornerRadius(20)
                    }
                } else {
                    Button(action: {
                        deselectAll()
                    }) {
                        Text("Deselect All")
                            .font(.custom("Inter-Medium", size: 17))
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 7)
                            .background(Color.lightGreen)
                            .foregroundColor(.darkGreen)
                            .cornerRadius(20)
                    }
                }
            }.padding(.top, 10)
                .padding(.trailing, 6)
            
            
            //MARK: - Folders
            VStack(alignment: .leading) {
                ForEach(gl.beds, id: \.self) { bed in
                    Button(action: {
                        let i = gl.beds.firstIndex(where: {$0.name == bed.name})
                        if !gl.beds[i!].selected {
                            gl.beds[i!].selected = true
                        } else {
                            gl.beds[i!].selected = false
                        }
                    }) {
                        HStack {
                            ZStack {
                                Image(systemName: bed.selected ? "circle.fill" : "circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.lightGreen)
                                Image(systemName: bed.selected ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.darkGreen)
                            }.frame(height: 25)
                                .padding(.trailing, 8)
                            Text(bed.name)
                                .font(.custom("Inter-Medium", size: 25))
                        }
                    }
                }
            }.padding(.top, 15)
                .padding(.leading, 5)
            
            
            //MARK: - Buttons
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        removeSelected()
                        gl.view = "Planner"
                    }) {
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("Delete")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-SemiBold", size: 20))
                            )
                    }
                    Spacer()
                }.padding(.bottom, 20)
                Button(action: {
                    gl.view = "Planner"
                }) {
                    Text("Cancel")
                        .font(.custom("Inter-SemiBold", size: 17))
                }.padding(.bottom, 15)
            }
            
            
        }.padding([.leading, .trailing], 25)
            .padding(.top, 50)
            .foregroundColor(.darkGreen)
    }
}

extension DeleteGarden {
    func selectAll() {
        for bed in gl.beds {
            let i = gl.beds.firstIndex(where: {$0 == bed})
            gl.beds[i!].selected = true
        }
    }
    func allDeselected() -> Bool {
        for bed in gl.beds {
            if bed.selected{
                return false
            }
        }
        return true
    }
    func deselectAll() {
        for bed in gl.beds {
            let i = gl.beds.firstIndex(where: {$0 == bed})
            gl.beds[i!].selected = false
        }
    }
    func removeSelected() {
        for bed in gl.beds {
            if bed.selected {
                gl.beds.removeAll(where: {$0 == bed})
            }
        }
    }
}

