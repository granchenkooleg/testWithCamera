//
//  CameraView.swift
//  TestProjectWithCamera
//
//  Created by Oleg Granchenko on 03.02.2021.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject var cameraViewModel = CameraViewModel()
    
    var body: some View {
        ZStack {
            CameraPreview(camera: cameraViewModel)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 0) {
                if cameraViewModel.isTaken {
                    HStack {
                        TextCustomButton(action: {
                            cameraViewModel.reTake()
                        }, text: "Cancel", vSpacing: 10, bgColor: .clear)
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            CustomButton(action: {}, image: "square.and.arrow.up")
                            CustomButton(action: {}, image: "trash")
                            TextCustomButton(action: {
                                if !cameraViewModel.isSaved {
                                    cameraViewModel.savePic()
                                }
                            }, text: "Save", color: .yellow, vSpacing: 10, hSpacing: 5, bgColor: .clear)
                        }
                    }
                    .padding()
                    
                    HStack {
                        VStack(spacing: 0) {
                            Spacer()
                            
                            CustomButton(action: {}, image: "scribble").padding()
                            CustomButton(action: {}, image: "textbox").padding()
                            CustomButton(action: {}, image: "arrow.up.forward").padding()
                            CustomButton(action: {}, image: "crop.rotate", isVStack: false)
                                .padding(.horizontal)
                                .padding(.top)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 15) {
                            Spacer()
                            
                            CustomButton(action: {}, image: "rotate.right").padding()
                            TextCustomButton(action: {}, text: "original".uppercased(), vSpacing: 5, hSpacing: 10)
                            TextCustomButton(action: {}, text: "square".uppercased(), vSpacing: 5, hSpacing: 10)
                            TextCustomButton(action: {}, text: "16:9".uppercased(), vSpacing: 5, hSpacing: 10)
                            TextCustomButton(action: {}, text: "4:3".uppercased(), vSpacing: 5, hSpacing: 10)
                            
                            Spacer()
                        }
                        .padding(.trailing)
                    }
                    
                    Spacer()
                } else {
                    Spacer()
                    
                    Button(action: {
                        cameraViewModel.takePic()
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundColor(.white)
                            
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                        }
                    })
                    .padding(.bottom, 25)
                }
            }
        }
        .onAppear(perform: {
            cameraViewModel.check()
        })
        .alert(isPresented: $cameraViewModel.alert) {
            Alert(title: Text("Please Enable Camera Access"))
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
