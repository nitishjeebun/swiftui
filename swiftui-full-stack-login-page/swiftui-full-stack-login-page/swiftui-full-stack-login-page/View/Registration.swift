//
//  Registration.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/21/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Registration: View {
    
    @State var images: [Data] = [Data(), Data(), Data(), Data()]
    @State var showImagePicker: Bool = false
    @State var imageIndex: Int = 0
    @State var showProfile: Bool = false
    @Environment(\.presentationMode) var present
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ProfileCreation(images: self.$images), isActive: self.$showProfile) {
                Text("")
            }
            VStack(spacing: 35) {
                HStack {
                    Button(action: {
                        self.present.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    Text("Create a Profile for You")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                HStack(spacing: 15) {
                    Button(action: {
                        self.imageIndex = 0
                        self.showImagePicker.toggle()
                    }) {
                        ZStack {
                            if self.images[0].count == 0 {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color1"))
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                            } else {
                                Image(uiImage: UIImage(data: self.images[0])!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 100)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(height: 100)
                    }
                    Button(action: {
                        self.imageIndex = 1
                        self.showImagePicker.toggle()
                    }) {
                        ZStack {
                            if self.images[1].count == 0 {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color1"))
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                            } else {
                                Image(uiImage: UIImage(data: self.images[1])!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 100)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(height: 100)
                    }
                }
                HStack(spacing: 15) {
                    Button(action: {
                        self.imageIndex = 2
                        self.showImagePicker.toggle()
                    }) {
                        ZStack {
                            if self.images[2].count == 0 {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color1"))
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                            } else {
                                Image(uiImage: UIImage(data: self.images[2])!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 100)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(height: 100)
                    }
                    Button(action: {
                        self.imageIndex = 3
                        self.showImagePicker.toggle()
                    }) {
                        ZStack {
                            if self.images[3].count == 0 {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color1"))
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                            } else {
                                Image(uiImage: UIImage(data: self.images[3])!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 100)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(height: 100)
                    }
                }
                Button(action: {
                    self.showProfile.toggle()
                }) {
                    Text("Proceed")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .padding(.top, 25)
                .opacity(self.verifyImage() ? 1 : 0.35)
                .disabled(self.verifyImage() ? false : true)
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(showPicker: self.$showImagePicker,
                        imageData: self.$images[self.imageIndex]
            )
        }
    }
    
    func verifyImage() -> Bool {
        for image in self.images {
            if image.count == 0 {
                return false
            }
        }
        return true
    }
    
}



