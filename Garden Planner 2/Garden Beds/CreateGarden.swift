//
//  CreateGardenView.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//


import SwiftUI

struct CreateGarden_Preview: PreviewProvider {
    static var previews: some View {
        CreateGarden()
            .environmentObject(Global())
    }
}

struct CreateGarden: View {
    
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = CreateGardenVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: - Header
            VStack(alignment: .leading) {
                Text("Create a Garden")
                    .font(.custom("Inter-Bold", size: 40))
                    .padding(.bottom, -1)
                Text("Pick a name and set the size to get started.")
                    .font(.custom("Inter-SemiBold", size: 21))
            }
            .foregroundColor(.darkGreen)
                .padding(.top, -5)
            
            
            //MARK: - Name
            Group {
                if !vm.noNameError {
                Text("NAME")
                    .font(.custom("Inter-SemiBold", size: 16))
                    .foregroundColor(.accentColor)
                    .padding(.top, 20)
                } else {
                    Text("NAME: CAN'T BE BLANK")
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundColor(Color("redish"))
                        .padding(.top, 20)
                }
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("gray1"))
                    .frame(height: 50)
                    .overlay(
                        TextField("Ex: Corner Garden Bed", text: $vm.name)
                            .padding([.leading, .trailing], 15)
                    )
            }
            
            //MARK: - Size
            Text("DIMENSIONS (FT)")
                .font(.custom("Inter-SemiBold", size: 16))
                .foregroundColor(.accentColor)
                .padding(.top, 20)
            
            //MARK: - Width
            VStack(alignment: .center) {
                Text("Width")
                    .font(.custom("Inter-Medium", size: 17))
                    .foregroundColor(.accentColor)
                HStack {
                    Spacer()
                    Button(action: {
                        if vm.width > 1 {
                            vm.width -= 1
                        }
                    }) {
                       minus()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 65, height: 65)
                            .foregroundColor(.gray1)
                        Text("\(CGFloat(vm.width), specifier: "%.0f")")
                            .font(.custom("Inter-Medium", size: 20))
                    }
                    Button(action: {
                        if vm.width < 12 {
                            vm.width += 1
                        }
                    }) {
                        plus()
                    }
                    Spacer()
                }
            }.padding(.top, 15)
            
            //MARK: - Height
            VStack(alignment: .center) {
                Text("Height")
                    .font(.custom("Inter-Medium", size: 17))
                    .foregroundColor(.accentColor)
                HStack {
                    Spacer()
                    Button(action: {
                        if vm.height > 1 {
                            vm.height -= 1
                        }
                    }) {
                        minus()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 65, height: 65)
                            .foregroundColor(.gray1)
                        Text("\(CGFloat(vm.height), specifier: "%.0f")")
                            .font(.custom("Inter-Medium", size: 20))
                    }
                    Button(action: {
                        if vm.height < 12 {
                            vm.height += 1
                        }
                    }) {
                        plus()
                    }
                    Spacer()
                }
            }.padding(.top, 10)
            Spacer()
            
            //MARK: - Buttons
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        if vm.name.isEmpty {
                            vm.noNameError = true
                        } else {
                            gl.beds.append(gardenBed(name: vm.name, width: vm.width, height: vm.height, contents: [], selected: false))
                            gl.view = "Planner"
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundColor(.darkGreen)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("Create")
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
                        .foregroundColor(.darkGreen)
                }.padding(.bottom, 15)
            }
            
            
        }.padding([.leading, .trailing], 25)
            .padding(.top, 50)
    }
}

extension CreateGarden {
    @MainActor class CreateGardenVM: ObservableObject {
        @Published var name = ""
        @Published var noNameError = false
        @Published var width = 1
        @Published var height = 1
    }
}


struct plus: View {
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
                .padding([.leading, .trailing], 10)
                .foregroundColor(.lightGreen)
            Image(systemName: "plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 16)
                .foregroundColor(.darkGreen)
        }
    }
}

struct minus: View {
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
                .padding([.leading, .trailing], 10)
                .foregroundColor(.lightGreen)
            Image(systemName: "minus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 2)
                .foregroundColor(.darkGreen)
        }
    }
}
