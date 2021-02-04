//
//  CustomButton.swift
//  TestProjectWithCamera
//
//  Created by Oleg Granchenko on 03.02.2021.
//

import SwiftUI

struct CustomButton: View {
    
    var action: () -> Void
    var image: String
    var isVStack: Bool = true
    
    var body: some View {
        if isVStack {
            Button(action: { action() }, label: {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(.white)
            })
        } else {
            Button(action: { action() }, label: {
                VStack {
                    Image(systemName: image)
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Circle()
                        .foregroundColor(.yellow)
                        .frame(width: 8, height: 8)
                }
            })
        }
    }
}

struct TextCustomButton: View {
    
    var action: () -> Void
    var text: String
    var color: Color = .white
    var vSpacing: CGFloat = 0
    var hSpacing: CGFloat = 0
    var bgColor: Color = .gray
    
    var body: some View {
        Button(action: { action() }, label: {
            Text(text)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(color)
                .padding(.vertical, vSpacing)
                .padding(.horizontal, hSpacing)
                .background(bgColor)
        })
        .cornerRadius(3)
    }
}
